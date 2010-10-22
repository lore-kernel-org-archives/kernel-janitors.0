From: Dan Carpenter <error27@gmail.com>
Date: Fri, 22 Oct 2010 08:13:04 +0000
Subject: Re: [patch 3/3] V4L/DVB: s5p-fimc: dubious one-bit signed bitfields
Message-Id: <20101022081304.GQ5985@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101021192424.GL5985@bicker> <000a01cb71b8$465248f0$d2f6dad0$%nawrocki@samsung.com>
In-Reply-To: <000a01cb71b8$465248f0$d2f6dad0$%nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: 'Mauro Carvalho Chehab' <mchehab@infradead.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Oct 22, 2010 at 09:10:57AM +0200, Sylwester Nawrocki wrote:
> > -----Original Message-----
> > From: Dan Carpenter [mailto:error27@gmail.com]
> > Sent: Thursday, October 21, 2010 9:24 PM
> > To: Mauro Carvalho Chehab
> > Cc: Kyungmin Park; Sylwester Nawrocki; Pawel Osciak; Marek Szyprowski;
> > linux-media@vger.kernel.org; kernel-janitors@vger.kernel.org
> > Subject: [patch 3/3] V4L/DVB: s5p-fimc: dubious one-bit signed
> > bitfields
> > 
> > These are signed so instead of being 1 and 0 as intended they are -1
> > and
> > 0.  It doesn't cause a bug in the current code but Sparse warns about
> > it:
> > 
> > drivers/media/video/s5p-fimc/fimc-core.h:226:28:
> > 	error: dubious one-bit signed bitfield
> > 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > 
> > diff --git a/drivers/media/video/s5p-fimc/fimc-core.h
> > b/drivers/media/video/s5p-fimc/fimc-core.h
> > index e3a7c6a..7665a3f 100644
> > --- a/drivers/media/video/s5p-fimc/fimc-core.h
> > +++ b/drivers/media/video/s5p-fimc/fimc-core.h
> > @@ -222,10 +223,10 @@ struct fimc_effect {
> >   * @real_height:	source pixel (height - offset)
> >   */
> >  struct fimc_scaler {
> > -	int	scaleup_h:1;
> > -	int	scaleup_v:1;
> > -	int	copy_mode:1;
> > -	int	enabled:1;
> > +	unsigned int	scaleup_h:1;
> > +	unsigned int	caleup_v:1;
> > +	unsigned int	copy_mode:1;
> > +	unsigned int	enabled:1;
> >  	u32	hfactor;
> >  	u32	vfactor;
> >  	u32	pre_hratio;
> 
> In general I agree, however this patch would change scaleup_v:1 
> to caleup_v, so it cannot be applied in current form.

Crap!  I suck.  Thanks for catching that.

regards,
dan carpenter


