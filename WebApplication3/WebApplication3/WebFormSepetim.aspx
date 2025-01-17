<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebFormSepetim.aspx.cs" Inherits="WebApplication3.WebFormSepetim" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sepetim</title>
    <style>
        .sepet-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            padding: 20px;
            font-family: Arial, sans-serif;
        }
        .sepet-image {
            width: 300px;
            height: 300px;
        }
        .sepet-details {
            width: 50%;
            display: flex;
            flex-direction: column; /* Elemanları dikey sırayla yerleştir */
            justify-content: flex-start; /* Başlangıçta hizalar */
            gap: 20px; /* Elemanlar arasında boşluk ekler */
        }
        .sepet-tutar {
            font-size: 18px;
            font-weight: bold;
        }
        .btn-onayla {
            padding: 10px 20px;
            background-color: purple;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-onayla:hover {
            background-color: darkviolet;
        }
        .header-title {
            text-align: center;
            font-size: 36px;
            font-weight: bold;
            margin: 20px 0;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Başlık -->
        <div class="header-title">SEPETİM</div>
        <div class="sepet-container">
            <div>
                <img src="Images/17996417-597e-4801-b9f6-24026cf1c1cc.png" alt="Sepet Görseli" class="sepet-image" />
            </div>
            <div class="sepet-details">
                <asp:GridView ID="gvSepet" runat="server" AutoGenerateColumns="false" CssClass="sepet-grid">
                    <Columns>
                        <asp:BoundField DataField="DosyaAdi" HeaderText="Dosya Adı" />
                        <asp:BoundField DataField="Fiyat" HeaderText="Fiyat" DataFormatString="{0:C}" />
                    </Columns>
                </asp:GridView>
                <div class="sepet-tutar">
                    Sepet Tutarı: <asp:Label ID="lblToplamTutar" runat="server" Text="0 TL"></asp:Label>
                </div>
                <asp:Button ID="btnOnayla" runat="server" Text="Sepeti Onayla" CssClass="btn-onayla" OnClick="btnOnayla_Click" />
            </div>
        </div>
    </form>
</body>
</html>