using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Favorito
    {
        public int TotalProductos { get; set; }

        public List<ElementoAuxiliar> listainmueble { get; set; }

        public Favorito()
        {
            listainmueble = new List<ElementoAuxiliar>();

            TotalProductos = 0;
            ;
        }
        public void agregararticulocarrito(Inmueble inm)
        {
            bool existe = false;
            for (int x = 0; x < listainmueble.Count(); x++)
            {
                if (listainmueble[x].inmueble.Id_I == inm.Id_I)
                {
                    listainmueble[x].cantidad++;
                    existe = true;

                }
            }
            if (existe == false)
            {
                ElementoAuxiliar aux = new ElementoAuxiliar();
                aux.inmueble = inm;
                aux.cantidad++;

                listainmueble.Add(aux);

            }
            TotalProductos = listainmueble.Sum(aux => aux.cantidad);
        }

    }
}
