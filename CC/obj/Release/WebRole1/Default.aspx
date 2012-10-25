<%@ Page Title="Homepage" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebRole1._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>Ändern Sie diese Vorlage als Schnelleinstieg in Ihre ASP.NET-Anwendung.</h2>
            </hgroup>
            <p>
                Weitere Informationen zu ASP.NET finden Sie unter <a href="http://asp.net" title="ASP.NET Website">http://asp.net</a>.
                Die Seite enthält <mark>Videos, Lernprogramme und Beispiele,</mark> die Sie bei der optimalen Nutzung von ASP.NET unterstützen.
                Wenn Sie Fragen zu ASP.NET haben, besuchen Sie 
                <a href="http://forums.asp.net/18.aspx" title="ASP.NET Forum">unsere Foren</a>.
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    Hello Cloud
</asp:Content>
