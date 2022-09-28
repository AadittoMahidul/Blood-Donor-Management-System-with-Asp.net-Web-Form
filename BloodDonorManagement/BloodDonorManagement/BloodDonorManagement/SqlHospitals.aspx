<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SqlHospitals.aspx.cs" Inherits="BloodDonorManagement.BloodDonorManagement.SqlHospitals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="../Content/icons/font/bootstrap-icons.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <asp:UpdateProgress class="w-100" ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="d-flex align-items-center text-primary">
              <span>Loading...</span>
              <div class="spinner-border spinner-border-sm ms-auto" role="status" aria-hidden="true"></div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel class="w-100" ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
        <div class="col-12">
            <h2 class="display-6" style="background-color:teal; color: white; text-align: center; border: outset;">Hospitals (SQL Data)</h2>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="HospitalID" DataSourceID="sdsHospitals" InsertItemPosition="LastItem">
                
                <EditItemTemplate>
                    <tr style="">
                        <td>[Auto]</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="HospitalNameTextBox" runat="server" Text='<%# Bind("HospitalName") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="HospitalNameTextBox" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Hospital Name is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="AddressTextBox" CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Hospital Address is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="LocationTextBox" runat="server" Text='<%# Bind("Location") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="LocationTextBox" CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Hospital Location is Required"></asp:RequiredFieldValidator>
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
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="HospitalNameTextBox" runat="server" Text='<%# Bind("HospitalName") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="HospitalNameTextBox" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Hospital Name is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="AddressTextBox" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Hospital Address is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="LocationTextBox" runat="server" Text='<%# Bind("Location") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="LocationTextBox" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Hospital Location is Required"></asp:RequiredFieldValidator>
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
                            <asp:Label ID="HospitalIDLabel" runat="server" Text='<%# Eval("HospitalID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="HospitalNameLabel" runat="server" Text='<%# Eval("HospitalName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        </td>
                        <td>
                            <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
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
                                        <th runat="server">Hospital Name</th>
                                        <th runat="server">Address</th>
                                        <th runat="server">Location</th>
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
            <asp:SqlDataSource ID="sdsHospitals" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Hospitals] WHERE [HospitalID] = @HospitalID" InsertCommand="INSERT INTO [Hospitals] ([HospitalName], [Address], [Location]) VALUES (@HospitalName, @Address, @Location)" SelectCommand="SELECT * FROM [Hospitals]" UpdateCommand="UPDATE [Hospitals] SET [HospitalName] = @HospitalName, [Address] = @Address, [Location] = @Location WHERE [HospitalID] = @HospitalID">
                <DeleteParameters>
                    <asp:Parameter Name="HospitalID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="HospitalName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="Location" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="HospitalName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="HospitalID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
     
</asp:Content>
