<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="editar.aspx.cs" Inherits="PS_11_9952_TrabalhoModelo_2021.Admin.Alunos.editar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Editar aluno</h2>
    <a href="gerir.aspx">Voltar</a>
    <asp:FormView OnItemUpdated="FormView1_ItemUpdated" DefaultMode="Edit" Width="100%" ID="FormView1" runat="server" DataKeyNames="nprocesso" DataSourceID="SqlAluno">
        <EditItemTemplate>
            <asp:Image CssClass="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("nprocesso","~/Public/Fotos/{0}.jpg")  %>' Width="200px" />
            <br />Nº processo:
            <asp:Label CssClass="form-control" Text='<%# Eval("nprocesso") %>' runat="server" ID="nprocessoLabel1" /><br />
            Nome:
            <asp:TextBox CssClass="form-control" MaxLength="60" Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                ControlToValidate="nomeTextBox" CssClass="alert alert-danger" Display="Dynamic"
                ErrorMessage="O campo nome é de preenchimento obrigatório"
                runat="server" ></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" OnServerValidate="CustomValidator1_ServerValidate"
                ControlToValidate="nomeTextBox" CssClass="alert alert-danger" Display="Dynamic"
                ErrorMessage="O nome indicado não é válido"></asp:CustomValidator>
            <br />
            Morada:
            <asp:TextBox CssClass="form-control" MaxLength="100" Text='<%# Bind("morada") %>' runat="server" ID="moradaTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="moradaTextBox"
                CssClass="alert alert-danger" Display="Dynamic"
                ErrorMessage="O campo morada é de preenchimento obrigatório"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" OnServerValidate="CustomValidator2_ServerValidate"
                 CssClass="alert alert-danger" Display="Dynamic" ControlToValidate="moradaTextBox"
                ErrorMessage="A morada não é válida"></asp:CustomValidator>
            <br />
            Código Postal:
            <asp:TextBox CssClass="form-control" MaxLength="8" Text='<%# Bind("cp") %>' runat="server" ID="cpTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cpTextBox"
                CssClass="alert alert-danger" Display="Dynamic"
                ErrorMessage="O campo código postal é de preenchimento obrigatório"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator3" runat="server" 
                ControlToValidate="cpTextBox" CssClass="alert alert-danger" Display="Dynamic"
                ErrorMessage="O código postal não é válido"
                OnServerValidate="CustomValidator3_ServerValidate"></asp:CustomValidator>
            <br />
            Data nascimento:
            <asp:TextBox CssClass="form-control" TextMode="Date" Text='<%# Bind("data_nascimento","{0:yyyy-MM-dd}") %>' runat="server" ID="data_nascimentoTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="data_nascimentoTextBox"
                CssClass="alert alert-danger" Display="Dynamic"
                ErrorMessage="O campo data de nascimento é de preenchimento obrigatório"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator4" runat="server" ControlToValidate="data_nascimentoTextBox"
                CssClass="alert alert-danger" Display="Dynamic" OnServerValidate="CustomValidator4_ServerValidate"
                ErrorMessage="A data de nascimento não é válida"></asp:CustomValidator>
            <br />
            Género:
            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" SelectedValue='<%# Bind("genero") %>'>
                <asp:ListItem Value="M">Masculino</asp:ListItem>
                <asp:ListItem Value="F">Feminino</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList1"
                CssClass="alert alert-danger" Display="Dynamic"
                ErrorMessage="O campo género é obrigatório"></asp:RequiredFieldValidator>
            <br />
            Fotografia:
            <asp:FileUpload CssClass="form-control-file" ID="FileUpload1" runat="server" />
            <br />
            <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton CssClass="btn btn-info" runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            nome:
            <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /><br />
            morada:
            <asp:TextBox Text='<%# Bind("morada") %>' runat="server" ID="moradaTextBox" /><br />
            cp:
            <asp:TextBox Text='<%# Bind("cp") %>' runat="server" ID="cpTextBox" /><br />
            data_nascimento:
            <asp:TextBox Text='<%# Bind("data_nascimento") %>' runat="server" ID="data_nascimentoTextBox" /><br />
            genero:
            <asp:TextBox Text='<%# Bind("genero") %>' runat="server" ID="generoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            nprocesso:
            <asp:Label Text='<%# Eval("nprocesso") %>' runat="server" ID="nprocessoLabel" /><br />
            nome:
            <asp:Label Text='<%# Bind("nome") %>' runat="server" ID="nomeLabel" /><br />
            morada:
            <asp:Label Text='<%# Bind("morada") %>' runat="server" ID="moradaLabel" /><br />
            cp:
            <asp:Label Text='<%# Bind("cp") %>' runat="server" ID="cpLabel" /><br />
            data_nascimento:
            <asp:Label Text='<%# Bind("data_nascimento") %>' runat="server" ID="data_nascimentoLabel" /><br />
            genero:
            <asp:Label Text='<%# Bind("genero") %>' runat="server" ID="generoLabel" /><br />
            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource OnUpdated="SqlAluno_Updated" runat="server" ID="SqlAluno" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        SelectCommand="SELECT nprocesso, nome, morada, cp, data_nascimento, genero FROM alunos WHERE (nprocesso = @nprocesso)" 
        UpdateCommand="UPDATE alunos SET nome = @nome, morada = @morada, cp = @cp, data_nascimento = @data_nascimento, genero = @genero WHERE (nprocesso = @nprocesso)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="nprocesso" Name="nprocesso"></asp:QueryStringParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome"></asp:Parameter>
            <asp:Parameter Name="morada"></asp:Parameter>
            <asp:Parameter Name="cp"></asp:Parameter>
            <asp:Parameter Name="data_nascimento"></asp:Parameter>
            <asp:Parameter Name="genero"></asp:Parameter>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
