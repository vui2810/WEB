<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLPhongBan.aspx.cs" Inherits="WEB.QLPhongBan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noiDung" runat="server">
     <h2 class="text-center">DANH SÁCH PHONG BAN</h2>
    <hr />
    <asp:SqlDataSource ID="dsPhongBan" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" SelectCommand="SELECT * FROM [PhongBan]"></asp:SqlDataSource>
    <asp:DropDownList ID="ddlPhongBan" runat="server" DataSourceID="dsPhongBan" DataTextField="TenPhong" AutoPostBack="True" DataValueField="MaPhong"></asp:DropDownList>
    <asp:SqlDataSource ID="dsNhanVienPhongBan" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" SelectCommand="SELECT * FROM [NhanVien] WHERE ([MaPhong] = @MaPhong)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlPhongBan" Name="MaPhong" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
     </asp:SqlDataSource>
    <br />
    <asp:GridView ID="gvNhanVien" runat="server" AutoGenerateColumns="False"  CssClass ="table table-bordered table-hover" DataKeyNames="MaNV" DataSourceID="dsNhanVienPhongBan" ForeColor="#333333" GridLines="None">
       
        <Columns>
            <asp:BoundField DataField="MaNV" HeaderText="MaNV" InsertVisible="False" ReadOnly="True" SortExpression="MaNV" />
            <asp:BoundField DataField="HoNV" HeaderText="HoNV" SortExpression="HoNV" />
            <asp:BoundField DataField="TenNV" HeaderText="TenNV" SortExpression="TenNV" />
            <asp:CheckBoxField DataField="Phai" HeaderText="Phai" SortExpression="Phai" />
            <asp:BoundField DataField="NgaySinh" HeaderText="NgaySinh" SortExpression="NgaySinh" />
            <asp:BoundField DataField="NoiSinh" HeaderText="NoiSinh" SortExpression="NoiSinh" />
            <asp:BoundField DataField="MaPhong" HeaderText="MaPhong" SortExpression="MaPhong" />
           
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" />
            
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
     </asp:GridView>
</asp:Content>
