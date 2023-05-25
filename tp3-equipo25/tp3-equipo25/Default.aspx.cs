﻿using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp3_equipo25
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
                ArticuloNegocio articulosNegocio = new ArticuloNegocio();
             Session.Add("ListaArticulos", articulosNegocio.listar());
             RepCards.DataSource = Session["ListaArticulos"];
            RepCards.DataBind();

        }

        protected void BtnDetalle_Click(object sender, EventArgs e)
        {
            int ArticuloId = int.Parse(((Button)sender).CommandArgument);
            Session.Add("DetalleArticuloId", ArticuloId);
           /// Response.Redirect("Detalle.aspx", false);
        }
    }
}