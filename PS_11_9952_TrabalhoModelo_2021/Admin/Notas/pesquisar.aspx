<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="pesquisar.aspx.cs" Inherits="PS_11_9952_TrabalhoModelo_2021.Admin.Notas.pesquisar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Pesquisar notas por disciplina</h1>
    Selecione a disciplina:<asp:DropDownList AutoPostBack="true" CssClass="form-control" ID="DropDownList1" runat="server" DataSourceID="SqlDisciplinas" DataTextField="Column1" DataValueField="id"></asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
        SelectCommand="SELECT [id], [nome] +' - '+ [curso] FROM [disciplinas] ORDER BY [nome]"></asp:SqlDataSource>
    <hr />
    <asp:GridView EmptyDataText="Não foram encontrados registos" CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlNotas" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="valor" HeaderText="valor" SortExpression="valor"></asp:BoundField>
            <asp:BoundField DataFormatString="{0:dd-MM-yyyy}" DataField="data" HeaderText="data" SortExpression="data"></asp:BoundField>
            <asp:BoundField DataField="nrmodulo" HeaderText="nrmodulo" SortExpression="nrmodulo"></asp:BoundField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource runat="server" ID="SqlNotas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT alunos.nome, notas.valor, notas.data, notas.nrmodulo FROM alunos INNER JOIN notas ON alunos.nprocesso = notas.nprocesso WHERE (notas.id_disciplina = @id_disciplina)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="id_disciplina"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
