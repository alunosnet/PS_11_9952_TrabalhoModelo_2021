using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PS_11_9952_TrabalhoModelo_2021.Admin.Alunos
{
    public partial class gerir : System.Web.UI.Page
    {
        //TODO: adicionar uma coluna com a fotografia
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfil"] == null || Session["perfil"].Equals("0") == false)
                Response.Redirect("~/index.aspx");
        }
    }
}