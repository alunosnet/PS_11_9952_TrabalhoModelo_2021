<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="notas_aluno.aspx.cs" Inherits="PS_11_9952_TrabalhoModelo_2021.Aluno.notas_aluno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Notas do aluno</h1>
    <asp:GridView CssClass="table" ID="GridView1" runat="server" DataSourceID="SqlNotas" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="nrmodulo" HeaderText="nrmodulo" SortExpression="nrmodulo"></asp:BoundField>
            <asp:BoundField DataField="valor" HeaderText="valor" SortExpression="valor"></asp:BoundField>
            <asp:BoundField DataFormatString="{0:dd-MM-yyyy}" DataField="data" HeaderText="data" SortExpression="data"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlNotas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT disciplinas.nome, notas.nrmodulo, notas.valor, notas.data FROM disciplinas INNER JOIN notas ON disciplinas.id = notas.id_disciplina WHERE (notas.nprocesso = @nprocesso)">
        <SelectParameters>
            <asp:SessionParameter SessionField="nprocesso" Name="nprocesso"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
