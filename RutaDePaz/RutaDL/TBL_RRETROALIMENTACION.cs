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
    
    public partial class TBL_RRETROALIMENTACION
    {
        public int IdRetroalimentacion { get; set; }
        public string RetroAlimentacion { get; set; }
        public Nullable<int> IdRespuesta { get; set; }
    
        public virtual TBL_RRESPUESTA TBL_RRESPUESTA { get; set; }
    }
}
