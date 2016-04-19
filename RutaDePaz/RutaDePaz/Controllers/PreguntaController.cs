using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using RutaDL;

namespace RutaDePaz.Controllers
{
    public class PreguntaController : ApiController
    {
        private RutaDePazEntities db = new RutaDePazEntities();

        // GET: api/Pregunta
        public object GetTBL_RPREGUNTA()
        {
            var a = (from pre in db.TBL_RPREGUNTA
                     select new
                     {
                         pre.Enunciado,
                         pre.TipoPregunta,
                         Respuestas = (from res in db.TBL_RRESPUESTA
                                       where res.IdPregunta == pre.IdPregunta
                                       select new
                                       {
                                           res.Respuesta,
                                           res.Correcta,
                                           Retroalimentacion = (from ret in db.TBL_RRETROALIMENTACION
                                                                where ret.IdRespuesta == res.IdRespuesta
                                                                select ret.RetroAlimentacion)
                                       }).ToList(),
                         Felicitaciones = from mod in db.TBL_RMODULO
                                          where mod.IdModulo == pre.IdModulo
                                          select new { mod.FelicitacionModulo, mod.FelicitacionCompartir }

                     }).ToList();
            return a;
        }

        // GET: api/Pregunta/5
        [ResponseType(typeof(TBL_RPREGUNTA))]
        public IHttpActionResult GetTBL_RPREGUNTA(int id)
        {
            TBL_RPREGUNTA tBL_RPREGUNTA = db.TBL_RPREGUNTA.Find(id);
            if (tBL_RPREGUNTA == null)
            {
                return NotFound();
            }

            return Ok(tBL_RPREGUNTA);
        }

        // PUT: api/Pregunta/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutTBL_RPREGUNTA(int id, TBL_RPREGUNTA tBL_RPREGUNTA)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tBL_RPREGUNTA.IdPregunta)
            {
                return BadRequest();
            }

            db.Entry(tBL_RPREGUNTA).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TBL_RPREGUNTAExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Pregunta
        [ResponseType(typeof(TBL_RPREGUNTA))]
        public IHttpActionResult PostTBL_RPREGUNTA(TBL_RPREGUNTA tBL_RPREGUNTA)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.TBL_RPREGUNTA.Add(tBL_RPREGUNTA);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tBL_RPREGUNTA.IdPregunta }, tBL_RPREGUNTA);
        }

        // DELETE: api/Pregunta/5
        [ResponseType(typeof(TBL_RPREGUNTA))]
        public IHttpActionResult DeleteTBL_RPREGUNTA(int id)
        {
            TBL_RPREGUNTA tBL_RPREGUNTA = db.TBL_RPREGUNTA.Find(id);
            if (tBL_RPREGUNTA == null)
            {
                return NotFound();
            }

            db.TBL_RPREGUNTA.Remove(tBL_RPREGUNTA);
            db.SaveChanges();

            return Ok(tBL_RPREGUNTA);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool TBL_RPREGUNTAExists(int id)
        {
            return db.TBL_RPREGUNTA.Count(e => e.IdPregunta == id) > 0;
        }
    }
}