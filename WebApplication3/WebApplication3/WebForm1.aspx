<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WebForm1</title>
    <style>
        body {
            background-color: #1a1a40;
            color: white;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .label-style {
            font-weight: bold;
        }

        .label-container {
            margin-left: 20px;
        }

        .image-container {
            position: absolute;
            top: 50%;
            right: 20%;
            transform: translate(0, -50%) rotate(30deg);
            -webkit-transform: translate(0, -50%) rotate(30deg);
            -ms-transform: translate(0, -50%) rotate(30deg);
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.25), 0px 0px 50px rgba(255, 255, 255, 0.8);
        }

        .image-container img {
            width: 400px;
            height: auto;
            border-radius: 10px;
        }

        #Button1 {
            background-color: #ff69b4;
            color: black;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            font-size: 18px;
            margin-left: 20px;
        }

        #Button1:hover {
            background-color: #ff4d91;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Sayfa başlığı -->
        <div class="label-container" style="margin-top: 20px;">
            <asp:Label ID="PageTitle" runat="server" Text="ÜNİVERSİTELİLER<br> YARDIMLAŞIYOR" 
                Font-Size="30px" ForeColor="Purple" CssClass="label-style"></asp:Label>
        </div>

        <!-- Diğer metin -->
        <div class="label-container" style="margin-top: 120px;">
            <asp:Label ID="Label" runat="server" 
                Text="Birlikte<br>Başarıyoruz" 
                Font-Size="45px" 
                ForeColor="DarkBlue" CssClass="label-style" />
        </div>

        <!-- Görselin sağ tarafa ortalanması ve döndürülmesi -->
        <div class="image-container">
            <img src="<%= ResolveUrl("~/Images/Screenshot 2024-11-04 063301.png") %>" alt="Başarı Görseli" />
        </div>

        <!-- Sayfanın alt kısmında buton -->
        <div style="position: fixed; bottom: 100px; left: 20px;">
            <asp:Button ID="Button1" runat="server" Text="Giriş Yap" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
