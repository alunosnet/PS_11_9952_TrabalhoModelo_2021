<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="gerir.aspx.cs" Inherits="PS_11_9952_TrabalhoModelo_2021.Admin.Disciplinas.gerir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Gerir disciplinas</h2>
    Disciplina:<asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button CssClass="btn btn-info btn-lg" ID="Button1" runat="server" Text="Pesquisar" />
    <asp:GridView CssClass="table" ID="GridView1" runat="server" DataSourceID="SqlDisciplinas" AutoGenerateColumns="False" DataKeyNames="id">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Atualizar" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;
                    <asp:LinkButton CssClass="btn btn-info" runat="server" Text="Cancelar" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton CssClass="btn btn-info" runat="server" Text="Editar" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;
                    <asp:LinkButton OnClientClick="return confirm('Tem a certeza que pretende eliminar esta disciplina?');" CssClass="btn btn-danger" runat="server" Text="Apagar" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
            <asp:TemplateField HeaderText="nome" SortExpression="nome">
                <EditItemTemplate>
                    <asp:TextBox CssClass="form-control" runat="server" Text='<%# Bind("nome") %>' ID="nomeTextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="nomeTextBox" CssClass="alert alert-danger" Display="Dynamic"
                        ErrorMessage="Campo de preenchimento obrigatório"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ControlToValidate="nomeTextBox" CssClass="alert alert-danger" Display="Dynamic"
                        OnServerValidate="CustomValidator1_ServerValidate"
                        ErrorMessage="O nome é muito pequeno"></asp:CustomValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nome") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="nrmodulos" SortExpression="nrmodulos">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("nrmodulos") %>' ID="nrmodulosTextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="nrmodulosTextBox" CssClass="alert alert-danger" Display="Dynamic"
                        ErrorMessage="Campo de preenchimento obrigatório"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ControlToValidate="nrmodulosTextBox" CssClass="alert alert-danger" Display="Dynamic"
                        Type="Integer" MinimumValue="1" MaximumValue="20"
                        ErrorMessage="O número de módulos deve estar entre 1 e 20"></asp:RangeValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nrmodulos") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="curso" SortExpression="curso">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("curso") %>' ID="cursoTextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="cursoTextBox" CssClass="alert alert-danger" Display="Dynamic"
                        ErrorMessage="Campo de preenchimento obrigatório"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" 
                        ControlToValidate="cursoTextBox" CssClass="alert alert-danger" Display="Dynamic"
                        OnServerValidate="CustomValidator1_ServerValidate"
                        ErrorMessage="O nome do curso é muito pequeno"></asp:CustomValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("curso") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM [disciplinas] WHERE id=@id" SelectCommand="SELECT * FROM [disciplinas]" UpdateCommand="UPDATE disciplinas SET nome = @nome, nrmodulos = @nrmodulos, curso = @curso WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome"></asp:Parameter>
            <asp:Parameter Name="nrmodulos"></asp:Parameter>
            <asp:Parameter Name="curso"></asp:Parameter>
            <asp:Parameter Name="id"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
