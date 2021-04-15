using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PS_11_9952_TrabalhoModelo_2021.Admin.Alunos
{
    public partial class apagar : System.Web.UI.Page
    {
        //TODO:apagar a fotografia
        //TODO:não apagar o aluno se tiver notas
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfil"] == null || Session["perfil"].Equals("0") == false)
                Response.Redirect("~/index.aspx");
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            Response.Redirect("gerir.aspx");
        }
    }
}