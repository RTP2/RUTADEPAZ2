﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class RutaDePazEntities : DbContext
    {
        public RutaDePazEntities()
            : base("name=RutaDePazEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<TBL_RMODULO> TBL_RMODULO { get; set; }
        public virtual DbSet<TBL_RPREGUNTA> TBL_RPREGUNTA { get; set; }
        public virtual DbSet<TBL_RRESPUESTA> TBL_RRESPUESTA { get; set; }
        public virtual DbSet<TBL_RRETROALIMENTACION> TBL_RRETROALIMENTACION { get; set; }
    }
}
