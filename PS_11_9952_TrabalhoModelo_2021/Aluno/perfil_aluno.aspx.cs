using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PS_11_9952_TrabalhoModelo_2021.Aluno
{
    public partial class perfil_aluno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["perfil"] == null || Session["perfil"].Equals("1") == false)
                Response.Redirect("~/index.aspx");

        }

        //validação da morada
        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string morada = args.Value;
            //limpar espaços em branco no inicio e no final
            morada = morada.Trim();
            //validar tamanho
            if (morada.Length < 3)
            {
                args.IsValid = false;
                return;
            }
            //verificar se tem um espaço em branco
            if (morada.Contains(" ") == false)
            {
                args.IsValid = false;
                return;
            }

            var tb = FormView1.FindControl("moradaTextBox") as TextBox;
            tb.Text = morada;

            args.IsValid = true;
        }
        //validar o código postal
        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //testar xxxx-xxx
            string cp = args.Value;
            //testar tamanho
            if (cp.Length != 8)
            {
                args.IsValid = false;
                return;
            }
            //se tem -
            if (cp.Contains("-") == false)
            {
                args.IsValid = false;
                return;
            }
            //dividir em duas partes 
            var partes = cp.Split('-');
            if (partes.Length != 2)
            {
                args.IsValid = false;
                return;
            }
            //parte 1
            int parte1 = 0;
            if (int.TryParse(partes[0], out parte1) == false)
            {
                args.IsValid = false;
                return;
            }
            //verificar se está entre 1000 e 9999
            if (parte1 < 1000 || parte1 > 9999)
            {
                args.IsValid = false;
                return;
            }
            //parte 2
            if (int.TryParse(partes[1], out parte1) == false)
            {
                args.IsValid = false;
                return;
            }

            args.IsValid = true;
        }
    }
}