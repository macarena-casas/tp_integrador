using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;

namespace Dominio
{
    public class Inmueble
    {
        [DisplayName("Nombre")]
        public string nombre_I { get; set; }

        public int Id_I { get; set; }
        [DisplayName("Precio")]
        public decimal precio_I { get; set; }
        [DisplayName("Descripción")]
        public string descripcion_I { get; set; }
        [DisplayName("Categoria")]
        public Categoria categoria_I { get; set; }
        [DisplayName("Imagen1")]
        public Imagen imagen_I { get; set; }
        [DisplayName("Imagen")]
        public string urlimagen { get; set; }
        public int ID() { return Id_I; }
        public List<Imagen> Imagenes { get; set; }

        public Inmueble()
        {
            precio_I = 0;
            nombre_I = "nada";
            descripcion_I = "nada";
            categoria_I = new Categoria();
            Imagenes = new List<Imagen>();

        }
        public Inmueble(string nom, string desc, Categoria cat, decimal pre)
        {

            categoria_I = new Categoria();
            nombre_I = nom;
            descripcion_I = desc;
            categoria_I = cat;
            precio_I = pre;
            Imagenes = new List<Imagen>();
        }

    }
}
