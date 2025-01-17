<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormKullaniciBilgi.aspx.cs" Inherits="WebApplication3.WebFormKullaniciBilgi" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kullanıcı Bilgileri</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 60%;
            margin: 20px auto;
            padding: 20px;
            background-color: #e3d8f1;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h2 {
            text-align: center;
            color: #4a148c;
        }
        .form-section {
            margin-bottom: 20px;
        }
        .form-section label {
            font-weight: bold;
        }
        .form-section span {
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Kullanıcı Bilgileri</h2>
            <div class="form-section">
    <label for="lblAd">Ad:</label>
    <asp:Label ID="lblAd" runat="server"></asp:Label>
</div>
<div class="form-section">
    <label for="lblSoyad">Soyad:</label>
    <asp:Label ID="lblSoyad" runat="server"></asp:Label>
</div>
<div class="form-section">
    <label for="lblEmail">E-posta:</label>
    <asp:Label ID="lblEmail" runat="server"></asp:Label>
</div>
<div class="form-section">
    <label for="lblUniversite">Üniversite:</label>
    <asp:Label ID="lblUniversite" runat="server"></asp:Label>
</div>
<div class="form-section">
    <asp:Button ID="btnGeriDon" runat="server" Text="Geri Dön" OnClick="btnGeriDon_Click" CssClass="btn btn-primary" />
</div>
        </div>
    </form>
</body>
</html>