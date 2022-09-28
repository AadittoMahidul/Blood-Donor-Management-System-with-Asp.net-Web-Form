<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="BloodDonorManagement.AboutUs" %>

<%@ Register Src="~/AboutUserCtrl.ascx" TagPrefix="uc1" TagName="AboutUserCtrl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <uc1:AboutUserCtrl runat="server" id="AboutUserCtrl" />
</asp:Content>
