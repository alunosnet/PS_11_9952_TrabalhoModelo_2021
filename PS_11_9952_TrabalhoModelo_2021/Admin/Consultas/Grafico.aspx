<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="Grafico.aspx.cs" Inherits="PS_11_9952_TrabalhoModelo_2021.Admin.Consultas.Grafico" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Alunos por género</h1>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlGrafico">
        <Series>
            <asp:Series Name="Series1" ChartType="Pie" XValueMember="genero" YValueMembers="Nr"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource runat="server" ID="SqlGrafico" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT genero, COUNT(*) AS Nr FROM alunos GROUP BY genero"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlGrafico">
        <Columns>
            <asp:BoundField DataField="genero" HeaderText="genero" SortExpression="genero"></asp:BoundField>
            <asp:BoundField DataField="Nr" HeaderText="Nr" ReadOnly="True" SortExpression="Nr"></asp:BoundField>
        </Columns>
    </asp:GridView>
</asp:Content>
