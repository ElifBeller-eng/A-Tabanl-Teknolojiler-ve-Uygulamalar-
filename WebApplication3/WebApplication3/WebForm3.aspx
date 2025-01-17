<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WebApplication3.WebForm3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kayıt ve Giriş</title>
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
        .form-section input[type="text"],
        .form-section input[type="email"],
        .form-section input[type="password"] {
            width: 90%;
            padding: 8px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-section button {
            background-color: #6a1b9a;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-section button:hover {
            background-color: #4a148c;
        }
        .row {
            display: flex;
            justify-content: space-between;
        }
        .column {
            width: 48%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Kayıt ve Giriş</h2>
            <div class="row">
                <!-- Kaydol Bölümü -->
                <div class="column">
                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="form-section">
                                <h3>Kaydol</h3>
                                <label for="txtAd">Ad:</label><br />
                                <input type="text" id="txtAd" runat="server" placeholder="Adınızı girin" /><br />

                                <label for="txtSoyad">Soyad:</label><br />
                                <input type="text" id="txtSoyad" runat="server" placeholder="Soyadınızı girin" /><br />

                                <label for="txtEmailKaydol">E-posta:</label><br />
                                <input type="email" id="txtEmailKaydol" runat="server" placeholder="E-posta adresinizi girin" /><br />

                                <label for="txtSifreKaydol">Şifre:</label><br />
                                <input type="password" id="txtSifreKaydol" runat="server" placeholder="Şifrenizi belirleyin" /><br />

                                <label for="txtUniversite">Üniversite Adı:</label><br />
                                <input type="text" id="txtUniversite" runat="server" placeholder="Üniversitenizi girin" /><br />

                                <!-- Kaydol Butonu (ASP.NET Button) -->
                                <asp:Button ID="btnKaydol" runat="server" Text="Kaydol" OnClick="btnKaydol_Click" />
                                <asp:Label ID="lblMessageKaydol" runat="server" Text="" CssClass="label-style"></asp:Label>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <!-- Giriş Yap Bölümü -->
                <div class="column">
                    <div class="form-section">
                        <h3>Giriş Yap</h3>
                        <label for="txtEmailGiris">E-posta:</label><br />
                        <input type="email" id="txtEmailGiris" runat="server" placeholder="E-posta adresinizi girin" /><br />

                        <label for="txtSifreGiris">Şifre:</label><br />
                        <input type="password" id="txtSifreGiris" runat="server" placeholder="Şifrenizi girin" /><br />

                        <!-- Giriş Yap Butonu (ASP.NET Button) -->
                        <asp:Button ID="btnGiris" runat="server" Text="Giriş Yap" OnClick="btnGiris_Click" />
                        <asp:Label ID="lblMessage" runat="server" Text="" CssClass="label-style"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
