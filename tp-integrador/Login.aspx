<%@ Page Title="" Language="C#" MasterPageFile="~/MyMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="tp_integrador.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="reg">
    <div class="registro">
        <h1>Inicio de sesion</h1>
          <form method="post">
            <div class="username">
                <input style="border:none;border-bottom:hidden;" type="text" name="name" value="" />
                <label>Usuario</label>
            </div>
            <div class="contraseña">
                <input style="border:none;"  type="text" name="contra" value="" />
                <label>Contraseña</label>
            </div>
             <div class="requisitos">
                 <p style="font-size:13px;">*mas de 6 caracteres</p>
                 <p style="margin-top:-20px;font-size:13px;">*por lo menos 1 leta</p>
                 <p style="margin-top:-20px;font-size:13px;">*por lo menos 1 numero</p>
             </div>
            
            <input type="submit" name="Iniciar" value="Iniciar" />
             

            <div class="registrarse">
                ¿No tienes una cuenta? <a href="#">Registrarse</a>
            </div>
        </form>
    </div>
    <style>
        .registro{
           position:absolute;
           top:700px;
           left:35%;
           border-radius:10px;
           border-color:black;
           border-block-style:groove;
           background-color:white;
           
          
        }
        .registro h1{
            text-align:center;
            padding:0 0 20px 0;
            border-bottom: 1px double grey;
        }
        .registro form{
            padding:0 45px;
            box-sizing: border-box;
            left:20px;
           
            

        }
        form .username{
            padding:0px 0px;
            position:relative;
            border-bottom:2px solid silver;
          
            margin-inline:0px 0 ;
            
            
          
        }
        form .contraseña{
             position:relative;
             border-bottom:2px solid silver;
             margin-inline:0px 0 ;
        }
        .username input{
            width:100%;
            padding:0 5px;
            height:40px;
            font-size:16px;
            border:hidden;
            background:none;
            outline:none;
           

        }
         
         .contraseña input{
         width:100%;
         padding:0 5px;
         height:40px;
         font-size:16px;
         border:hidden;
         background:none;
         outline:none;
 }
         
        .username label{
            position:absolute;
            top:-30%;
            left:5px;
            color:lightslategray;
            transform:translateY(50%);
            font-size:16px;
            pointer-events:none;
        }
        .contraseña label{
    position:absolute;
    top:-30%;
    left:5px;
    color:lightslategray;
    transform:translateY(50%);
    font-size:16px;
    pointer-events:none;
}
       
       
        .username span::before{
            content: '';
            position:absolute;
            top:40px;
            left:0px;
            width:100%;
            height:2px;
            background:violet;

        }
        .contraseña span::before{
    content: '';
    position:absolute;
    top:40px;
    left:0px;
    width:100%;
    height:2px;
    background:violet;

}
        .username input:focus~label,
        .username input:focus~label{
            
            color:transparent;
            transition: top 0s ease, color 0s ease;
        }
        .username input:focus~span::before,
        .username input:focus~span::before{
            width:100%;
        }
        .contraseña input:focus~label,
        .contraseña input:focus~label{
             
              color:transparent;
               transition: top 0s ease, color 0s ease;
         }
         .contraseña input:focus~span::before,
         .contraseña input:focus~span::before{
           width:100%;
           }
         input[type="submit"]{
             width:100%;
             height:50px;
             margin-top:30px;
             border:2px solid;
             background:violet;
             border-radius:25px;
             font-size:18px;
             color:white;
             cursor:pointer;
             outline:none;

         }
         input[type="submit"]:hover{
             border-color:purple;
             transition:.5s;

         }
         .registrarse{
             margin: 30px 0 ;
             text-align:center;
             font-size:16px;
             color:black;

         }
         .registrarse a{
             color:blue;
             text-decoration:none;

         }
         .registrarse a:hover{
             text-decoration:underline;
         }



    </style>
        </div>
  
</asp:Content>
