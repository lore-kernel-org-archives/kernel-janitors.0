From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 17 Feb 2009 11:27:02 +0000
Subject: Re: [PATCH] drivers/mfd: Storage class should be before const
Message-Id: <alpine.LNX.1.10.0902171226200.18110@jikos.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090209220426.GA7902@xenon.distanz.ch>
In-Reply-To: <20090209220426.GA7902@xenon.distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 17 Feb 2009, Samuel Ortiz wrote:

> > > --- a/drivers/mfd/twl4030-irq.c
> > > +++ b/drivers/mfd/twl4030-irq.c
> > > @@ -182,7 +182,7 @@ static int twl4030_irq_thread(void *data)
> > >  	long irq = (long)data;
> > >  	struct irq_desc *desc = irq_to_desc(irq);
> > >  	static unsigned i2c_errors;
> > > -	const static unsigned max_i2c_errors = 100;
> > > +	static const unsigned max_i2c_errors = 100;
> > >  
> > >  	if (!desc) {
> > >  		pr_err("twl4030: Invalid IRQ: %ld\n", irq);
> > 
> > This doesn't seem to be picked by anyone for current -next/-mmotm, I have
> > applied it to trivial tree. Thanks,
> I'm queueing this one into my mfd for-next branch. I'm ok if you push it
> upstream before the next merge window though.

No problem, I have dropped it from trivial tree, please take it through 
yours.

Thanks,

-- 
Jiri Kosina
SUSE Labs
