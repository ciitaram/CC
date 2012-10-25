using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebRole1
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void OnClickRegister(object sender, EventArgs e)
        {
            // Redirect
            Response.Redirect("~/Account/Register.aspx");
        }

        protected void OnLoadLoginLogoutButton(object sender, EventArgs e)
        {
            // Cookie available?
            if (Request.Cookies["bwcc_username"] != null)
            {
                // Rename button
                ce_button_loginLogout.Text = "Logout";

                // Set label text
                ce_label_welcome_user.Text = "Welcome, " + Request.Cookies["bwcc_username"].Value + " ";
            }
            else
            {
                // Rename button
                ce_button_loginLogout.Text = "Login";

                // Set label text
                ce_label_welcome_user.Text = "Welcome, guest ";
            }
        }

        protected void OnClickLoginLogoutButton(Object sender, EventArgs e)
        {
            // Login?
            if (ce_button_loginLogout.Text == "Login")
                Response.Redirect("~/Account/Login.aspx");
            else
            {
                // Destroy cookie
                if (Request.Cookies["bwcc_username"] != null)
                {
                    HttpCookie c = new HttpCookie("bwcc_username");
                    c.Expires = DateTime.Now.AddDays(-1D);
                    Response.Cookies.Add(c);
                }

                // Redirect to main page
                Response.Redirect("~/default.aspx");
            }
        }
    }
}