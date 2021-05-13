using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PS_11_9952_TrabalhoModelo_2021
{
    public partial class MP : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // verificar se o cookie existe
            HttpCookie cookie = Request.Cookies["UFCD9952"];
            if (cookie != null)
                div_aviso.Visible = false;
        }
        protected void bt1_Click(object sender, EventArgs e)
        {
            //esconder a div
            div_aviso.Visible = false;
            //criar o cookie
            HttpCookie cookie = new HttpCookie("UFCD9952");
            cookie.Expires = DateTime.Now.AddYears(1);
            Response.Cookies.Add(cookie);
        }
    }
}