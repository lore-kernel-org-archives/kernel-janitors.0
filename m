From: Shawn Guo <shawn.guo@linaro.org>
Date: Thu, 04 Apr 2013 11:56:50 +0000
Subject: Re: [patch] reset: NULL deref on allocation failure
Message-Id: <20130404115648.GD21790@S2101-09.ap.freescale.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130403050253.GA31179@longonot.mountain>
In-Reply-To: <20130403050253.GA31179@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Philipp,

On Thu, Apr 04, 2013 at 09:49:36AM +0200, Philipp Zabel wrote:
> Hi Dan,
> 
> Am Mittwoch, den 03.04.2013, 08:02 +0300 schrieb Dan Carpenter:
> > "rstc" is NULL here and we should use "rcdev" instead of "rstc->rcdev".
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/reset/core.c b/drivers/reset/core.c
> > index a258277..d1b6089 100644
> > --- a/drivers/reset/core.c
> > +++ b/drivers/reset/core.c
> > @@ -181,7 +181,7 @@ struct reset_control *reset_control_get(struct device *dev, const char *id)
> >  
> >  	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
> >  	if (!rstc) {
> > -		module_put(rstc->rcdev->owner);
> > +		module_put(rcdev->owner);
> >  		return ERR_PTR(-ENOMEM);
> >  	}
> 
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
I think you should take care of the patch to have it merged through the
same path that the 'reset API' series goes to mainline.

Shawn

