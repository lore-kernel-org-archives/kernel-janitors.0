From: Samuel Ortiz <sameo@openedhand.com>
Date: Tue, 17 Feb 2009 09:23:44 +0000
Subject: Re: [PATCH] drivers/mfd: Storage class should be before const
Message-Id: <20090217091433.GB2818@sortiz.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090209220426.GA7902@xenon.distanz.ch>
In-Reply-To: <20090209220426.GA7902@xenon.distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Feb 16, 2009 at 01:54:46PM +0100, Jiri Kosina wrote:
> On Mon, 9 Feb 2009, Tobias Klauser wrote:
> 
> > The C99 specification states in section 6.11.5:
> > 
> > The placement of a storage-class specifier other than at the beginning
> > of the declaration specifiers in a declaration is an obsolescent
> > feature.
> > 
> > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > ---
> >  drivers/mfd/t7l66xb.c     |    4 ++--
> >  drivers/mfd/tc6393xb.c    |    2 +-
> >  drivers/mfd/twl4030-irq.c |    2 +-
> >  3 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/mfd/t7l66xb.c b/drivers/mfd/t7l66xb.c
> > index 9f7024c..e9f4323 100644
> > --- a/drivers/mfd/t7l66xb.c
> > +++ b/drivers/mfd/t7l66xb.c
> > @@ -108,7 +108,7 @@ static int t7l66xb_mmc_disable(struct platform_device *mmc)
> >  
> >  /*--------------------------------------------------------------------------*/
> >  
> > -const static struct resource t7l66xb_mmc_resources[] = {
> > +static const struct resource t7l66xb_mmc_resources[] = {
> >  	{
> >  		.start = 0x800,
> >  		.end	= 0x9ff,
> > @@ -126,7 +126,7 @@ const static struct resource t7l66xb_mmc_resources[] = {
> >  	},
> >  };
> >  
> > -const static struct resource t7l66xb_nand_resources[] = {
> > +static const struct resource t7l66xb_nand_resources[] = {
> >  	{
> >  		.start	= 0xc00,
> >  		.end	= 0xc07,
> > diff --git a/drivers/mfd/tc6393xb.c b/drivers/mfd/tc6393xb.c
> > index f856e94..77a12fc 100644
> > --- a/drivers/mfd/tc6393xb.c
> > +++ b/drivers/mfd/tc6393xb.c
> > @@ -172,7 +172,7 @@ static struct resource __devinitdata tc6393xb_mmc_resources[] = {
> >  	},
> >  };
> >  
> > -const static struct resource tc6393xb_ohci_resources[] = {
> > +static const struct resource tc6393xb_ohci_resources[] = {
> >  	{
> >  		.start	= 0x3000,
> >  		.end	= 0x31ff,
> > diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
> > index b108760..aca2670 100644
> > --- a/drivers/mfd/twl4030-irq.c
> > +++ b/drivers/mfd/twl4030-irq.c
> > @@ -182,7 +182,7 @@ static int twl4030_irq_thread(void *data)
> >  	long irq = (long)data;
> >  	struct irq_desc *desc = irq_to_desc(irq);
> >  	static unsigned i2c_errors;
> > -	const static unsigned max_i2c_errors = 100;
> > +	static const unsigned max_i2c_errors = 100;
> >  
> >  	if (!desc) {
> >  		pr_err("twl4030: Invalid IRQ: %ld\n", irq);
> 
> This doesn't seem to be picked by anyone for current -next/-mmotm, I have
> applied it to trivial tree. Thanks,
I'm queueing this one into my mfd for-next branch. I'm ok if you push it
upstream before the next merge window though.

Cheers,
Samuel.

 
> -- 
> Jiri Kosina
> SUSE Labs

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
