<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatientDonors.aspx.cs" Inherits="BloodDonorManagement.BloodDonorManagement.PatientDonors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
     <link href="/Content/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        .err {
            font-size:.800rem;
        }
        th a {
            text-decoration:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row px-2">
        <div class="col-12 border-bottom mb-3">
            <h2 class="display-6" style="background-color:teal; color:white; text-align:center; border:outset;">PatientDonors (SQL Data) </h2>
        </div>
        <div class="col-6 border-end">
            <h3 class="display-6">Patient Donor</h3>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped" DataKeyNames="PatientID" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dsPatients" OnRowDataBound="GridView1_RowDataBound">
                <SelectedRowStyle CssClass="bg-secondary text-white" />
                <HeaderStyle CssClass="bg-light" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" CssClass="btn btn-primary btn-sm" Text="Select"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PatientName" HeaderText="PatientName" SortExpression="PatientName" />
                    
                    <asp:BoundField DataField="BloodGroup" HeaderText="BloodGroup" SortExpression="BloodGroup" />
                    <asp:BoundField DataField="DonorName" HeaderText="DonorName" SortExpression="DonorName" />
                    <asp:BoundField DataField="DonorPhone" HeaderText="DonorPhone" SortExpression="DonorPhone" />
                    
                    <asp:BoundField DataField="PatientID" HeaderText="PatientID" InsertVisible="False" ReadOnly="True" SortExpression="PatientID" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsPatients" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" SelectCommand="SELECT Patients.PatientName, Patients.PatientAddress, Blood.BloodGroup, Donors.DonorName, Donors.DonorPhone, Donors.LastDonation, Donors.Available, Patients.PatientID FROM Patients INNER JOIN Blood ON Patients.BloodID = Blood.BloodID INNER JOIN Donors ON Blood.BloodID = Donors.BloodID"></asp:SqlDataSource>
        </div>
        <div class="col-6 border-end">
            <h3 class="display-6">Select PatientDonors</h3>
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="DonationID" DataSourceID="dsPatientsDonors" InsertItemPosition="LastItem" OnItemInserting="ListView1_ItemInserting" OnItemDataBound="ListView1_ItemDataBound">                             
                
                <EditItemTemplate>
                    <tr style="">
                        
                        <td>
                            <asp:Label CssClass="form-control" ValidationGroup="ge" ID="DonationIDLabel1" runat="server" Text='<%# Eval("DonationID") %>' />
                        </td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="ge" ID="DonorIDTextBox" runat="server" Text='<%# Bind("DonorID") %>' />
                        </td>
                        <td>
                            <asp:HiddenField ID="PatientIDTextBox" runat="server" Value='<%# Bind("PatientID") %>' />
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
                        
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ValidationGroup="gi" ID="DonorIDTextBox" runat="server" Text='<%# Bind("DonorID") %>' />
                        </td>
                        <td>
                            [Selected]
                            <asp:HiddenField ID="PatientIDTextBox" runat="server" Value='<%# Bind("PatientID") %>' />
                        </td>
                        <td style="width: 150px; text-align: center">
                            <asp:Button CssClass="btn btn-primary btn-sm" ValidationGroup="gi" ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ValidationGroup="gi" ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="">
                        
                        <td>
                            <asp:Label ID="DonationIDLabel" runat="server" Text='<%# Eval("DonationID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DonorIDLabel" runat="server" Text='<%# Eval("DonorID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PatientIDLabel" runat="server" Text='<%# Eval("PatientID") %>' />
                        </td>
                        <td style="text-align: center">
                            <asp:Button CssClass="btn btn-danger btn-sm" ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button CssClass="btn btn-secondary btn-sm" ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" class="table table-responsive">
                        <tr runat="server">
                            <td runat="server">
                                <table class="table table-bordered table-striped" id="itemPlaceholderContainer" runat="server" border="0" style="text-align:center">
                                    <tr runat="server" style="">
                                        
                                        <th runat="server">DonationID</th>
                                        <th runat="server">DonorID</th>
                                        <th runat="server">PatientID</th>
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
            <asp:SqlDataSource ID="dsPatientsDonors" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [PatientDonors] WHERE [DonationID] = @DonationID" InsertCommand="INSERT INTO [PatientDonors] ([DonorID], [PatientID]) VALUES (@DonorID, @PatientID)" SelectCommand="SELECT * FROM [PatientDonors]" UpdateCommand="UPDATE [PatientDonors] SET [DonorID] = @DonorID, [PatientID] = @PatientID WHERE [DonationID] = @DonationID">
                <DeleteParameters>
                    <asp:Parameter Name="DonationID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DonorID" Type="Int32" />
                    <asp:Parameter Name="PatientID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DonorID" Type="Int32" />
                    <asp:Parameter Name="PatientID" Type="Int32" />
                    <asp:Parameter Name="DonationID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>    
</asp:Content>
