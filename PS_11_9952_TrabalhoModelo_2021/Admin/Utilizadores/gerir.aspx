<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="gerir.aspx.cs" Inherits="PS_11_9952_TrabalhoModelo_2021.Admin.Utilizadores.gerir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--listar e apagar utilizadores-->
    <!--Textbox para pesquisar com base nome de utilizador-->
    Utilizador:<asp:TextBox placeholder="Insira o nome do utilizador a pesquisar" CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button CssClass="btn btn-info" ID="Button1" runat="server" Text="Pesquisar" />
    <!--gridview-->
    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="nome" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
            <asp:BoundField DataField="nome" HeaderText="nome" ReadOnly="True" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="perfil" HeaderText="perfil" SortExpression="perfil"></asp:BoundField>
            <asp:BoundField DataField="Nome do Aluno" HeaderText="Nome do Aluno" SortExpression="Nome do Aluno"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM utilizadores WHERE (nome = @nome)" SelectCommand="SELECT utilizadores.nome, utilizadores.perfil, alunos.nome AS [Nome do Aluno] FROM utilizadores INNER JOIN alunos ON utilizadores.nprocesso = alunos.nprocesso WHERE (utilizadores.nome LIKE '%' + @nome + '%')">
        <DeleteParameters>
            <asp:Parameter Name="nome"></asp:Parameter>
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="nome"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
