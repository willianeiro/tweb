﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Listagem.aspx.cs" Inherits="TWeb.Administracao.Prefeituras.Listagem" %>
<%@ Import Namespace="TWeb.Administracao.Util" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="busca-novo-div">
        <label for="nome">Nome</label> 
        <asp:TextBox ID="NomeBuscaTextBox" size="50" runat="server"  />
        <asp:Button runat="server" ID="BuscarButton"  CausesValidation="true" Text="Buscar" onclick="BuscaPrefeitura_Click" />
        <input type="button" value="Novo" onclick="window.location.href='manter.aspx'" />
    </div>

    <asp:GridView  ID="GridViewListarPreituras" runat="server" Width="100%"
        OnRowDataBound="GridViewListarPreituras_RowDataBound" AllowPaging="True" AutoGenerateColumns="False" 
        DataSourceID="ObjectDataSourceBuscarPrefeituras" CssClass="tabela-gridview">
        <Columns>
            <asp:TemplateField ItemStyle-Width = "80%">
                <HeaderTemplate>Nome da Prefeitura</HeaderTemplate>
                <ItemTemplate> 
                    <asp:HiddenField ID="Id"  runat="server" Value='<%#Eval("Id")%>'></asp:HiddenField>
                    <%# Eval("Nome") %>
             </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Aderencia" HeaderText="Aderência" SortExpression="Aderencia" ItemStyle-Width = "10%" />
            <asp:TemplateField ItemStyle-Width = "10%">
                <HeaderTemplate>Status</HeaderTemplate>
                <ItemTemplate> <%# StatusHelper.TraduzirStatus(Eval("StatusId")) %> </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        
    </asp:GridView>

    <asp:ObjectDataSource ID="ObjectDataSourceBuscarPrefeituras" runat="server" SelectMethod="BuscarPrefeituras" TypeName="TWeb.Administracao.Prefeituras.ListagemServico">
    </asp:ObjectDataSource>
    
</asp:Content>
