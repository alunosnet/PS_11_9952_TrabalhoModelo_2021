<%@ Page Title="" Language="C#" MasterPageFile="~/MP.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="PS_11_9952_TrabalhoModelo_2021.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hidethis{
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--login-->
    <div runat="server" id="divLogin" class="col-md-3 float-right border">
        Nome:<asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox><br />
        Password:<asp:TextBox CssClass="form-control" TextMode="Password" ID="TextBox2" runat="server"></asp:TextBox><br />
        <asp:Button CssClass="btn btn-info" ID="Button1" runat="server" Text="Login" /><br />
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
    <div runat="server" id="divCursos" class="col-md-9 border">
        <h2>Cursos Disponíveis</h2>
        <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlCursos">
            <Columns>
                <asp:BoundField DataField="curso" SortExpression="curso">
                    <HeaderStyle Height="0px" CssClass="hidethis"></HeaderStyle>
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="curso" DataNavigateUrlFormatString="detalhes_curso.aspx?curso={0}" Text="Ver detalhes...">
                    <HeaderStyle CssClass="hidethis"></HeaderStyle>
                </asp:HyperLinkField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlCursos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT [curso] FROM [disciplinas]"></asp:SqlDataSource>
    </div>

    <!--listar disciplinas-->
    <div runat="server" id="divDisciplinas" class="col-md-9 border">
        <h2>Disciplinas mais pesquisadas</h2>
        <asp:GridView CssClass="table" ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDisciplinas">
            <Columns>
                <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome"></asp:BoundField>
                <asp:BoundField DataField="nrmodulos" HeaderText="nrmodulos" SortExpression="nrmodulos"></asp:BoundField>
                <asp:BoundField DataField="curso" HeaderText="curso" SortExpression="curso"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [nome], [nrmodulos], [curso] FROM [disciplinas] WHERE ([curso] = @curso)">
            <SelectParameters>
                <asp:CookieParameter CookieName="curso" Name="curso" Type="String"></asp:CookieParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
