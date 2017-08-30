<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="Error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                     <h1>
                        <asp:Literal ID="MsgLiteral" runat="server"
                            Text="Ha Ocurrido un Error">
                        </asp:Literal>
                    </h1>
                    <asp:HyperLink runat="server" NavigateUrl="~/Index.aspx">Ir a Inicio</asp:HyperLink>
                </div>
            </div>
        </div>
       
        
    </form>
</body>
</html>
