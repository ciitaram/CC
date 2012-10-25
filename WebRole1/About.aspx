<%@ Page Title="Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebRole1.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Ihre App-Beschreibungsseite.</h2>
    </hgroup>

    <article>
        <p>        
            Verwenden Sie diesen Bereich, um zusätzliche Informationen zur Verfügung zu stellen.
        </p>

        <p>        
            Verwenden Sie diesen Bereich, um zusätzliche Informationen zur Verfügung zu stellen.
        </p>

        <p>        
            Verwenden Sie diesen Bereich, um zusätzliche Informationen zur Verfügung zu stellen.
        </p>
    </article>

    <aside>
        <h3>Seitentitel</h3>
        <p>        
            Verwenden Sie diesen Bereich, um zusätzliche Informationen zur Verfügung zu stellen.
        </p>
        <ul>
            <li><a runat="server" href="~/">Startseite</a></li>
            <li><a runat="server" href="~/About.aspx">Info</a></li>
            <li><a runat="server" href="~/Contact.aspx">Kontakt</a></li>
        </ul>
    </aside>
</asp:Content>