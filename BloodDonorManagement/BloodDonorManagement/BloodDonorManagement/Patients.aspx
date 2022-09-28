<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="BloodDonorManagement.BloodDonorManagement.Patients" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row">
        <div class="col-12">
            <h2 class="display-6" style="background-color:teal; color: white; text-align: center; border: outset;">Patient Table 2DD (SQL Data)</h2>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="PatientID" DataSourceID="dsPatients" InsertItemPosition="LastItem" OnItemDataBound="ListView1_ItemDataBound">
                
                <EditItemTemplate>
                    <tr style="">
                        
                        <td>[Auto]</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="PatientNameTextBox" runat="server" Text='<%# Bind("PatientName") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="PatientNameTextBox" CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Patient Name is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="PatientAddressTextBox" runat="server" Text='<%# Bind("PatientAddress") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="PatientAddressTextBox" CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Patient Address is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ge" TextMode="Number" ID="PaymentTextBox" runat="server" Text='<%# Bind("Payment") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="PaymentTextBox" CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Patient is Required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator Display="Dynamic" ValidationGroup="ge" CssClass="text-danger" ID="CompareValidator1" ControlToValidate="PaymentTextBox" runat="server" ErrorMessage="Invalid value" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                        </td>
                        <td>
                            <asp:DropDownList ValidationGroup="ge" ID="DonorIdDDL" DataSourceID="dsBlood" CssClass="form-select" runat="server" SelectedValue='<%# Bind("BloodID") %>' DataValueField="BloodID" DataTextField="BloodGroup" AppendDataBoundItems="True">
                                <asp:ListItem Value="" Text="Select One" Selected="True" />
                            </asp:DropDownList>                           
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="DonorIdDDL" CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="BloodID is Required"></asp:RequiredFieldValidator>                        
                        </td>
                        <td>
                            <asp:DropDownList ValidationGroup="ge" ID="HospitalIdDDL" DataSourceID="dsHospitals" CssClass="form-select" runat="server" SelectedValue='<%# Bind("HospitalID") %>' DataValueField="HospitalID" DataTextField="HospitalName" AppendDataBoundItems="True">
                                <asp:ListItem Value="" Text="Select One" Selected="True" />
                            </asp:DropDownList>                           
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="ge" ControlToValidate="HospitalIdDDL" CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="HospitalID is Required"></asp:RequiredFieldValidator>                        
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
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="PatientNameTextBox" runat="server" Text='<%# Bind("PatientName") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="PatientNameTextBox" CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Patient Name is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="PatientAddressTextBox" runat="server" Text='<%# Bind("PatientAddress") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="PatientAddressTextBox" CssClass="text-danger" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Patient Address is Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="PaymentTextBox" runat="server" Text='<%# Bind("Payment") %>' />
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="PaymentTextBox" CssClass="text-danger" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Patient is Required"></asp:RequiredFieldValidator>
                            <asp:CompareValidator Display="Dynamic" ValidationGroup="gi" CssClass="text-danger" ID="CompareValidator2" ControlToValidate="PaymentTextBox" runat="server" ErrorMessage="Invalid value" Operator="DataTypeCheck" Type="Double"></asp:CompareValidator>
                            <asp:RangeValidator ID="RangeValidator1" ValidationGroup="gi" ControlToValidate="PaymentTextBox" MinimumValue="200.00" MaximumValue="9000.00" runat="server" ErrorMessage="Value must be between 200.00 & 9000.00 TK"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:DropDownList ValidationGroup="gi" ID="DonorIdDDL" DataSourceID="dsBlood" CssClass="form-select" runat="server" SelectedValue='<%# Bind("BloodID") %>' DataValueField="BloodID" DataTextField="BloodGroup" AppendDataBoundItems="True">
                                <asp:ListItem Value="" Text="Select One" Selected="True" />
                            </asp:DropDownList>                           
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="DonorIdDDL" CssClass="text-danger" ID="RequiredFieldValidator9" runat="server" ErrorMessage="BloodID is Required"></asp:RequiredFieldValidator>                        
                        </td>
                        <td>
                            <asp:DropDownList ValidationGroup="gi" ID="HospitalIdDDL" DataSourceID="dsHospitals" CssClass="form-select" runat="server" SelectedValue='<%# Bind("HospitalID") %>' DataValueField="HospitalID" DataTextField="HospitalName" AppendDataBoundItems="True">
                                <asp:ListItem Value="" Text="Select One" Selected="True" />
                            </asp:DropDownList>                           
                            <asp:RequiredFieldValidator Display="Dynamic" ValidationGroup="gi" ControlToValidate="HospitalIdDDL" CssClass="text-danger" ID="RequiredFieldValidator10" runat="server" ErrorMessage="HospitalID is Required"></asp:RequiredFieldValidator>                        
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
                            <asp:Label ID="PatientIDLabel" runat="server" Text='<%# Eval("PatientID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PatientNameLabel" runat="server" Text='<%# Eval("PatientName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PatientAddressLabel" runat="server" Text='<%# Eval("PatientAddress") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PaymentLabel" runat="server" Text='<%# Eval("Payment") %>' />
                        </td>
                        <td>
                            <asp:Label ID="BloodIDLabel" runat="server" Text='<%# Eval("BloodID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="HospitalIDLabel" runat="server" Text='<%# Eval("HospitalID") %>' />
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
                                        
                                        <th runat="server">Patient Name</th>
                                        <th runat="server">Patient Address</th>
                                        <th runat="server">Payment</th>
                                        <th runat="server">Blood Group</th>
                                        <th runat="server">Hospital Name</th>
                                        <th runat="server">Button</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                    </Fields>
                                </asp:DataPager>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                
            </asp:ListView>
            <asp:SqlDataSource ID="dsPatients" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Patients] WHERE [PatientID] = @PatientID" InsertCommand="INSERT INTO [Patients] ([PatientName], [PatientAddress], [Payment], [BloodID], [HospitalID]) VALUES (@PatientName, @PatientAddress, @Payment, @BloodID, @HospitalID)" SelectCommand="SELECT * FROM [Patients]" UpdateCommand="UPDATE [Patients] SET [PatientName] = @PatientName, [PatientAddress] = @PatientAddress, [Payment] = @Payment, [BloodID] = @BloodID, [HospitalID] = @HospitalID WHERE [PatientID] = @PatientID">
                <DeleteParameters>
                    <asp:Parameter Name="PatientID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PatientName" Type="String" />
                    <asp:Parameter Name="PatientAddress" Type="String" />
                    <asp:Parameter Name="Payment" Type="Decimal" />
                    <asp:Parameter Name="BloodID" Type="Int32" />
                    <asp:Parameter Name="HospitalID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PatientName" Type="String" />
                    <asp:Parameter Name="PatientAddress" Type="String" />
                    <asp:Parameter Name="Payment" Type="Decimal" />
                    <asp:Parameter Name="BloodID" Type="Int32" />
                    <asp:Parameter Name="HospitalID" Type="Int32" />
                    <asp:Parameter Name="PatientID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsHospitals" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Hospitals]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="dsBlood" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT * FROM [Blood]"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
