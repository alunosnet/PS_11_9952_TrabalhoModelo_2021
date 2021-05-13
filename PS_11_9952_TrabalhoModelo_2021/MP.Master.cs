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

        }
        protected void bt1_Click(object sender, EventArgs e)
        {
            //esconder a div
            div_aviso.Visible = false;
            //criar o cookie
            HttpCookie cookie = new HttpCookie("M7_T2");
            cookie.Expires = DateTime.Now.AddYears(1);
            Response.Cookies.Add(cookie);
        }
    }
}