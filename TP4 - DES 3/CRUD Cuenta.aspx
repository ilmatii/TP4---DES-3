<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUD Cuenta.aspx.cs" Inherits="TP4___DES_3.CreateCuenta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding: 10px; margin: 0px; border-style: groove; border-color: #800080; width: 692px;">
        <asp:Label ID="Label1" runat="server" Text="Titular de la cuenta"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 25px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" style="margin-left: 23px; margin-top: 0px; margin-bottom: 0px" Text="Agregar" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="descripcion" DataValueField="id" Height="87px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="263px"></asp:ListBox>
        <asp:TextBox ID="TextBox2" runat="server" style="margin-left: 18px" Width="139px"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" style="margin-left: 14px" Text="Modificar" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" style="margin-left: 14px" Text="Eliminar" Width="77px" OnClick="Button3_Click" />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
       
        <br />
        <br />
        <asp:Label ID="Label3" runat="server"></asp:Label>
            <br />
        <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx" >Volver al menu principal</asp:HyperLink>
            <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena1 %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [id] = @id" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="descripcion" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="descripcion" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cadena1 %>" SelectCommand="SELECT * FROM [Cuentas] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListBox1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
