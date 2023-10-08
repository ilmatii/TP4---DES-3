using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP4___DES_3
{
    public partial class CreateCuenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
            updateLabel();
            }
        }


        protected void updateLabel()
        {
            Label2.Text = "";
            DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            foreach(DataRowView dr in dv)
            {
                DataRow row = dr.Row;
                
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource2.InsertParameters["descripcion"].DefaultValue = TextBox1.Text;
                int result = SqlDataSource2.Insert();
                if (result != 0)
                {
                    Label3.Text = "Se ha agregado " + result.ToString() + " cuenta";
                    updateLabel();
                }


                else
                {
                    Label3.Text = "No se pudo agregar la cuenta (Inserte un dato valido)";
                }
            }
            catch
            {
                Label3.Text = "No se pudo agregar la cuenta (No inserte datos vacios)";
            }
               
             
        }


        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource3.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader reader = (SqlDataReader)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            if (reader.Read()) {
                TextBox2.Text = reader["descripcion"].ToString();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            { 
            SqlDataSource2.DeleteParameters["id"].DefaultValue = ListBox1.SelectedValue;
            int result = SqlDataSource2.Delete();
            if (result != 0)
            {
                Label3.Text = "Se ha eliminado " + result.ToString() + " cuenta";
                updateLabel();
                TextBox2.Text = "";
            }
            else
            {
                Label3.Text = "No se elimino ninguna cuenta";
            }
            }
            catch
            {
                Label3.Text = "No se puede eliminar una cuenta en uso";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDataSource2.UpdateParameters["id"].DefaultValue = ListBox1.SelectedValue;
            SqlDataSource2.UpdateParameters["descripcion"].DefaultValue = TextBox2.Text;
            int result = SqlDataSource2.Update();
            if (result != 0)
            {
                Label3.Text = "Se ha modificado " + result.ToString() + " cuenta";
                updateLabel();
                TextBox2.Text = "";
            }
            else
            {
                Label3.Text = "No se modifico ninguna cuenta";
            }
        }
    }
}