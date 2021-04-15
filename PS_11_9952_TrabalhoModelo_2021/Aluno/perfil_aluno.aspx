<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="perfil_aluno.aspx.cs" Inherits="PS_11_9952_TrabalhoModelo_2021.Aluno.perfil_aluno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Área de aluno</h1>
    <asp:FormView Width="100%" ID="FormView1" runat="server" DataKeyNames="nprocesso" DataSourceID="SqlAluno">
        <EditItemTemplate>
            <asp:Image CssClass="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("nprocesso","~/Public/Fotos/{0}.jpg")  %>' Width="200px" />
            <br />
            Nº processo:
            <asp:Label CssClass="form-control" Text='<%# Eval("nprocesso") %>' runat="server" ID="nprocessoLabel1" /><br />
            Nome:
            <asp:TextBox CssClass="form-control" ReadOnly="true" Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /><br />
            Morada:
            <asp:TextBox CssClass="form-control" Text='<%# Bind("morada") %>' runat="server" ID="moradaTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="moradaTextBox"
                CssClass="alert alert-danger" Display="Dynamic"
                ErrorMessage="O campo morada é de preenchimento obrigatório"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" OnServerValidate="CustomValidator2_ServerValidate"
                 CssClass="alert alert-danger" Display="Dynamic" ControlToValidate="moradaTextBox"
                ErrorMessage="A morada não é válida"></asp:CustomValidator>
            <br />
            Código postal:
            <asp:TextBox CssClass="form-control" Text='<%# Bind("cp") %>' runat="server" ID="cpTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cpTextBox"
                CssClass="alert alert-danger" Display="Dynamic"
                ErrorMessage="O campo código postal é de preenchimento obrigatório"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator3" runat="server" 
                ControlToValidate="cpTextBox" CssClass="alert alert-danger" Display="Dynamic"
                ErrorMessage="O código postal não é válido"
                OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator>
            <br />
            Data de nascimento:
            <asp:TextBox CssClass="form-control" ReadOnly="true" Text='<%# Bind("data_nascimento","{0:dd-MM-yyyy}") %>' runat="server" ID="data_nascimentoTextBox" /><br />
            Género:
            <asp:TextBox CssClass="form-control" ReadOnly="true" Text='<%# Bind("genero") %>' runat="server" ID="generoTextBox" /><br />
            <asp:LinkButton CssClass="btn btn-danger"  runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;
            <asp:LinkButton CssClass="btn btn-info"  runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Nome:
            <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /><br />
            Morada:
            <asp:TextBox Text='<%# Bind("morada") %>' runat="server" ID="moradaTextBox" /><br />
            Código Postal:
            <asp:TextBox Text='<%# Bind("cp") %>' runat="server" ID="cpTextBox" /><br />
            Data de nascimento:
            <asp:TextBox Text='<%# Bind("data_nascimento") %>' runat="server" ID="data_nascimentoTextBox" /><br />
            Género:
            <asp:TextBox Text='<%# Bind("genero") %>' runat="server" ID="generoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Image CssClass="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("nprocesso","~/Public/Fotos/{0}.jpg")  %>' Width="200px" />
            <br />
            Nº processo:
            <asp:Label CssClass="form-control" Text='<%# Eval("nprocesso") %>' runat="server" ID="nprocessoLabel" /><br />
            Nome:
            <asp:Label CssClass="form-control" Text='<%# Bind("nome") %>' runat="server" ID="nomeLabel" /><br />
            Morada:
            <asp:Label CssClass="form-control" Text='<%# Bind("morada") %>' runat="server" ID="moradaLabel" /><br />
            Código Postal:
            <asp:Label CssClass="form-control" Text='<%# Bind("cp") %>' runat="server" ID="cpLabel" /><br />
            Data de nascimento:
            <asp:Label CssClass="form-control" Text='<%# Bind("data_nascimento","{0:dd-MM-yyyy}") %>' runat="server" ID="data_nascimentoLabel" /><br />
            Género:
            <asp:Label CssClass="form-control" Text='<%# Bind("genero") %>' runat="server" ID="generoLabel" /><br />
            <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Editar" CommandName="Edit" ID="EditButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlAluno" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        SelectCommand="SELECT * FROM [alunos] WHERE nprocesso=@nprocesso" 
        UpdateCommand="UPDATE alunos SET morada = @morada, cp = @cp WHERE (nprocesso = @nprocesso)">
        <SelectParameters>
            <asp:SessionParameter SessionField="nprocesso" Name="nprocesso"></asp:SessionParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="morada"></asp:Parameter>
            <asp:Parameter Name="cp"></asp:Parameter>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
