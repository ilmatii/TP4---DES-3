<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Crud Reg.aspx.cs" Inherits="TP4___DES_3.Create" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="width: 60%">
        <div style="border: thin groove #FF6600; ">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            &nbsp;&nbsp;
            <asp:Label ID="Label4" runat="server" Text="Registro Contable" Font-Bold="True"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="Cuenta"></asp:Label>
            <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" style="margin-left: 26px" Width="126px" DataSourceID="SqlDataSource1" DataTextField="descripcion" DataValueField="id">
            </asp:DropDownList>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Monto"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 27px" ToolTip="Sape" Width="119px"></asp:TextBox>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="Tipo"></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" style="margin-left: 42px; height: 22px;" Width="126px">
                <asp:ListItem Value="0">Debe</asp:ListItem>
                <asp:ListItem Value="1">Haber</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" style="margin-left: 70px" Text="Agregar" Width="59px" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label5" runat="server"></asp:Label>
            <br />
            <br />
&nbsp;<asp:Table ID="Table1" runat="server" BorderStyle="Inset" style="margin-left: 22px" Width="690px" GridLines="Vertical">
            </asp:Table>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="true" Height="16px" style="margin-left: 24px" Width="166px" DataSourceID="SqlDataSource5" DataTextField="descripcion" DataValueField="id" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
</asp:DropDownList>
            <asp:TextBox ID="TextBox2" runat="server" placeholder="Monto" style="margin-left: 26px" Width="149px"></asp:TextBox>
            <asp:DropDownList ID="DropDownList4" runat="server" style="margin-left: 18px" Width="130px">
                <asp:ListItem Value="0">Debe</asp:ListItem>
                <asp:ListItem Value="1">Haber</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button2" runat="server" style="margin-left: 17px" Text="Modificar" OnClick="Button2_Click" />
            <asp:Button ID="Button3" runat="server" style="margin-left: 20px" Text="Eliminar" Width="75px" OnClick="Button3_Click" />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label6" runat="server"></asp:Label>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Menu.aspx">Volver al menu principal</asp:HyperLink>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena1 %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [id] = @id" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [id] = @id">
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
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:cadena1 %>" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [RegistrosContables] ([idcuenta], [monto], [tipo]) VALUES (@idcuenta, @monto, @tipo)" SelectCommand="SELECT * FROM [RegistrosContables]" UpdateCommand="UPDATE [RegistrosContables] SET [idcuenta] = @idcuenta, [monto] = @monto, [tipo] = @tipo WHERE [idcuenta] = @idcuenta">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="DropDownList5" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="idcuenta" Type="Int32" />
                    <asp:Parameter Name="monto" Type="Int32" />
                    <asp:Parameter Name="tipo" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="monto" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList4" Name="tipo" PropertyName="SelectedValue" Type="Boolean" />
                    <asp:ControlParameter ControlID="DropDownList5" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:cadena1 %>" DeleteCommand="DELETE FROM [RegistrosContables] WHERE [id] = @id" InsertCommand="INSERT INTO [RegistrosContables] ([idcuenta], [monto], [tipo]) VALUES (@idcuenta, @monto, @tipo)" SelectCommand="SELECT RegistrosContables.id, RegistrosContables.idcuenta, RegistrosContables.monto, RegistrosContables.tipo, Cuentas.descripcion FROM RegistrosContables INNER JOIN Cuentas ON RegistrosContables.idcuenta = Cuentas.id" UpdateCommand="UPDATE [RegistrosContables] SET [idcuenta] = @idcuenta, [monto] = @monto, [tipo] = @tipo WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="idcuenta" Type="Int32" />
                    <asp:Parameter Name="monto" Type="Int32" />
                    <asp:Parameter Name="tipo" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idcuenta" Type="Int32" />
                    <asp:Parameter Name="monto" Type="Int32" />
                    <asp:Parameter Name="tipo" Type="Boolean" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
