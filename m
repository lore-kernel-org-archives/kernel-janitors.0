From: Maxim Levitsky <maximlevitsky@gmail.com>
Date: Thu, 12 Aug 2010 16:42:18 +0000
Subject: Re: [patch] IR: ene_ir: problems in unwinding on probe
Message-Id: <1281631338.10393.7.camel@maxim-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100812074611.GI645@bicker>
	 <1281623704.10393.2.camel@maxim-laptop>  <20100812161927.GQ645@bicker>
In-Reply-To: <20100812161927.GQ645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2010-08-12 at 18:19 +0200, Dan Carpenter wrote: 
> On Thu, Aug 12, 2010 at 05:35:04PM +0300, Maxim Levitsky wrote:
> > On Thu, 2010-08-12 at 09:46 +0200, Dan Carpenter wrote: 
> > > There were a couple issues here.  If the allocation failed for "dev"
> > > then it would lead to a NULL dereference.  If request_irq() or
> > > request_region() failed it would release the irq and the region even
> > > though they were not successfully aquired.
> > > 
> > > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > 
> > I don't think this is needed.
> > I just alloc all the stuff, and if one of allocations fail, I free them
> > all. {k}free on NULL pointer is perfectly legal.
> > 
> > Same about IO and IRQ.
> > IRQ0 and IO 0 isn't valid, and I do test that in error path.
> > 
> >
> 
> Here is the original code:
> 
> Here is where we set "dev".
> 
>    785          dev = kzalloc(sizeof(struct ene_device), GFP_KERNEL);
>    786  
>    787          if (!input_dev || !ir_props || !dev)
>    788                  goto error;
> 
> 	[snip]
> 
> Here is where we set the IO and IRQ:
> 
>    800          dev->hw_io = pnp_port_start(pnp_dev, 0);
>    801          dev->irq = pnp_irq(pnp_dev, 0);
> 
> 	[snip]
> 
> Here is where the request_region() and request_irq() are.
> 
>    806          if (!request_region(dev->hw_io, ENE_MAX_IO, ENE_DRIVER_NAME))
>    807                  goto error;
>    808  
>    809          if (request_irq(dev->irq, ene_isr, 
>    810                          IRQF_SHARED, ENE_DRIVER_NAME, (void *)dev))
>    811                  goto error;
> 
> 	[snip]
> 
> Here is the error label:
> 
>    897  error:
>    898          if (dev->irq)
> 		    ^^^^^^^^
> 
> 	Oops!  The allocation of dev failed and this is a NULL
> 	dereference.
> 
>    899                  free_irq(dev->irq, dev);
> 
> 	Oops!  Request region failed and dev->irq is non-zero but
> 	request_irq() hasn't been called.
> 
>    900          if (dev->hw_io)
>    901                  release_region(dev->hw_io, ENE_MAX_IO);
> 
> 	Oops! dev->hw_io is non-zero but request_region() failed and so
> 	we just released someone else's region.


Ok, this is something different.
To be honest I was in hurry when I prepared the patch, so I didn't look
at this.
The intent was correct, and untill you pointed that out I somehow
assumed that error patch does what I supposed it to do... well...
In few days I will switch back to this driver and fix this problem.
I also have quite a lot of work to do in this driver now that I have
some hardware documentation (register renames are the fun part...).

So thanks for catching this.

Best regards,
Maxim Levitsky

