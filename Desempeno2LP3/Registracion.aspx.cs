using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Desempeno2LP3
{
    public partial class Registracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void ButtonRegistro_Click(object sender, EventArgs e)
        {
            // Mensaje que se ha registrado exitosamente
            LabelMsj.Text = "Se ha registrado exitosamente";

            // Creo la cookie para la clave . Le agregue 1 dia de duracion .

            HttpCookie cookie1 = new HttpCookie("password",TextBoxPassword.Text);
            cookie1.Expires = DateTime.Now.AddDays(1);
            Response.Cookies.Add(cookie1);

            // Creo la cookie con el nombre de usuario
            this.Session["username"] = TextBoxUsername.Text;

            //Response.Redirect(Request.RawUrl);

            
        }
    }
}