using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PS_11_9952_TrabalhoModelo_2021.Admin.Notas
{
    public partial class adicionar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TODO: validar sessão
        }
        //valida a data do módulo
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime data = DateTime.Parse(args.Value);
            //não pode ser superior à data atual
            if (data > DateTime.Now)
            {
                args.IsValid = false;
                return;
            }

            args.IsValid = true;
        }
    }
}