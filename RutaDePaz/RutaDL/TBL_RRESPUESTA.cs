//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RutaDL
{
    using System;
    using System.Collections.Generic;
    
    public partial class TBL_RRESPUESTA
    {
        public TBL_RRESPUESTA()
        {
            this.TBL_RRETROALIMENTACION = new HashSet<TBL_RRETROALIMENTACION>();
        }
    
        public int IdRespuesta { get; set; }
        public int IdPregunta { get; set; }
        public bool Correcta { get; set; }
        public string Respuesta { get; set; }
    
        public virtual TBL_RPREGUNTA TBL_RPREGUNTA { get; set; }
        public virtual ICollection<TBL_RRETROALIMENTACION> TBL_RRETROALIMENTACION { get; set; }
    }
}
