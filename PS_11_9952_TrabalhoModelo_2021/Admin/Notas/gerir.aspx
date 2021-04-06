<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="gerir.aspx.cs" Inherits="PS_11_9952_TrabalhoModelo_2021.Admin.Notas.gerir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gerir notas por aluno</h1>
    Aluno:<asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="DropDownList1" runat="server" DataSourceID="SqlAlunos" DataTextField="nome" DataValueField="nprocesso"></asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        SelectCommand="SELECT [nprocesso], [nome] FROM [alunos] ORDER BY [nome]"></asp:SqlDataSource>
    <hr />
    <asp:GridView CssClass="table" ID="GridView1" runat="server" DataSourceID="SqlNotas" AutoGenerateColumns="False" DataKeyNames="id">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;
                    <asp:LinkButton OnClientClick="return confirm('Tem a certeza que pretende eliminar esta nota?');" runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
            <asp:TemplateField HeaderText="id_disciplina" SortExpression="id_disciplina">
                <EditItemTemplate>
                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" 
                        SelectedValue='<%# Bind("id_disciplina") %>' DataSourceID="SqlDisciplinas" DataTextField="nome" DataValueField="id"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDisciplinas" 
                        ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
                        SelectCommand="SELECT [id], [nome]+'-'+curso as nome FROM [disciplinas] ORDER BY [nome]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="DropDownList1" CssClass="alert alert-danger" Display="Dynamic"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("id_disciplina") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="nprocesso" SortExpression="nprocesso">
                <EditItemTemplate>
                    <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" 
                        SelectedValue='<%# Bind("nprocesso") %>' DataSourceID="SqlAlunos" 
                        DataTextField="nome" DataValueField="nprocesso"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
                        SelectCommand="SELECT [nprocesso], [nome] FROM [alunos] ORDER BY [nome]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="DropDownList2" CssClass="alert alert-danger" Display="Dynamic"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nprocesso") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="valor" SortExpression="valor">
                <EditItemTemplate>
                    <asp:TextBox TextMode="Number" runat="server" Text='<%# Bind("valor") %>' ID="valorTextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="valorTextBox" CssClass="alert alert-danger" Display="Dynamic"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ControlToValidate="valorTextBox" CssClass="alert alert-danger" Display="Dynamic"
                        Type="Integer" MinimumValue="1" MaximumValue="20"
                        ErrorMessage="A nota deve estar entre 1 e 20"></asp:RangeValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("valor") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="data" SortExpression="data">
                <EditItemTemplate>
                    <asp:TextBox TextMode="Date" runat="server" Text='<%# Bind("data","{0:yyyy-MM-dd}") %>' ID="dataTextBox"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="dataTextBox" CssClass="alert alert-danger" Display="Dynamic"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" OnServerValidate="CustomValidator1_ServerValidate"
                        ControlToValidate="dataTextBox" CssClass="alert alert-danger" Display="Dynamic"
                        ErrorMessage="A data não pode ser superior à data atual"></asp:CustomValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("data","{0:dd-MM-yyyy}") %>' ID="Label4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="nrmodulo" SortExpression="nrmodulo">
                <EditItemTemplate>
                    <asp:TextBox TextMode="Number" runat="server" Text='<%# Bind("nrmodulo") %>' ID="nrmoduloTextBox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="nrmoduloTextBox" CssClass="alert alert-danger" Display="Dynamic"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server" 
                        ControlToValidate="nrmoduloTextBox" CssClass="alert alert-danger" Display="Dynamic"
                        Type="Integer" MinimumValue="1" MaximumValue="20"
                        ErrorMessage="O número do módulo deve estar entre 1 e 20"></asp:RangeValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nrmodulo") %>' ID="Label5"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" ReadOnly="True"></asp:BoundField>
        </Columns>
    </asp:GridView>
    //templates dos links editar/apagar
    //templates dos campos
    //dropdownlist: id_disciplina e nprocesso
    //validators
    <asp:SqlDataSource runat="server" ID="SqlNotas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="DELETE FROM notas WHERE (id = @id)" SelectCommand="SELECT notas.id, notas.id_disciplina, notas.nprocesso, notas.valor, notas.data, notas.nrmodulo, disciplinas.nome FROM notas INNER JOIN disciplinas ON notas.id_disciplina = disciplinas.id WHERE (notas.nprocesso = @nprocesso)" UpdateCommand="UPDATE notas SET id_disciplina = @id_disciplina, nprocesso = @nprocesso, valor = @valor, data = @data, nrmodulo = @nrmodulo WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id"></asp:Parameter>
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="nprocesso"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_disciplina"></asp:Parameter>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
            <asp:Parameter Name="valor"></asp:Parameter>
            <asp:Parameter Name="data" DbType="Date"></asp:Parameter>
            <asp:Parameter Name="nrmodulo"></asp:Parameter>
            <asp:Parameter Name="id"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
