using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Töötajate_nimekiri
{
    
    public partial class AdminiVaade : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security = True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateGridView();
            }
        }

        void PopulateGridView()
        {
            DataTable dtbl = new DataTable();
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * FROM [workers]", sqlCon);
                sqlDa.Fill(dtbl);
            }
            if (dtbl.Rows.Count > 0)
            {
                adminView.DataSource = dtbl;
                adminView.DataBind();
            }
            else
            {
                dtbl.Rows.Add(dtbl.NewRow());
                adminView.DataSource = dtbl;
                adminView.DataBind();
                adminView.Rows[0].Cells.Clear();
                adminView.Rows[0].Cells.Add(new TableCell());
                adminView.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
                adminView.Rows[0].Cells[0].Text = "No data found ..!";
                adminView.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }

        }

        protected void adminView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.Equals("Addnew"))
                {
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO [workers] (Nimi,Sünnikuupäev,Amet,Osakond) VALUES (@Nimi,@Sünnikuupäev,@Amet,@Osakond)";
                        SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                        sqlCmd.Parameters.AddWithValue("@Nimi", (adminView.FooterRow.FindControl("txtNimiFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Sünnikuupäev", (adminView.FooterRow.FindControl("txtSünnikuupäevFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Amet", (adminView.FooterRow.FindControl("txtAmetFooter") as TextBox).Text.Trim());
                        sqlCmd.Parameters.AddWithValue("@Osakond", (adminView.FooterRow.FindControl("txtOsakondFooter") as TextBox).Text.Trim());
                        sqlCmd.ExecuteNonQuery();
                        PopulateGridView();
                        lblSuccessMessage.Text = "Töötaja andmed lisatud";
                        lblErrorMessage.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void adminView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            adminView.EditIndex = e.NewEditIndex;
            PopulateGridView();
        }

        protected void adminView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            adminView.EditIndex = -1;
            PopulateGridView();
        }

        protected void adminView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "UPDATE [workers] SET Nimi=@Nimi,Sünnikuupäev=@Sünnikuupäev,Amet=@Amet,Osakond=@Osakond WHERE Id=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@Nimi", (adminView.Rows[e.RowIndex].FindControl("txtNimi") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Sünnikuupäev", (adminView.Rows[e.RowIndex].FindControl("txtSünnikuupäev") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Amet", (adminView.Rows[e.RowIndex].FindControl("txtAmet") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@Osakond", (adminView.Rows[e.RowIndex].FindControl("txtOsakond") as TextBox).Text.Trim());
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(adminView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    adminView.EditIndex = -1;
                    PopulateGridView();
                    lblSuccessMessage.Text = "Valitud töötaja andmed uuendatud";
                    lblErrorMessage.Text = "";
                }
                
            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void adminView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "DELETE FROM [workers] WHERE Id=@id";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                    sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(adminView.DataKeys[e.RowIndex].Value.ToString()));
                    sqlCmd.ExecuteNonQuery();
                    PopulateGridView();
                    lblSuccessMessage.Text = "Valitud töötaja andmed kustutatud";
                    lblErrorMessage.Text = "";
                }

            }
            catch (Exception ex)
            {
                lblSuccessMessage.Text = "";
                lblErrorMessage.Text = ex.Message;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
    }
}