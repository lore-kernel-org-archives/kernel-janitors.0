From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 11 Jun 2014 17:12:32 +0000
Subject: Re: [patch v2] mfd: vexpress: fix error handling vexpress_syscfg_regmap_init()
Message-Id: <20140611171232.GB25550@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140611101740.GA13148@mwanda>
 <1402482800.3523.20.camel@hornet>
In-Reply-To: <1402482800.3523.20.camel@hornet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pawel Moll <pawel.moll@arm.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, Jun 11, 2014 at 11:33:20AM +0100, Pawel Moll wrote:
> On Wed, 2014-06-11 at 11:17 +0100, Dan Carpenter wrote:
> > This function should be returning an ERR_PTR() on failure instead of
> > NULL.  Also there is a use after free bug if regmap_init() fails because
> > we free "func" and then dereference doing the return.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/misc/vexpress-syscfg.c b/drivers/misc/vexpress-syscfg.c
> > index 73068e5..3250fc1 100644
> > --- a/drivers/misc/vexpress-syscfg.c
> > +++ b/drivers/misc/vexpress-syscfg.c
> > @@ -199,7 +199,7 @@ static struct regmap *vexpress_syscfg_regmap_init(struct device *dev,
> >  	func = kzalloc(sizeof(*func) + sizeof(*func->template) * num,
> >  			GFP_KERNEL);
> >  	if (!func)
> > -		return NULL;
> > +		return ERR_PTR(-ENOMEM);
> >  
> >  	func->syscfg = syscfg;
> >  	func->num_templates = num;
> > @@ -231,10 +231,14 @@ static struct regmap *vexpress_syscfg_regmap_init(struct device *dev,
> >  	func->regmap = regmap_init(dev, NULL, func,
> >  			&vexpress_syscfg_regmap_config);
> >  
> > -	if (IS_ERR(func->regmap))
> > +	if (IS_ERR(func->regmap)) {
> > +		void *err = func->regmap;
> > +
> >  		kfree(func);
> > -	else
> > -		list_add(&func->list, &syscfg->funcs);
> > +		return err;
> > +	}
> > +
> > +	list_add(&func->list, &syscfg->funcs);
> >  
> >  	return func->regmap;
> >  }
> 
> Uh, right. Dereferencing a freed structure. My bad. Thanks for spotting
> this!
> 
> Acked-by: Pawel Moll <pawel.moll@arm.com>
> 
> (nit: the subject should be "misc: vexpress:" rather then "mfd:")
> 
> Arnd, Olof, can you pick this one as an early fix or do you want me to
> queue it for rc1-based fixes branch?
>

I can queue it up.

thanks,

greg k-h
