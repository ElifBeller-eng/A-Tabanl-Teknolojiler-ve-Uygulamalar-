<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="WebApplication3.WebForm5" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WebForm5</title>
    <style>
        body {
            background-color: #1a1a2e;
        }
        .button-container {
            display: flex;
            justify-content: center;
             gap: 10px; /* Butonlar arasında boşluk bırakır */
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: white;
        }

        .input-container {
            display: flex;
            align-items: center;
            background-color: #5c2d91;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 20px;
        }

        .input-container input {
            border: none;
            outline: none;
            padding: 10px;
            font-size: 16px;
            flex: 1;
            background-color: #d8b9f4;
            color: black;
            border-radius: 5px;
        }

        .textarea {
            width: 80%;
            height: 200px;
            background-color: #35013f;
            border: none;
            border-radius: 5px;
            color: white;
            padding: 10px;
            font-size: 16px;
            resize: none;
            margin-bottom: 20px;
        }

        .button {
            background-color: #5c2d91;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="container">
            <div class="input-container">
                <asp:Label ID="lblDosya" runat="server" Text="Dosya Yükle" Style="margin-right: 10px;"></asp:Label>
                <asp:FileUpload ID="fileUpload" runat="server" CssClass="button" />
            </div>
            <asp:TextBox ID="txtDosyaAdi" runat="server" CssClass="textarea" Placeholder="Dosya adını yazınız..."></asp:TextBox>
            <div class="button-container">
                <asp:Button ID="btnGeriDon" runat="server" Text="Geri Dön" CssClass="button" OnClick="btnGeriDon_Click" />
                <asp:Button ID="btnDosyaYukle" runat="server" Text="Yükle" CssClass="button" OnClick="btnDosyaYukle_Click" />
            </div>
        </div>
    </form>
</body>
</html>