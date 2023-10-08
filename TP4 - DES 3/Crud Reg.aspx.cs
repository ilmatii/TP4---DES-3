using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP4___DES_3
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                completartabla();
            }
        }

        
        
        protected void completartabla()
        {
            try
            {
                DataView dv = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);

                if (dv != null && dv.Count >0)
                {

                   
                    TableRow headerRow = new TableRow();
                    
                    TableCell headerCell1 = new TableCell();
                    headerCell1.Text = "Cuenta";
                    headerRow.Cells.Add(headerCell1);

                    TableCell headerCell2 = new TableCell();
                    headerCell2.Text = "Monto";
                    headerRow.Cells.Add(headerCell2);

                    TableCell headerCell3 = new TableCell();
                    headerCell3.Text = "Tipo";
                    headerRow.Cells.Add(headerCell3);

                    Table1.Rows.Add(headerRow);

                 
                    foreach (DataRowView rowview in dv)
                    {
                        DataRow row = rowview.Row;
                        TableRow tableRow = new TableRow();

                        TableCell cell1 = new TableCell();
                        cell1.Text = row["descripcion"].ToString();
                        tableRow.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = row["monto"].ToString();
                        tableRow.Cells.Add(cell2);

                        TableCell cell3 = new TableCell();
                        bool tipo = Convert.ToBoolean(row["tipo"]);
                        cell3.Text = tipo ? "Haber" : "Debe"; 
                        tableRow.Cells.Add(cell3);

                        Table1.Rows.Add(tableRow);
                    }

                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", $"alert('Error');", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            string idCuenta = DropDownList1.SelectedValue;
            string monto = TextBox1.Text;
            string valorSeleccionado = DropDownList2.SelectedValue;

           
            if (string.IsNullOrEmpty(idCuenta) || string.IsNullOrEmpty(monto) || string.IsNullOrEmpty(valorSeleccionado))
            {
                Label5.Text = "Por favor, complete todos los campos.";
                completartabla();
            }
            else
            {
                
                bool tipo = (valorSeleccionado == "1");

               
                SqlDataSource4.InsertParameters["idcuenta"].DefaultValue = idCuenta;
                SqlDataSource4.InsertParameters["monto"].DefaultValue = monto;
                SqlDataSource4.InsertParameters["tipo"].DefaultValue = tipo.ToString();

                int result = SqlDataSource4.Insert();
                if (result != 0)
                {
                    Label5.Text = "Se ha agregado " + result.ToString() + " registro";
                    DropDownList5.DataBind();
                    completartabla();
                }
                else
                {
                    Label5.Text = "No se agregó ningún registro";
                }
            }
        }
        

            protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = DropDownList5.SelectedValue;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cadena1"].ConnectionString))
            {
                connection.Open();
                SqlCommand cmd = new SqlCommand("SELECT monto, tipo FROM RegistrosContables WHERE id = @id", connection);
                cmd.Parameters.AddWithValue("@id", selectedValue);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    TextBox2.Text = reader["monto"].ToString();

                    
                    string tipo = reader["tipo"].ToString();
                    if (tipo == "True")
                    {
                        DropDownList4.SelectedValue = "1"; 
                    }
                    else if (tipo == "False")
                    {
                        DropDownList4.SelectedValue = "0"; 
                    }
                }

                completartabla();
                reader.Close();
            }
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            
            string selectedValue = DropDownList5.SelectedValue;
            string monto = TextBox2.Text;
            bool tipo = DropDownList4.SelectedValue == "1"; 

            if (string.IsNullOrEmpty(selectedValue) || string.IsNullOrEmpty(monto))
            {
                Label5.Text = "Por favor, complete todos los campos.";
            }
            else
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["cadena1"].ConnectionString))
                {
                    connection.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE [RegistrosContables] SET [monto] = @monto, [tipo] = @tipo WHERE [id] = @id", connection);
                    cmd.Parameters.AddWithValue("@id", selectedValue);
                    cmd.Parameters.AddWithValue("@monto", monto);
                    cmd.Parameters.AddWithValue("@tipo", tipo);

                    int result = cmd.ExecuteNonQuery(); 

                    if (result > 0)
                    {
                        Label5.Text = "Se ha actualizado " + result.ToString() + " registro";
                        completartabla();
                    }
                    else
                    {
                        Label5.Text = "No se actualizó ningún registro";
                    }
                }
            }
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            int result = SqlDataSource4.Delete();
            if (result != 0)
            {

                Label5.Text = "Se ha eliminado " + result.ToString() + " registro";
                DropDownList5.DataBind();
                completartabla();
            }
            else
            {
                Label5.Text = "No se elimino ningún registro";
            }
        }

       







    }
}