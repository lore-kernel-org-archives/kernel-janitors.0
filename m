From: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 26 Feb 2007 11:52:58 +0000
Subject: Re: [KJ] [PATCH] Fix bufferoverflow and races in capi debug
Message-Id: <20070226035258.d34cb3d2.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070225184951.GA8615@pingi.kke.suse.de>
In-Reply-To: <20070225184951.GA8615@pingi.kke.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


(cc's restored.  Please don't do that).

> On Mon, 26 Feb 2007 09:15:18 +0100 walter harms <wharms@bfs.de> wrote:
> 
> this reminds me of the glibc asprint() funktion. IMHO it would be useful to have this
> as kernelfunction, because printing in a buffer for e.g. for proc and friends is commen.
> 

We already have kasprintf() and I suspect this patch should be using it.

> 
> re,
>  wh
> 
> Karsten Keil wrote:
> > The CAPI trace debug functions were using a fixed size buffer, which can be
> > overflowed if wrong formatted CAPI messages were sent to the kernel capi
> > layer. The code was also not protected against multiple callers.
> > This fix bug 8028.
> > Additional the patch make the CAPI trace functions optional.
> > 
> > Signed-off-by: Karsten Keil <kkeil@suse.de>
> > 
> >
> >  #include <stdarg.h>
> >  
> >  /*-------------------------------------------------------*/
> > -static void bufprint(char *fmt,...)
> > +static _cdebbuf *bufprint(_cdebbuf *cdb, char *fmt,...)
> >  {
> >  	va_list f;
> > +	size_t n,r;
> > +
> > +	if (!cdb)
> > +		return NULL;
> >  	va_start(f, fmt);
> > -	vsprintf(p, fmt, f);
> > +	r = cdb->size - cdb->pos;
> > +	n = vsnprintf(cdb->p, r, fmt, f);
> >  	va_end(f);
> > -	p += strlen(p);
> > +	if (n >= r) {
> > +		/* truncated, need bigger buffer */
> > +		size_t ns = 2 * cdb->size;
> > +		u_char *nb;
> > +
> > +		while ((ns - cdb->pos) <= n)
> > +			ns *= 2;
> > +		nb = kmalloc(ns, GFP_ATOMIC);
> > +		if (!nb) {
> > +			cdebbuf_free(cdb);
> > +			return NULL;
> > +		}
> > +		memcpy(nb, cdb->buf, cdb->pos);
> > +		kfree(cdb->buf);
> > +		nb[cdb->pos] = 0;
> > +		cdb->buf = nb;
> > +		cdb->p = cdb->buf + cdb->pos;
> > +		cdb->size = ns;
> > +		va_start(f, fmt);
> > +		r = cdb->size - cdb->pos;
> > +		n = vsnprintf(cdb->p, r, fmt, f);
> > +		va_end(f);
> > +	}
> > +	cdb->p += n;
> > +	cdb->pos += n;
> > +	return cdb;
> >  }
> >  
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
