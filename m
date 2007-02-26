From: Karsten Keil <kkeil@suse.de>
Date: Mon, 26 Feb 2007 12:58:11 +0000
Subject: Re: [KJ] [PATCH] Fix bufferoverflow and races in capi debug
Message-Id: <20070226125811.GA22586@pingi.kke.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070225184951.GA8615@pingi.kke.suse.de>
In-Reply-To: <20070225184951.GA8615@pingi.kke.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Feb 26, 2007 at 03:52:58AM -0800, Andrew Morton wrote:
>=20
> (cc's restored.  Please don't do that).
>=20
> > On Mon, 26 Feb 2007 09:15:18 +0100 walter harms <wharms@bfs.de> wrote:
> >=20
> > this reminds me of the glibc asprint() funktion. IMHO it would be usefu=
l to have this
> > as kernelfunction, because printing in a buffer for e.g. for proc and f=
riends is commen.
> >=20
>=20
> We already have kasprintf() and I suspect this patch should be using it.
>=20

I think it is not possible to use that for this special case, because it
has to print multiple times to the buffer but kasprintf() does allocate
exactely a buffer for one print, so this do not help.

> >=20
> > re,
> >  wh
> >=20
> > Karsten Keil wrote:
> > > The CAPI trace debug functions were using a fixed size buffer, which =
can be
> > > overflowed if wrong formatted CAPI messages were sent to the kernel c=
api
> > > layer. The code was also not protected against multiple callers.
> > > This fix bug 8028.
> > > Additional the patch make the CAPI trace functions optional.
> > >=20
> > > Signed-off-by: Karsten Keil <kkeil@suse.de>
> > >=20
> > >
> > >  #include <stdarg.h>
> > > =20
> > >  /*-------------------------------------------------------*/
> > > -static void bufprint(char *fmt,...)
> > > +static _cdebbuf *bufprint(_cdebbuf *cdb, char *fmt,...)
> > >  {
> > >  	va_list f;
> > > +	size_t n,r;
> > > +
> > > +	if (!cdb)
> > > +		return NULL;
> > >  	va_start(f, fmt);
> > > -	vsprintf(p, fmt, f);
> > > +	r =3D cdb->size - cdb->pos;
> > > +	n =3D vsnprintf(cdb->p, r, fmt, f);
> > >  	va_end(f);
> > > -	p +=3D strlen(p);
> > > +	if (n >=3D r) {
> > > +		/* truncated, need bigger buffer */
> > > +		size_t ns =3D 2 * cdb->size;
> > > +		u_char *nb;
> > > +
> > > +		while ((ns - cdb->pos) <=3D n)
> > > +			ns *=3D 2;
> > > +		nb =3D kmalloc(ns, GFP_ATOMIC);
> > > +		if (!nb) {
> > > +			cdebbuf_free(cdb);
> > > +			return NULL;
> > > +		}
> > > +		memcpy(nb, cdb->buf, cdb->pos);
> > > +		kfree(cdb->buf);
> > > +		nb[cdb->pos] =3D 0;
> > > +		cdb->buf =3D nb;
> > > +		cdb->p =3D cdb->buf + cdb->pos;
> > > +		cdb->size =3D ns;
> > > +		va_start(f, fmt);
> > > +		r =3D cdb->size - cdb->pos;
> > > +		n =3D vsnprintf(cdb->p, r, fmt, f);
> > > +		va_end(f);
> > > +	}
> > > +	cdb->p +=3D n;
> > > +	cdb->pos +=3D n;
> > > +	return cdb;
> > >  }
> > > =20

--=20
Karsten Keil
SuSE Labs
ISDN development
SUSE LINUX Products GmbH, GF: Markus Rex, HRB 16746 (AG N=FCrnberg)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
