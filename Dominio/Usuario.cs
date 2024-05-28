using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;



namespace Dominio
{
   public class Usuario
    {
        [DisplayName("Nombre")]
        public string nombre_u { get; set; }
        [DisplayName("Contraseña")]
        public string contra_u { get;set; }
        [DisplayName("Id")]
        public string id_u { get; set; }
        [DisplayName("IdTipo")]
        public string idtipo_u { get; set; }
    }
}
