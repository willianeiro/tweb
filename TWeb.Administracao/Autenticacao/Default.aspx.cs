﻿using System;
using System.Web.Security;

namespace TWeb.Administracao.Autenticacao
{
    public partial class Default : System.Web.UI.Page
    {
        private DefaultServico _defaultServico;

        public string Usuario
        {
            get { return UsuarioTextBox.Text; }
            set { UsuarioTextBox.Text = value; }
        }
        public string Senha
        {
            get { return SenhaTextBox.Text; }
            set { SenhaTextBox.Text = value; }
        }

        public string MenssagemDeErro { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
                Response.Redirect("../prefeituras/listagem.aspx", true);

            string returnUrl = Request["ReturnUrl"];

            if (returnUrl != null)
                Response.Redirect("../autenticacao/", true);
        }

        public Default()
        {
            _defaultServico = new DefaultServico();
        }

        protected void AutenticarUsuario_Click(object sender, EventArgs e)
        {
            if (UsuarioValido())
            {
                FormsAuthentication.SetAuthCookie(this.Usuario, true);
                Response.Redirect("../prefeituras/listagem.aspx");
            }
            else
            {
                MenssagemDeErro = "Usuário ou senha inválida.";
            }
        }

        private bool UsuarioValido()
        {
            if (String.IsNullOrEmpty(this.Usuario) || String.IsNullOrEmpty(this.Senha))
                return false;

            if (!_defaultServico.Autenticar(this))
                return false;

            return true;
        }
    }
}