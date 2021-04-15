<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="PS_11_9952_TrabalhoModelo_2021.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--login-->
    <div runat="server" id="divLogin">
        Nome:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
        Password:<asp:TextBox TextMode="Password" ID="TextBox2" runat="server"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="Login" /><br />
        <asp:Label ID="lbErro" runat="server" Text=""></asp:Label><br />
        <asp:DetailsView OnDataBound="DetailsView1_DataBound" ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="nome" DataSourceID="SqlLogin">
            <Fields>
                <asp:BoundField DataField="nome" HeaderText="nome" ReadOnly="True" SortExpression="nome"></asp:BoundField>
                <asp:BoundField DataField="perfil" HeaderText="perfil" SortExpression="perfil"></asp:BoundField>
                <asp:BoundField DataField="nprocesso" HeaderText="nprocesso" SortExpression="nprocesso"></asp:BoundField>
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource runat="server" ID="SqlLogin" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT nome, perfil, nprocesso FROM utilizadores WHERE (nome = @nome) AND (palavra_passe = HASHBYTES('SHA2_512', @palavra_passe))">
            <SelectParameters>
                <asp:ControlParameter DbType="AnsiString" ControlID="TextBox1" PropertyName="Text" Name="nome"></asp:ControlParameter>
                <asp:ControlParameter DbType="AnsiString" ControlID="TextBox2" PropertyName="Text" Name="palavra_passe"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <!--listar cursos-->
    

    <!--listar disciplinas-->

</asp:Content>
