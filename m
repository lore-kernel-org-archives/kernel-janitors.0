From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Sep 2018 12:28:08 +0000
Subject: Re: [PATCH] thermal: armada: NULL vs IS_ERR() bug in probe
Message-Id: <20180926122808.oqxk3rucoqbealad@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180926104301.GD14535@mwanda>
In-Reply-To: <20180926104301.GD14535@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 26, 2018 at 02:09:02PM +0200, Miquel Raynal wrote:
> Hi Dan,
> 
> Dan Carpenter <dan.carpenter@oracle.com> wrote on Wed, 26 Sep 2018
> 13:43:36 +0300:
> 
> > The platform_get_resource() function doesn't return error pointers, it
> > returns NULL on error.
> > 
> > Fixes: 3d4e51844a4e ("thermal: armada: convert driver to syscon register accesses")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_thermal.c
> > index 2c2f6d93034e..ebfe7c9a5a7a 100644
> > --- a/drivers/thermal/armada_thermal.c
> > +++ b/drivers/thermal/armada_thermal.c
> > @@ -526,8 +526,8 @@ static int armada_thermal_probe_legacy(struct platform_device *pdev,
> >  
> >  	/* First memory region points towards the status register */
> >  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	if (IS_ERR(res))
> > -		return PTR_ERR(res);
> > +	if (!res)
> > +		return -ENODEV;
> >  
> >  	/*
> >  	 * Edit the resource start address and length to map over all the
> 
> 
> I already sent my
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> 
> for this patch, and it looks like the title changed so it's a v2, right?

Ooops.  I'm sorry, I switched dev boxes and so I accidentally re-wrote
this patch.  My bad.  Sorry for the noise.

regards,
dan carpenter
