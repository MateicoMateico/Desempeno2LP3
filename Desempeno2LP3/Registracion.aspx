<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Registracion.aspx.cs" Inherits="Desempeno2LP3.Registracion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0">Formulario de Registro</h4>
                </div>
                <div class="card-body">

                    
                    <div class="form-group">
                        <label for="TextBoxMail">Mail:</label>
                        <asp:TextBox ID="TextBoxMail" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorMail" runat="server" ControlToValidate="TextBoxMail" ErrorMessage="Ingrese su Mail" ForeColor="#FF9900" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorMail" runat="server" ControlToValidate="TextBoxMail" ErrorMessage="El valor ingresado no es un Email" ForeColor="Red" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" Display="Dynamic" CssClass="text-danger"></asp:RegularExpressionValidator>
                    </div>

                    <div class="form-group">
                        <label for="TextBoxUsername">Username:</label>
                        <asp:TextBox ID="TextBoxUsername" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Ingrese su Username" ForeColor="#FF9900" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    
                    <div class="form-group">
                        <label for="TextBoxEdad">Edad:</label>
                        <asp:TextBox ID="TextBoxEdad" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEdad" runat="server" ControlToValidate="TextBoxEdad" ErrorMessage="Ingrese su Edad" ForeColor="#FF9900" Display="Dynamic" ></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidatorEdad" runat="server" ControlToValidate="TextBoxEdad" ErrorMessage="La edad debe ser mayor a 15 años" ForeColor="Red" MaximumValue="150" MinimumValue="15" Type="Integer" Display="Dynamic" ></asp:RangeValidator>
                    </div>

                    
                    <div class="form-group">
                        <label for="TextBoxPassword">Clave:</label>
                        <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorClave" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Ingrese su clave" ForeColor="#FF9900" Display="Dynamic" ></asp:RequiredFieldValidator>
                    </div>

                   
                    <div class="form-group">
                        <label for="TextBoxCPassword">Confirmar clave:</label>
                        <asp:TextBox ID="TextBoxCPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmarClave" runat="server" ControlToValidate="TextBoxCPassword" ErrorMessage="Confirme su clave" ForeColor="#FF9900" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidatorClave" runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxCPassword" ErrorMessage="Las claves no coinciden" ForeColor="Red" Display="Dynamic" CssClass="text-danger"></asp:CompareValidator>
                    </div>

                    
                    <asp:Label ID="LabelMsj" runat="server" ForeColor="#28A745"></asp:Label>

                    
                    <br />

                    
                    <div class="form-group text-center">
                        <asp:Button ID="ButtonRegistro" runat="server" Text="Registrarme" OnClick="ButtonRegistro_Click" CssClass="btn btn-primary" />
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>
