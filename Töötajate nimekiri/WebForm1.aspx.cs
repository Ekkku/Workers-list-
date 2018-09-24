using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Töötajate_nimekiri
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TextBox1.Text))
            {
                Response.Redirect("home.aspx");
            }
            else
            {
                try
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnect"].ConnectionString);
                    con.Open();
                    string insert = "insert into workers (Nimi, Sünnikuupäev, Amet, Osakond) values(@Nimi, @Sünnikuupäev, @Amet, @Osakond)";
                    SqlCommand cmd = new SqlCommand(insert, con);
                    cmd.Parameters.AddWithValue("@Nimi", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@Sünnikuupäev", TextBox2.Text);
                    cmd.Parameters.AddWithValue("@Amet", TextBox3.Text);
                    cmd.Parameters.AddWithValue("@Osakond", TextBox4.Text);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("home.aspx");
                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                }
            }
                
        }
    }
}