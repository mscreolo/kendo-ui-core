<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

<div class="demo-section">
    <h2>Customers</h2>
    <%= Html.Kendo().DropDownList()
          .Name("customers")
          .HtmlAttributes(new { style = "width: 400px" })
          .DataTextField("ContactName")
          .DataValueField("CustomerID")
          .DataSource(source =>
          {
              source.Read(read =>
              {
                  read.Action("GetCustomers", "Home");
              });
          })
          .Height(300)
          .HeaderTemplate("<div class=\"k-widget k-header dropdown-header\">" +
                              "<span class=\"first\">Photo</span>" +
                              "<span class=\"last\">Contact info</span>" +
                          "</div>")
              .Template("<img src=\"" + Url.Content("~/Content/web/Customers/") + "${data.CustomerID}.jpg\" alt=\"${data.CustomerID}\" />" +
                            "<dl>" +
                                "<dt>Contact:</dt><dd>${ data.ContactName }</dd>" +
                                "<dt>Company:</dt><dd>${ data.CompanyName }</dd>" +
                            "</dl>")
%>
</div>
            
<div class="demo-section">
    <h2>Information</h2>
    <p>
        Open the DropDownList to see the customized appearance of the items.
    </p>
</div>

<style>
    .dropdown-header {
        overflow:hidden;
        font-size: 1.3em;
        padding: 5px 2px;
        margin: -2px -2px 0;
        border-width: 0 0 1px;
    }

    .dropdown-header .first {
        width: 65px;
        margin-left:4px;
        display: block;
        float: left;
        text-align: left;
    }

    .dropdown-header .last {
        margin-left: 22px;
        float: left;
    }

    .demo-section {
        width: 400px;
        margin: 35px auto 50px;
        padding: 30px;
    }
    .demo-section h2 {
        text-transform: uppercase;
        font-size: 1.2em;
        margin-bottom: 10px;
    }
    #customers-list {
        padding-bottom: 30px;
    }

    #customers-list .k-item {
        overflow: hidden; /* clear floated images */
    }
    #customers-list img {
        -moz-box-shadow: 0 0 2px rgba(0,0,0,.4);
        -webkit-box-shadow: 0 0 2px rgba(0,0,0,.4);
        box-shadow: 0 0 2px rgba(0,0,0,.4);
        float: left;
        width: 70px;
        height: 70px;
        margin: 5px 20px 5px 0px;
    }
    #customers-list h3 {
        margin: 20px 0 5px 0;
        font-size: 1.6em;
    }
    #customers-list p {
        margin: 0;
    }
</style>
</asp:Content>