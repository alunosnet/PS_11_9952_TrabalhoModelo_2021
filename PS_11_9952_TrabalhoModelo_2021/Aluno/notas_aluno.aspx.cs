using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PS_11_9952_TrabalhoModelo_2021.Aluno
{
    public partial class notas_aluno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["perfil"] == null || Session["perfil"].Equals("1") == false)
                Response.Redirect("~/index.aspx");
        }
    }
}