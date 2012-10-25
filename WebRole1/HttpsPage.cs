using System;
using System.Globalization;
using System.Threading;
using System.Web;
using System.Web.UI;

namespace WebRole1
{
    public class HttpsPage : Page
    {
        protected override void OnInit(EventArgs e)
        {
            if (!Request.IsSecureConnection)
            {
                int iPort = 0;
                
                // TODO: customize this to fit your port!
                if (Request.IsLocal)
                    iPort = 443;
                else
                    iPort = 443;

                UriBuilder builder = new UriBuilder(Request.Url)
                {
                    Scheme = Uri.UriSchemeHttps,
                    Port = iPort
                };

                Response.Redirect(builder.Uri.ToString());
            }

            base.OnInit(e);
        }
    }
}
