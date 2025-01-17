<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication3.WebForm2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hakkımızda</title>
    <style>
        body {
            background-color: #1a1a40;
            color: white;
            font-family: Arial, sans-serif;
            margin: 0;
        }

        .container {
            text-align: center;
            margin-top: 50px;
        }

        h1 {
            font-size: 40px;
            color: #800080; /* Mor renk */
        }

        p {
            font-size: 18px;
            line-height: 1.6;
            max-width: 800px;
            margin: 20px auto;
        }

                /* Yeni stil: Hakkımızda başlığından sonra geniş bir boşluk */
        .about-content {
            margin-top: 100px; /* Boşluğu artırdık */
        }
        .button {
            display: inline-block;
            background-color: #7f007f;
            color: black;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            font-size: 20px; /* Yazı boyutunu büyüttük */
            position: fixed; /* Sabit pozisyon */
            bottom: 80px; /* Ekranın altından mesafe */
            left: 20px; /* Ekranın solundan mesafe */
        }

        .button:hover {
            background-color: #ff4d91;
        }

        /* İletişim yazısı için stil */
        .contact-info {
            position: fixed;
            bottom: 20px; /* Sayfanın altına yakın */
            right: 20px; /* Sayfanın sağ tarafına yakın */
            background-color: #003366; /* Lacivertimsi renk */
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
        }

        .contact-info:hover {
            background-color: #001f33; /* Koyu lacivert hover rengi */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Hakkımızda</h1
        <!-- Metni aşağı itmek için yeni div ile boşluk kontrolü -->
        <div class="about-content">
        <p>Bu platform, üniversite öğrencilerinin ders notlarını kolayca paylaşabileceği ve ihtiyaç duyan diğer öğrencilere ulaştırabileceği bir not paylaşım sitesidir. Amacımız, üniversite hayatını kolaylaştırmak ve öğrencilerin birbirlerine destek olmalarını sağlamaktır. Bu site üzerinden öğrenciler, derslerde tuttukları notları paylaşabilir veya isteyen öğrencilere uygun bir ücret karşılığında sunabilir. Bu sayede akademik başarıya katkıda bulunurken öğrencilere bir ek gelir kaynağı da yaratılmış olur.</p>
        <p>Not paylaşımını güvenli ve erişilebilir bir şekilde sağlamak için genç dostu ve güvenilir bir platform olmayı hedefliyoruz.</p>
        <a href="WebForm3.aspx" class="button">Giriş yap/Kaydol</a>            
        </div>
     </div>

    <!-- İletişim yazısını ekliyoruz -->
    <div class="contact-info">
        İletişim : üniversitelilerden.dersnotlari@gmail.com
    </div>
</body>
</html>


