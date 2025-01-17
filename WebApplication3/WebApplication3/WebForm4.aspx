<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="WebApplication3.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WebForm4</title>
    <style>
        body {
            background-color: #8b74a8;
            font-family: Arial, sans-serif;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #5C2D91;
            color: white;
            font-size: 24px;

        }

        .user-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
        }

        .user-button:hover {
            background-color: #45a049;
        }

        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .button {
            background-color: #5C2D91;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 15px 30px;
            cursor: pointer;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #482070;
        }

        .search-section {
            margin: 30px auto;
            text-align: center;
        }

        .search-section select {
            padding: 10px;
            font-size: 16px;
            margin: 10px;
        }

        .search-section .search-button {
            background-color: #5C2D91;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        .search-section .search-button:hover {
            background-color: #482070;
        }

        /* File List Section */
        .file-list-section {
            margin: 30px auto;
            width: 80%;
        }

        .file-list-section h2 {
            text-align: center;
            color: #5C2D91;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* GridView düzenlemesi */
        .file-list-section table {
            width: 100%;
            border-collapse: collapse;
        }

        .file-list-section th, .file-list-section td {
            padding: 12px;  /* Hücreler arasında boşluk ekleyelim */
            text-align: left;  /* Yazılar soldan hizalansın */
            word-wrap: break-word; /* Kelimelerin taşmasını engelle, satırlara sığsın */
            max-width: 300px;  /* Maksimum genişlik belirleyelim, çok uzun isimler kaymasın */
        }

        .file-list-section th {
            background-color: #5C2D91;
            color: white;
        }

        .file-list-section td {
            background-color: #f4f4f4;
        }

        .file-list-section td a {
            color: #5C2D91;
            text-decoration: none;
        }

        .file-list-section td a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <div class="header">
            <span>Anasayfa</span>
            <asp:Button ID="btnKullaniciBilgileri" runat="server" Text="Kullanıcı Bilgileri" CssClass="user-button" OnClick="btnKullaniciBilgileri_Click" />
        </div>

        <!-- Buttons -->
        <div class="button-container">
            <asp:Button ID="btnUniversiteler" runat="server" Text="Üniversiteler" CssClass="button" OnClick="btnUniversiteler_Click" />
            <asp:Button ID="btnBolumler" runat="server" Text="Bölümler" CssClass="button" OnClick="btnBolumler_Click" />
            <asp:Button ID="btnNotPaylas" runat="server" Text="Not Paylaş" CssClass="button" OnClick="btnNotPaylas_Click" />
            <asp:Button ID="btnCikisYap" runat="server" Text="Çıkış Yap" CssClass="user-button" OnClick="btnCikisYap_Click" />
        </div>

        <!-- Search Section -->
        <div class="search-section">
            <asp:DropDownList ID="ddlUniversiteler" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUniversiteler_SelectedIndexChanged">
                <asp:ListItem Text="Üniversite Seçin" Value="" />
            </asp:DropDownList>
            <asp:DropDownList ID="ddlBolumler" runat="server">
                <asp:ListItem Text="Bölüm Seçin" Value="" />
            </asp:DropDownList>
            <asp:Button ID="btnArama" runat="server" Text="Arama Yap" CssClass="search-button" OnClick="btnArama_Click" />
        </div>

        <!-- File List Section -->
        <div class="file-list-section">
            <h2>Ders Notları</h2>
            <asp:GridView ID="gvDosyalar" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="DosyaAdi" HeaderText="Dosya Adı" SortExpression="DosyaAdi" />
                    <asp:HyperLinkField 
                        DataNavigateUrlFields="SanalDosyaYolu"
                        DataNavigateUrlFormatString="{0}"
                        HeaderText="Dosya Linki"  
                        Text="Dosyayı Görüntüle" 
                        Target="_blank" />

                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>