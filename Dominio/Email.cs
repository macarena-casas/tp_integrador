using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;

namespace Dominio
{
    public class Email
    {

        [DisplayName("Destinatario")]
        public string destino { get; set; }
        [DisplayName("Remitente")]
        public string remitente { get; set; }
        [DisplayName("Asunto")]
        public string asunto { get; set; }
        [DisplayName("Mensaje")]
        public string mensaje { get; set; }
        [DisplayName("Estado")]
        public bool Estado { get; set; }
        public DateTime Fecha { get; set; }



        public Email()
        {

        }

        public Email(string des, string rem, string asu, string mens, bool es)
        {
            destino = des;
            remitente = rem;
            asunto = asu;
            mensaje = mens;
            Estado = es;
        }

    }
}
