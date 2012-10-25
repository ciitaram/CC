using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1.Account
{
    public partial class Login : HttpsPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register.aspx";
            OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];

            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            if (!String.IsNullOrEmpty(returnUrl))
            {
                RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
            }
        }

        protected void OnAuthenticate(Object sender, AuthenticateEventArgs e)
        {
            // Valid page?
            if (Page.IsValid == false)
            {
                e.Authenticated = false;
                return;
            }

            // Get username and password
            string user = ce_login_user.UserName;
            string pass = ce_login_user.Password;

            // Correct?
            if (System.Web.Security.Membership.ValidateUser(user, pass))
            {
                // Set cookie
                HttpCookie c = new HttpCookie("bwcc_username");
                c.Value = user;
                c.Expires = DateTime.Now.AddMinutes(1);
                Response.Cookies.Add(c);

                // Mark
                e.Authenticated = true;
            }
            else
            {
                e.Authenticated = false;
                ce_login_user.FailureText = "Benutzername oder Password ist falsch!";
            }
        }
    }
}