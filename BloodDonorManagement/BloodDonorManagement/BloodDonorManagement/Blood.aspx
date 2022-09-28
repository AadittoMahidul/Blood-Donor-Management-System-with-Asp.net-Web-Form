<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Blood.aspx.cs" Inherits="BloodDonorManagement.BloodDonorManagement.Blood" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headContent" runat="server">
    <link href="/Content/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
        .err {
            font-size: .75rem;
        }

        th a {
            text-decoration: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" runat="server">
    <div class="row px-2">
        <div class="col-12 border-bottom mb-3">
            <h2 class="display-6" style="background-color:teal; color:white; text-align:center; border:outset;">Blood (SQL Data)</h2>
        </div>
        <div class="col-6 border-end">
            <h3 class="display-6" style="background-color:darkgray; color:white; text-align:center; border:outset;">Edit/Delete</h3>
            <asp:GridView Width="100%" CssClass="table table-bordered table-striped" ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="BloodID" DataSourceID="dsBlood" OnRowDataBound="GridView1_RowDataBound">
                <HeaderStyle CssClass="table-light" />
                <Columns>
                    <asp:TemplateField HeaderText="Blood Group" SortExpression="BloodGroup">
                        <EditItemTemplate>
                            <asp:TextBox ValidationGroup="gv-ed" CssClass="form-control form-control-sm" ID="TextBox1" runat="server" Text='<%# Bind("BloodGroup") %>'></asp:TextBox>
                             <asp:RequiredFieldValidator ValidationGroup="gv-ed" ControlToValidate="TextBox1" Text="Blood group is required" CssClass="text-danger err" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Blood Group is Required"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("BloodGroup") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ValidationGroup="gv-ed" ID="LinkButton1" runat="server" CssClass="btn btn-success btn-sm rounded-circle" CausesValidation="True" CommandName="Update" Text="Update"><i class="bi bi-save"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2"  runat="server" CssClass="btn btn-secondary btn-sm rounded-circle" CausesValidation="False" CommandName="Cancel" Text="Cancel"><i class="bi bi-x"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary btn-sm rounded-circle" runat="server" CausesValidation="False" CommandName="Edit"><i class="bi bi-pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" CssClass="btn btn-danger btn-sm rounded-circle" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"><i class="bi bi-trash"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsBlood" runat="server" ConnectionString="<%$ ConnectionStrings:db %>" DeleteCommand="DELETE FROM [Blood] WHERE [BloodID] = @BloodID" InsertCommand="INSERT INTO [Blood] ([BloodGroup]) VALUES (@BloodGroup)" SelectCommand="SELECT * FROM [Blood]" UpdateCommand="UPDATE [Blood] SET [BloodGroup] = @BloodGroup WHERE [BloodID] = @BloodID">
                <DeleteParameters>
                    <asp:Parameter Name="BloodID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="BloodGroup" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="BloodGroup" Type="String" />
                    <asp:Parameter Name="BloodID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

        <div class="col-6">
            <h4 class="display-6" style="background-color:darkgray; color:white; text-align:center; border:outset;" >Add New</h4>
            <asp:FormView Width="100%" ID="FormView1" DefaultMode="Insert" runat="server" DataKeyNames="BloodID" DataSourceID="dsBlood">
                
                <InsertItemTemplate>
                    <div class="form-group row mb-1">
                        <label class="col-form-label col-form-label-sm col-4">Blood Group</label>
                        <div class="col-8">
                            <asp:TextBox ValidationGroup="fv-in" CssClass="form-control form-control-sm" ID="BloodGroupTextBox" runat="server" Text='<%# Bind("BloodGroup") %>' />
                            <asp:RequiredFieldValidator ValidationGroup="fv-in" CssClass="text-danger err" ID="RequiredFieldValidator2" ControlToValidate="BloodGroupTextBox"  runat="server" ErrorMessage="Blood Group is required"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator1" ControlToValidate="BloodGroupTextBox" runat="server" ErrorMessage="Blood Group can't to be four or more Character"></asp:CustomValidator>
                        </div>
                    </div>
                    <br />
                    <div class="col-12">
                       <div class="d-flex justify-content-end">
                            <asp:LinkButton ValidationGroup="fv-in" CssClass="btn btn-success btn-sm" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text=""><i class="bi bi-plus-circle"></i> Insert</asp:LinkButton>
                        &nbsp;<asp:LinkButton CssClass="btn btn-secondary btn-sm" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text=""><i class="bi bi-x"></i> Cancel</asp:LinkButton>
                       </div>
                    </div>
                </InsertItemTemplate>
                
            </asp:FormView>
        </div>
    </div>
</asp:Content>
