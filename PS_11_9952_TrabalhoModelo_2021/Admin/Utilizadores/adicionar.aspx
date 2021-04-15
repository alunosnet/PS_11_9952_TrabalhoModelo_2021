<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="adicionar.aspx.cs" Inherits="PS_11_9952_TrabalhoModelo_2021.Admin.Utilizadores.adicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:FormView Width="100%" DefaultMode="Insert" ID="FormView1" runat="server" DataKeyNames="nome" DataSourceID="SqlUtilizadores">
        <EditItemTemplate>
            nome:
            <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel1" /><br />
            palavra_passe:
            <asp:TextBox Text='<%# Bind("palavra_passe") %>' runat="server" ID="palavra_passeTextBox" /><br />
            perfil:
            <asp:TextBox Text='<%# Bind("perfil") %>' runat="server" ID="perfilTextBox" /><br />
            nprocesso:
            <asp:TextBox Text='<%# Bind("nprocesso") %>' runat="server" ID="nprocessoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            nome:
            <asp:TextBox MaxLength="40" CssClass="form-control" Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" />
            <!--Validator obrigatório e não pode existir nome igual-->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="nomeTextBox" CssClass="alert alert-danger" Display="Dynamic"
                ErrorMessage="Tem de inserir um nome de utilizador"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                ControlToValidate="nomeTextBox" CssClass="alert alert-danger" Display="Dynamic"
                OnServerValidate="CustomValidator1_ServerValidate"
                ErrorMessage="Nome de utilizador já existe."></asp:CustomValidator>
            <br />
            Palavra passe:
            <asp:TextBox CssClass="form-control" TextMode="Password" Text='<%# Bind("palavra_passe") %>' runat="server" ID="palavra_passeTextBox" />
            <!--validator obrigatório -->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="palavra_passeTextBox" CssClass="alert alert-danger" Display="Dynamic"
                ErrorMessage="Tem de indicar uma password"></asp:RequiredFieldValidator>
            <br />
            Confirmar palavra passe:
            <asp:TextBox TextMode="Password" CssClass="form-control" ID="tbConfirmaPassword" runat="server"></asp:TextBox>
            <!--validator obrigatório e igual a password-->
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="tbConfirmaPassword" CssClass="alert alert-danger" Display="Dynamic"
                ErrorMessage="Tem de indicar a confirmação da password"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server"
                ControlToValidate="tbConfirmaPassword" CssClass="alert alert-danger" Display="Dynamic"
                ControlToCompare="palavra_passeTextBox" Type="String" Operator="Equal"
                ErrorMessage="As passwords não são iguais"></asp:CompareValidator>
            <br />
            Nº processo:
            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" SelectedValue='<%# Bind("nprocesso") %>' DataSourceID="SqlAlunos" DataTextField="nome" DataValueField="nprocesso"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT        alunos.nprocesso, alunos.nome,utilizadores.nprocesso
FROM            alunos LEFT JOIN
                         utilizadores ON alunos.nprocesso = utilizadores.nprocesso
where utilizadores.nprocesso is null"></asp:SqlDataSource>
            <br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            nome:
            <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /><br />
            palavra_passe:
            <asp:Label Text='<%# Bind("palavra_passe") %>' runat="server" ID="palavra_passeLabel" /><br />
            perfil:
            <asp:Label Text='<%# Bind("perfil") %>' runat="server" ID="perfilLabel" /><br />
            nprocesso:
            <asp:Label Text='<%# Bind("nprocesso") %>' runat="server" ID="nprocessoLabel" /><br />
            <asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlUtilizadores" 
        ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        InsertCommand="INSERT INTO utilizadores(nome, palavra_passe, perfil, nprocesso) VALUES (@nome, HASHBYTES('SHA2_512', @palavra_passe), 1, @nprocesso)" 
        SelectCommand="SELECT utilizadores.* FROM utilizadores">
        <InsertParameters>
            <asp:Parameter Name="nome" DbType="AnsiString"></asp:Parameter>
            <asp:Parameter Name="palavra_passe" DbType="AnsiString"></asp:Parameter>
            <asp:Parameter Name="perfil"></asp:Parameter>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
