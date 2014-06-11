From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jun 2014 10:07:52 +0000
Subject: Re: [patch] mfd: vexpress: use after free in vexpress_syscfg_regmap_init()
Message-Id: <20140611100752.GR5500@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140611060725.GC7569@mwanda>
 <1402478542.3523.9.camel@hornet>
In-Reply-To: <1402478542.3523.9.camel@hornet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pawel Moll <pawel.moll@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Samuel Ortiz <sameo@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, Jun 11, 2014 at 10:22:22AM +0100, Pawel Moll wrote:
> On Wed, 2014-06-11 at 07:07 +0100, Dan Carpenter wrote:
> > We should return NULL if regmap_init() fails instead of continuing.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/misc/vexpress-syscfg.c b/drivers/misc/vexpress-syscfg.c
> > index 73068e5..2c0ddb2 100644
> > --- a/drivers/misc/vexpress-syscfg.c
> > +++ b/drivers/misc/vexpress-syscfg.c
> > @@ -231,10 +231,12 @@ static struct regmap *vexpress_syscfg_regmap_init(struct device *dev,
> >  	func->regmap = regmap_init(dev, NULL, func,
> >  			&vexpress_syscfg_regmap_config);
> >  
> > -	if (IS_ERR(func->regmap))
> > +	if (IS_ERR(func->regmap)) {
> >  		kfree(func);
> > -	else
> > -		list_add(&func->list, &syscfg->funcs);
> > +		return NULL;
> > +	}
> > +
> > +	list_add(&func->list, &syscfg->funcs);
> >  
> >  	return func->regmap;
> >  }
> 
> Not really, no. What made you think so?
> 
> vexpress_config_bridge_ops.regmap_init should return an ERR_PTR in case
> of troubles, not a NULL. See devm_regmap_init_vexpress_config() in
> drivers/bus/vexpress-config.c:
> 
>         regmap = bridge->ops->regmap_init(dev, bridge->context);
>         if (IS_ERR(regmap)) {

Ah...  That was sloppy of me.  There is a similar bug earlier and I'll
fix that as well.

regards,
dan carpenter

