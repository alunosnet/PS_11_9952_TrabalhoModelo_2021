using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PS_11_9952_TrabalhoModelo_2021
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfil"] != null)
                divLogin.Visible = false;
        }

        protected void DetailsView1_DataBound(object sender, EventArgs e)
        {
            //verificar se o login falhou
            if (DetailsView1.Rows.Count == 0)
            {
                if (IsPostBack)
                    lbErro.Text = "O login falhou. Tente novamente.";
                return;
            }
            //iniciar sessão
            Session["nome"] = DetailsView1.Rows[0].Cells[1].Text;
            Session["perfil"] = DetailsView1.Rows[1].Cells[1].Text;
            Session["nprocesso"] = DetailsView1.Rows[2].Cells[1].Text;

            //esconder a div do login
            divLogin.Visible = false;
        }
    }
}