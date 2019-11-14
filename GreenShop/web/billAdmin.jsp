<%-- 
    Document   : flowerAdmin.jsp
    Created on : Jul 10, 2019, 12:55:19 PM
    Author     : hp
--%>

<%@page import="dao.CustomerDAO"%>
<%@page import="model.Bill"%>
<%@page import="dao.BillDAO"%>
<%@page import="model.Bill_Detail"%>
<%@page import="model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Cart"%>
<%@page import="model.Flower"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
=========================================================
 Paper Dashboard 2 - v2.0.0
=========================================================

 Product Page: https://www.creative-tim.com/product/paper-dashboard-2
 Copyright 2019 Creative Tim (https://www.creative-tim.com)
 Licensed under MIT (https://github.com/creativetimofficial/paper-dashboard/blob/master/LICENSE)

 Coded by Creative Tim

=========================================================

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. -->



<!DOCTYPE html>
<html lang="en">

    <head>
    
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" sizes="76x76" href="./paper-dashboard-master/assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="./paper-dashboard-master/assets/img/favicon.png">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            Paper Dashboard 2
        </title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!--     Fonts and icons     -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
        <!-- CSS Files -->
        <link href="./paper-dashboard-master/assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="./paper-dashboard-master/assets/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link href="./paper-dashboard-master/assets/demo/demo.css" rel="stylesheet" />
        <style type="text/css">
            input {
                width:100px;
            }
            .btn {
                background:#eaeaea;
                color:white;
                font-size:0.9em;
                text-align:left;
                padding : 9px ;
                margin-top:5px;
                width:85px;
            }
            .btn--red {
                background-color: #d9534f;
                border-color: #d43f3a;
            }
            .btn--blue {
                background-color: #337ab7;
                border-color: #2e6da4;
            }
            .btn--big {
                width:96px;
                padding:12px;
            }
            .addRow {
                background:#eaeaea;
            }
            .addRow input {
                background:#eaeaea;
            }
            .hide {
                display:none;
            }

        </style>
    </head>

    <body class="">
        <div class="wrapper ">
            <div class="sidebar" data-color="white" data-active-color="danger">
                <!--
                  Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red | yellow"
                -->
                <div class="logo">
                    <a href="http://www.creative-tim.com" class="simple-text logo-mini">
                        <div class="logo-image-small">
                            <img src="./paper-dashboard-master/assets/img/logo-small.png">
                        </div>
                    </a>
                    <a href="http://www.creative-tim.com" class="simple-text logo-normal">
                        Creative Tim
                    </a>
                </div>


                <div class="sidebar-wrapper">
                    <ul class="nav">
                        <li >
                            <%
                                if (session.getAttribute("sessUserRole").toString().equals("1")) {
                            %>
                            <a href="dashboard.jsp">
                                <i class="nc-icon nc-bank"></i>
                                <p>Dashboard</p>
                            </a>
                        </li>

                        <li class="active ">
                            <a href="billAdmin" >
                                <i class="nc-icon nc-bell-55"></i>
                                <p>Order</p>
                            </a>
                        </li>
                        <li>
                            <a href="userAdmin">
                                <i class="nc-icon nc-single-02"></i>
                                <p>User Profile</p>
                            </a>
                        </li>
                        <li>
                            <a href="flowerAdmin">
                                <i class="nc-icon nc-tile-56"></i>
                                <p>Flower Management</p>
                            </a>
                        </li>
                        <li>
                            <a href="categoryAdmin">
                                <i class="nc-icon nc-tile-56"></i>
                                <p>Category Management</p>
                            </a>
                        </li>
                        <%} else {%>
                        <li class="active ">
                            <a href="billAdmin" >
                                <i class="nc-icon nc-bell-55"></i>
                                <p>Order</p>
                            </a>
                        </li><%}%>
                    </ul>
                </div>
            </div>
            <div class="main-panel">
                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
                    <div class="container-fluid">
                        <div class="navbar-wrapper">
                            <div class="navbar-toggle">
                                <button type="button" class="navbar-toggler">
                                    <span class="navbar-toggler-bar bar1"></span>
                                    <span class="navbar-toggler-bar bar2"></span>
                                    <span class="navbar-toggler-bar bar3"></span>
                                </button>
                            </div>
                            <a class="navbar-brand" href="#pablo">Paper Dashboard 2</a>
                        </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                            <span class="navbar-toggler-bar navbar-kebab"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navigation">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link btn-magnify" href="#pablo">
                                        <i class="nc-icon nc-layout-11"></i>
                                        <p>
                                            <span class="d-lg-none d-md-block">Stats</span>
                                        </p>
                                    </a>
                                </li>
                                <li class="nav-item btn-rotate dropdown">
                                    <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="nc-icon nc-settings-gear-65"></i>
                                        <p>
                                            <span class="d-lg-none d-md-block">Some Actions</span>
                                        </p>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="LogoutServlet">Sign out</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- End Navbar -->
                <!-- <div class="panel-header panel-header-sm">
          
          
          </div> -->

                <%
                    CustomerDAO cd = new CustomerDAO();
                    BillDAO bd = new BillDAO();
                    ArrayList<Bill_Detail> list = new ArrayList<Bill_Detail>();
                    list = (ArrayList<Bill_Detail>) request.getAttribute("list");
                %>
                <div class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Order Management</h4>

                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <thead class=" text-primary">
                                            <th>
                                                Bill ID
                                            </th>
                                            <th>
                                                BillDetail ID
                                            </th>
                                            <th>
                                                Customer
                                            </th>
                                            <th>
                                                Product ID
                                            </th>
                                            <th >
                                                Price
                                            </th>
                                            <th >
                                                Quantity
                                            </th>
                                            <th>
                                                Date
                                            </th>
                                            <th >
                                                Status
                                            </th>
                                            <th >
                                                Manage
                                            </th>
                                            </thead>
                                            <tbody>

                                                <%
                                                    for (Bill_Detail b : list) {
                                                %>
                                            <form action="ManageOrder" method="get">
                                                <tr>
                                                    <td>
                                                        <input type="text" name="billid" style="width:70px;border:none;text-indent: 20px" value="<%=b.getBillID()%>">     
                                                    </td>
                                                    <td>
                                                        <input type="text" name="billdetailid" style="width:100px;border:none; text-indent: 42px;" value="<%=b.getBillDetailID()%>">     
                                                    </td>
                                                    <td>
                                                        <input type="text" name="customerid" style="width:150px;border:none;" value="<%=cd.getEmail(bd.getCustomerID(b.getBillID()))%>">     
                                                    </td>
                                                    <td>
                                                        <input type="text" name="fid" style="border:none;text-indent:35px;" value="<%=b.getfID()%>">
                                                    </td>
                                                    <td>
                                                        <input type="text" name="price" style="border:none;" value="<%=b.getPrice()%>">
                                                    </td>
                                                    <td>
                                                        <input type="text" name="quantity" style="border:none;text-indent:35px" value="<%=b.getQuantity()%>">
                                                    </td>
                                                    <td>
                                                        <input type="text" name="date" style="border:none;" value="<%=bd.getDate(b.getBillID())%>">
                                                    </td>
                                                    <%
                                                        if (b.getStatus().equals("Chưa giao")) {
                                                    %>
                                                    <td>
                                                        <input type="text"  style="border:none; color:gray;font-weight:500;" value="Chưa giao">
                                                    </td>
                                                    <td>
                                                        <input type="hidden" name="status" value="Đã giao">
                                                        <input class="btn btn--blue" type="submit" value="Thay đổi" value="Update" name="Update" onclick="function update() {
                                                                    alert('Update Success!')
                                                                }
                                                                ;
                                                                update()"> 
                                                    </td>
                                                    <%
                                                    } else {
                                                    %>  
                                                    <td>
                                                        <input type="text" style="border:none;color:blue;font-weight:500;" value="Đã giao">
                                                    </td>
                                                    <td>
                                                        <input type="hidden" name="status" value="Chưa giao">
                                                        <input class="btn btn--blue" type="submit" value="Thay đổi" value="Update" name="Update" onclick="function update() {
                                                                    alert('Update Success!')
                                                                }
                                                                ;
                                                                update()"> 


                                                    </td>
                                                    <%
                                                        }
                                                    %>

                                                </tr>
                                            </form>
                                            <% }%>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <footer class="footer footer-black  footer-white ">
                    <div class="container-fluid">
                        <div class="row">
                            <nav class="footer-nav">
                                <ul>
                                    <li>
                                        <a href="https://www.creative-tim.com" target="_blank">Creative Tim</a>
                                    </li>
                                    <li>
                                        <a href="http://blog.creative-tim.com/" target="_blank">Blog</a>
                                    </li>
                                    <li>
                                        <a href="https://www.creative-tim.com/license" target="_blank">Licenses</a>
                                    </li>
                                </ul>
                            </nav>
                            <div class="credits ml-auto">
                                <span class="copyright">
                                    ©
                                    <script>
                                        document.write(new Date().getFullYear())
                                    </script>, made with <i class="fa fa-heart heart"></i> by Creative Tim
                                </span>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <!--   Core JS Files   -->
        <script src="./paper-dashboard-master/assets/js/core/jquery.min.js"></script>
        <script src="./paper-dashboard-master/assets/js/core/popper.min.js"></script>
        <script src="./paper-dashboard-master/assets/js/core/bootstrap.min.js"></script>
        <script src="./paper-dashboard-master/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
        <!--  Google Maps Plugin    -->
        <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
        <!-- Chart JS -->
        <script src="./paper-dashboard-master/assets/js/plugins/chartjs.min.js"></script>
        <!--  Notifications Plugin    -->
        <script src="./paper-dashboard-master/assets/js/plugins/bootstrap-notify.js"></script>
        <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
        <script src="./paper-dashboard-master/assets/js/paper-dashboard.min.js?v=2.0.0" type="text/javascript"></script>
        <!-- Paper Dashboard DEMO methods, don't include it in your project! -->
        <script src="./paper-dashboard-master/assets/demo/demo.js"></script>
    </body>

</html>
