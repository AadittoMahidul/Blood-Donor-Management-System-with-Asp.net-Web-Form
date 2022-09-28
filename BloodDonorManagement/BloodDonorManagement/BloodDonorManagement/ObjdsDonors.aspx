<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ObjdsDonors.aspx.cs" Inherits="BloodDonorManagement.BloodDonorManagement.ObjdsDonors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="../Content/icons/font/bootstrap-icons.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-12">

        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <h2 class="display-6" style="background-color:teal; color: white; text-align: center; border: outset;">Donors Form (OBJ Data)</h2>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="DonorID" DataSourceID="odsDonors" InsertItemPosition="LastItem" OnItemDataBound="ListView1_ItemDataBound">
                
                <EditItemTemplate>
                    <tr style="">
                        <td>[Auto]</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="DonorNameTextBox" runat="server" Text='<%# Bind("DonorName") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="DonorNameTextBox" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Donor Name is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="WeightTextBox" runat="server" Text='<%# Bind("Weight") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="WeightTextBox" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Weight is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="DonorPhoneTextBox" runat="server" Text='<%# Bind("DonorPhone") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="DonorPhoneTextBox" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Phone is Required"></asp:RequiredFieldValidator>                        
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="DonorEmailTextBox" runat="server" Text='<%# Bind("DonorEmail") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="DonorEmailTextBox" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>                        
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="DonorAddressTextBox" runat="server" Text='<%# Bind("DonorAddress") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="DonorAddressTextBox" CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Address is Required"></asp:RequiredFieldValidator>                        
                        </td>
                        <td>
                            <asp:CheckBox CssClass="form-check mt-1" ID="AvailableCheckBox" runat="server" Checked='<%# Bind("Available") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control date" ValidationGroup="ge" ID="LastDonationTextBox" runat="server" Text='<%# Bind("LastDonation") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="LastDonationTextBox" CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Donation date is Required"></asp:RequiredFieldValidator>                        
                        </td>
                        <td>
                            <img src='<%# Eval("Picture", "Uploads/{0}") %>' class="img-thumbnail" />
                            <asp:FileUpload ValidationGroup="gi" ID="fu" runat="server" />
                            <asp:HiddenField ID="PictureTextBox" runat="server" Value='<%# Bind("Picture") %>' />
                        </td>              
                        <td>
                            <asp:DropDownList ValidationGroup="ge" ID="DonorIdDDL" DataSourceID="odsBlood" CssClass="form-select" runat="server" SelectedValue='<%# Bind("BloodID") %>' DataValueField="BloodID" DataTextField="BloodGroup" AppendDataBoundItems="True">
                                <asp:ListItem Value="" Text="Select one" Selected="True" />
                            </asp:DropDownList>                           
                        <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="DonorIdDDL" CssClass="text-danger" ID="RequiredFieldValidator7" runat="server" ErrorMessage="BloodId is Required"></asp:RequiredFieldValidator>                        
                        </td>
                        <td>
                            <asp:Button ValidationGroup="ge" CssClass="btn btn-primary btn-sm" ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ValidationGroup="ge" CssClass="btn btn-secondary btn-sm" CausesValidation="false" ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>             
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" class="table table-bordered">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>&nbsp;</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="DonorNameTextBox" runat="server" Text='<%# Bind("DonorName") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="DonorNameTextBox" CssClass="text-danger" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Donor Name is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="WeightTextBox" runat="server" Text='<%# Bind("Weight") %>' />
                            <asp:RequiredFieldValidator  Display="Dynamic" ValidationGroup="gi" ControlToValidate="WeightTextBox" CssClass="text-danger" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Weight is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="DonorPhoneTextBox" runat="server" Text='<%# Bind("DonorPhone") %>' />
                            <asp:RequiredFieldValidator  Display="Dynamic" ValidationGroup="gi" ControlToValidate="DonorPhoneTextBox" CssClass="text-danger" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Weight is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="DonorEmailTextBox" runat="server" Text='<%# Bind("DonorEmail") %>' />
                            <asp:RequiredFieldValidator  Display="Dynamic" ValidationGroup="gi" ControlToValidate="DonorEmailTextBox" CssClass="text-danger" ID="RequiredFieldValidator11" runat="server" ErrorMessage="Weight is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="DonorAddressTextBox" runat="server" Text='<%# Bind("DonorAddress") %>' />
                            <asp:RequiredFieldValidator  Display="Dynamic" ValidationGroup="gi" ControlToValidate="DonorAddressTextBox" CssClass="text-danger" ID="RequiredFieldValidator12" runat="server" ErrorMessage="Weight is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:CheckBox CssClass="form-check mt-1" ID="AvailableCheckBox" runat="server" Checked='<%# Bind("Available") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control date" ValidationGroup="gi" ID="LastDonationTextBox" runat="server" Text='<%# Bind("LastDonation") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="LastDonationTextBox" CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Donation date is Required"></asp:RequiredFieldValidator>                        
                        </td>
                        <td>
                            <asp:FileUpload ValidationGroup="gi" ID="fu" runat="server" />
                            <asp:HiddenField ID="PictureTextBox" runat="server" Value='<%# Bind("Picture") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="fu" CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Picture Required"></asp:RequiredFieldValidator>
                        </td>
                        
                        <td>
                            <asp:DropDownList ValidationGroup="ge" ID="DonorIdDDL" DataSourceID="odsBlood" CssClass="form-select" runat="server" SelectedValue='<%# Bind("BloodID") %>' DataValueField="BloodID" DataTextField="BloodGroup" AppendDataBoundItems="True">
                                <asp:ListItem Value="" Text="Select one" Selected="True" />
                            </asp:DropDownList>                           
                        <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="DonorIdDDL" CssClass="text-danger" ID="RequiredFieldValidator7" runat="server" ErrorMessage="BloodId is Required"></asp:RequiredFieldValidator>                        
                        </td>
                        <td style="width: 150px; text-align: center">
                            <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="gi" ID="Button1" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ValidationGroup="gi" ID="Button2" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        
                        <td>
                            <asp:Label ID="DonorIDLabel" runat="server" Text='<%# Eval("DonorID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DonorNameLabel" runat="server" Text='<%# Eval("DonorName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="WeightLabel" runat="server" Text='<%# Eval("Weight") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DonorPhoneLabel" runat="server" Text='<%# Eval("DonorPhone") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DonorEmailLabel" runat="server" Text='<%# Eval("DonorEmail") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DonorAddressLabel" runat="server" Text='<%# Eval("DonorAddress") %>' />
                        </td>
                        <td>
                            <asp:CheckBox ID="AvailableCheckBox" runat="server" Checked='<%# Eval("Available") %>' Enabled="false" />
                        </td>
                        <td>
                            <asp:Label ID="LastDonationLabel" runat="server" Text='<%# Eval("LastDonation") %>' />
                        </td>
                        <td>
                            <img src='<%# Eval("Picture", "/Uploads/{0}") %>' class="img-thumbnail" style="width:60px; height:50px;" />
                        </td>
                        
                        <td>
                            <asp:Label ID="BloodIDLabel" runat="server" Text='<%# Eval("BloodID") %>' />
                        </td>
                        <td style="text-align: center">
                            <asp:Button CssClass="btn btn-danger btn-sm" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="text-align:center">
                                    <tr runat="server" style="">
                                        <th runat="server">ID</th>
                                        <th runat="server">Donor Name</th>
                                        <th runat="server">Weight</th>
                                        <th runat="server">Donor Phone</th>
                                        <th runat="server">Donor Email</th>
                                        <th runat="server">Donor Address</th>
                                        <th runat="server">Available</th>
                                        <th runat="server">Last Donation</th>
                                        <th runat="server">Picture</th>
                                        <th runat="server">Blood Group</th>
                                        <th runat="server">Button</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                
            </asp:ListView>
            <asp:ObjectDataSource ID="odsDonors" runat="server" DataObjectTypeName="BloodDonorManagement.BloodDonorManagementBLL.DonorDTO" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetAll" TypeName="BloodDonorManagement.BloodDonorManagementBLL.DonorManager" UpdateMethod="Update"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsBlood" runat="server" SelectMethod="BloodDropItems" TypeName="BloodDonorManagement.BloodDonorManagementBLL.DonorManager"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
