﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="tp3_equipo25.Layouts.Footer" %>

  <!-- Footer -->
<div class="blockcode mt-3" style="box-shadow: 0 0 1px 1px rgba(0, 0, 0, 0.2);">
  <footer class="page-footer shadow">
    <div
      class="d-flex flex-wrap justify-content-between align-items-center mx-auto py-4 container"
      style="width: 80%"
    >
      <div class="d-flex flex-wrap align-items-center">
        <a class="navbar-brand d-flex align-items-center" href="Default.aspx"><i class="fa-solid fa-store fs-3 me-2 pe-2 border-2 border-end border-dark"></i><span><span class="fs-4 me-1">Grupo</span><span class="fs-4 fw-bold" >25</span></span></a>

        <small class="ms-5">&copy; Grupo 25, <%= DateTime.Now.Year.ToString() %>. Todos los derechos reservados.</small>
      </div>
      <div>
        <a class="btn btn-dark btn-flat p-2" href="https://github.com/dmatia/tp3-equipo25" target="_blank">
          <i class="fa-brands fa-github"></i>
        </a>
        <a class="btn btn-dark btn-flat p-2">
          <i class="fa-brands fa-instagram"></i>
        </a>
        <a class="btn btn-dark btn-flat p-2">
          <i class="fa-brands fa-twitter"></i>
        </a>
      </div>
    </div>
  </footer>
</div>

<%--Fin Footer--%>