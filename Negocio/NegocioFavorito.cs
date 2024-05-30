using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
namespace Negocio
{
    public class NegocioFavorito
    {
        public Inmueble encontrarInmueble(int id, List<Inmueble> aux)
        {
            Inmueble inmueble = new Inmueble();
            foreach (Inmueble actual in aux)
            {
                if (actual.Id_I == id)
                {
                    inmueble = actual;
                    break;
                }
            }
            return inmueble;

        }


        public Favorito AguegarAFavorito(Inmueble inmueble, Favorito fav, int cantidad)
        {
            bool existe = false;

            for (int x = 0; x < fav.listainmueble.Count(); x++)
            {
                if (fav.listainmueble[x].inmueble.Id_I == inmueble.Id_I)
                {
                    fav.listainmueble[x].cantidad = cantidad;
                    existe = true;

                }
            }
            if (existe == false)
            {
                ElementoAuxiliar aux = new ElementoAuxiliar();
                aux.inmueble = inmueble;
                aux.cantidad += cantidad;
                fav.listainmueble.Add(aux);

            }
            fav.TotalProductos = fav.listainmueble.Sum(aux => aux.cantidad);
            return fav;
        }
    }
}
