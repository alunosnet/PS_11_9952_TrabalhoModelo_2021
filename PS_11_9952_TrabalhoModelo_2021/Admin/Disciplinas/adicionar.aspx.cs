using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PS_11_9952_TrabalhoModelo_2021.Admin.Disciplinas
{
    public partial class adicionar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfil"] == null || Session["perfil"].Equals("0") == false)
                Response.Redirect("~/index.aspx");
        }
        //validação do tamanho minimo
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //tamanho deve ter pelo menos 2 letras
            string texto = args.Value;
            if (texto.Length < 2)
            {
                args.IsValid = false;
                return;
            }
            args.IsValid = true;
        }
    }
}