<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="pesquisar.aspx.cs" Inherits="PS_11_9952_TrabalhoModelo_2021.Admin.Disciplinas.pesquisar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Curso:<asp:DropDownList CssClass="form-control" AutoPostBack="true" ID="DropDownList1" runat="server" DataSourceID="SqlCursos" DataTextField="curso" DataValueField="curso"></asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="SqlCursos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT [curso] FROM [disciplinas] ORDER BY [curso]"></asp:SqlDataSource>
    <hr />
    <h2>Disciplinas</h2>
    <asp:GridView CssClass="table" EmptyDataText="Não foram encontradas disciplinas" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDisciplinas">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="nrmodulos" HeaderText="nrmodulos" SortExpression="nrmodulos"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [id], [nome], [nrmodulos] FROM [disciplinas] WHERE ([curso] = @curso) ORDER BY [nome]">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="curso" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
