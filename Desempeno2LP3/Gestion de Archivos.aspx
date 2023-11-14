<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Gestion de Archivos.aspx.cs" Inherits="Desempeno2LP3.Gestion_de_Archivos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container mt-5">
    <div class="row justify-content-center">
        <div >
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0">Gestión de Archivos</h4>
                </div>
                <div class="card-body">

                    
                    <asp:Label ID="LabelMensaje" runat="server" ForeColor="#17ABD1"></asp:Label>
                    <br />
                    <br />
                    
                    <div class="form-group">
                        <label for="FileUpload1">Seleccione archivos para subir:</label>
                        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="True" CssClass="form-control-file" />
                    </div>
                    <br />
                    
                    <asp:Label ID="LabelResultado" runat="server" ForeColor="#17ABD1"></asp:Label>
                    <br />
                   
                   
                    <div class="form-group">
                        <asp:Button ID="ButtonSubirArchivos" runat="server" OnClick="ButtonSubirArchivos_Click" Text="Subir archivos" CssClass="btn btn-primary" />
                        <br />
                    </div>
                    <br />
                   
                    <asp:GridView ID="GridViewArchivos" runat="server" OnRowCommand="GridViewArchivos_RowCommand" CssClass="table">
                        <Columns>
                            <asp:ButtonField ButtonType="Button" CommandName="Descargar" HeaderText="Acciones" ShowHeader="True" Text="Descargar" />
                        </Columns>
                    </asp:GridView>

                </div>
            </div>
        </div>
    </div>
</div>
    <br />
</asp:Content>
