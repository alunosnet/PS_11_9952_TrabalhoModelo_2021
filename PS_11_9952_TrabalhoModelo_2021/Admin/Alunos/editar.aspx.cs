using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PS_11_9952_TrabalhoModelo_2021.Admin.Alunos
{
    public partial class editar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfil"] == null || Session["perfil"].Equals("0") == false)
                Response.Redirect("~/index.aspx");

            //cache
            Response.Cache.SetNoStore();
            Response.Cache.AppendCacheExtension("no-cache");
            Response.Expires = 0;
        }
        //validação do campo nome
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string nome = args.Value;
            //limpar espaços em branco no inicio e no final
            nome = nome.Trim();
            //validar tamanho
            if (nome.Length < 3)
            {
                args.IsValid = false;
                return;
            }
            //verificar se tem um espaço em branco
            if (nome.Contains(" ") == false)
            {
                args.IsValid = false;
                return;
            }

            //maiusculas
            string novonome = "";
            bool maiuscula = true;
            for (int i = 0; i < nome.Length; i++)
            {
                if (maiuscula == true)
                    novonome = novonome + nome.Substring(i, 1).ToUpper();
                else
                    novonome = novonome + nome.Substring(i, 1);
                if (nome[i] == ' ')
                    maiuscula = true;
                else
                    maiuscula = false;
            }
            nome = novonome;

            var tb = FormView1.FindControl("nomeTextBox") as TextBox;
            tb.Text = nome;
            //verificar se tem numeros
            for (int i = 0; i < 10; i++)
            {
                if (nome.Contains(i.ToString()))
                {
                    args.IsValid = false;
                    return;
                }//if
            }//for

            args.IsValid = true;
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
        //validação da data de nascimento
        protected void CustomValidator4_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime data = DateTime.Parse(args.Value);

            //validar a idade minima
            TimeSpan idade = DateTime.Now - data;
            if (idade.TotalDays < 2 * 365)
            {
                args.IsValid = false;
                return;
            }
            //validar a idade máxima
            if (idade.TotalDays > 21 * 365)
            {
                args.IsValid = false;
                return;
            }

            args.IsValid = true;
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("gerir.aspx");
        }

        protected void SqlAluno_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            //nprocesso
            string processo = e.Command.Parameters["@nprocesso"].Value.ToString();
            //imagem
            FileUpload imagem = FormView1.FindControl("FileUpload1") as FileUpload;
            if (imagem.HasFile)
            {
                imagem.SaveAs(Server.MapPath("~/public/fotos/") + processo + ".jpg");
            }
        }
    }
}