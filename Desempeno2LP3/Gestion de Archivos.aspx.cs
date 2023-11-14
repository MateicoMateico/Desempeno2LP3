using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Desempeno2LP3
{
    public partial class Gestion_de_Archivos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["username"] != null)
            {
                LabelMensaje.Text = "Bienvenido " + Session["username"].ToString() + ". Los datos se guardaran en una carpeta con su nombre de usuario.";
                cargarGrilla();
            }
            else
            {
                LabelMensaje.Text = "Para subir un archivo debe estar registrado.";
                
            }
        }


        public void cargarGrilla()
        {
            
                string username = Session["username"].ToString();
                string path = $"{Server.MapPath(".")}/{username}";

            // verificamos si existe el directorio /{username} y lo recorremos y completamos el grid view
                if (Directory.Exists(path))
                {
                    string[] files = Directory.GetFiles(path);
                    List<Archivo> fileList = new List<Archivo>();

                    foreach (string file in files)
                    {
                        var fileNew = new Archivo(Path.GetFileName(file), file);
                        fileList.Add(fileNew);
                    }

                    GridViewArchivos.DataSource = fileList;
                    GridViewArchivos.DataBind();
                }


            
        }

        protected void ButtonSubirArchivos_Click(object sender, EventArgs e)
        {
            if (this.Session["username"] != null)
            {
                // recupero el username de la session
                string username = Session["username"].ToString();
                string path = $"{Server.MapPath(".")}/{username}";
                string result = string.Empty;

                // si no existe el directorio /{username} lo creo
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                // verificamos que haya algun archivo seleccionado
                if (FileUpload1.HasFiles)
                {
                    
                    foreach (HttpPostedFile archivo in FileUpload1.PostedFiles)
                    {
                        if (File.Exists($"{path}/{archivo.FileName}"))
                        {
                            result += $"El archivo {archivo.FileName} ya existe - ";
                        }
                        else
                        {
                            archivo.SaveAs($"{path}/{archivo.FileName}");
                            result += $"El archivo {archivo.FileName} se subio correctamente - ";
                        }
                    }
                }
                else
                {
                    result = "No se seleccionó ningún archivo.";
                }
                LabelResultado.Text = result;
                cargarGrilla();
                

            }
            else
            {
                LabelResultado.Text = "Registrese para poder subir un archivo";
            }
        }

        protected void GridViewArchivos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // metodo para descargar el archivo desde el Grid View
            if (e.CommandName == "Descargar")
            {
                GridViewRow registro = GridViewArchivos.Rows[Convert.ToInt32(e.CommandArgument)];
                string filePath = registro.Cells[2].Text;

                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.TransmitFile(filePath);
                Response.End();
            }
        }
    }
}