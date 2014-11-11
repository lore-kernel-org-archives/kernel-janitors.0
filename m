From: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Date: Tue, 11 Nov 2014 17:01:08 +0000
Subject: Re: [patch] ghes_edac: use snprintf() to silence a static checker warning
Message-Id: <20141111150108.7172ef35@recife.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140801082514.GD28869@mwanda>
In-Reply-To: <20140801082514.GD28869@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Em Tue, 11 Nov 2014 17:55:09 +0100
Borislav Petkov <bp@alien8.de> escreveu:

> Did this one get missed? Mauro?

Yeah, I missed that, sorry.

I can apply it on my tree, but if you want to apply on yours, feel free
to do it, and add my ack:

Acked-by: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

> On Fri, Aug 01, 2014 at 11:25:14AM +0300, Dan Carpenter wrote:
> > My static checker complains because the "e->location" has up to 256
> > characters but we are copying it into the "pvt->detail_location" which
> > only has space for 240 characters.  That's not counting the surrounding
> > text and the "e->other_detail" string which can be over 80 characters
> > long.
> > 
> > I am not familiar with this code but presumably it normally works.
> > Let's add a limit though for safety.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/edac/ghes_edac.c b/drivers/edac/ghes_edac.c
> > index 8399b4e..b246819 100644
> > --- a/drivers/edac/ghes_edac.c
> > +++ b/drivers/edac/ghes_edac.c
> > @@ -413,8 +413,8 @@ void ghes_edac_report_mem_error(struct ghes *ghes, int sev,
> >  
> >  	/* Generate the trace event */
> >  	grain_bits = fls_long(e->grain);
> > -	sprintf(pvt->detail_location, "APEI location: %s %s",
> > -		e->location, e->other_detail);
> > +	snprintf(pvt->detail_location, sizeof(pvt->detail_location),
> > +		 "APEI location: %s %s", e->location, e->other_detail);
> >  	trace_mc_event(type, e->msg, e->label, e->error_count,
> >  		       mci->mc_idx, e->top_layer, e->mid_layer, e->low_layer,
> >  		       PAGES_TO_MiB(e->page_frame_number) | e->offset_in_page,
> > 
> 
