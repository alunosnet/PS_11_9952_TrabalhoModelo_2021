<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="gerir.aspx.cs" Inherits="PS_11_9952_TrabalhoModelo_2021.Admin.Notas.gerir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gerir notas por aluno</h1>
    Aluno:<asp:DropDownList AutoPostBack="true" ID="DropDownList1" runat="server"></asp:DropDownList>
    <hr />
    <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    //templates dos links editar/apagar
    //templates dos campos
    //dropdownlist: id_disciplina e nprocesso
    //validators
</asp:Content>
