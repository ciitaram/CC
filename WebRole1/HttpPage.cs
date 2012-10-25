using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public class HttpPage : Page
    {
        protected override void OnInit(EventArgs e)
        {
            if (Request.IsSecureConnection)
            {
                int iPort = 0;

                // TODO: customize this to fit your port!
                if (Request.IsLocal)
                    iPort = 81;
                else
                    iPort = 80;

                UriBuilder builder = new UriBuilder(Request.Url)
                {
                    Scheme = Uri.UriSchemeHttp,
                    // TODO: customize this to fit your port
                    Port = iPort
                };
                Response.Redirect(builder.Uri.ToString());
            }

            base.OnInit(e);
        }
    }
}
