From: Julia Lawall <julia@diku.dk>
Date: Wed, 23 Apr 2008 09:54:20 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <Pine.LNX.4.58.0804231134400.1185@pc-041.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 23 Apr 2008, Roel Kluin wrote:

> Julia Lawall wrote:
> > Thanks for the interesting comparison.
> >
> >> Spatch did find some that my script didn't, and mine had a few false
> >> positives.
> >> However, your spatch script did not catch some that my script covered. Below
> >> are the results of my script (after a few modifications) and below that yours
> >> for comparison. for instance not caught were:
> >> * unsigned (or any unsigned typedef) i;
> >
> > Actually, if I had written just "unsigned", it would have picked up on
> > "unsigned" or "unsigned int".  Spatch has something called an isomorphism,
> > which replaces certain terms by a set of equivelant ones.  But someone has
> > to describe what the equivalent ones should be, and for unsigned it was
> > described as "unsigned => unsigned int", probably because I thought going
> > the other way around might be unsafe.  Anyway, this problem is corrected
> > in the semantic match for finding functions that return negative values
> > but have unsigned as a return type.
>
> If the function returns a negative int, but it is stored in an unsigned and
> subsequently tested, We have a problem as well.
> A test could either mean that the author was very pedantic, or that he/she
> forgot about the signedness.

Sorry, but I'm missing the point here.  We have already checked for
unsigned things that are compared to 0.  Doesn't that address the case
you mention?

> > With respect to typedefs, we do take them into account, but we only expand
> > a (probably useful) subset of the include files to save time.  Also
> > without processing the makefile, it is not always possible to know which
> > include file an include refers to.  Of course we could run the
> > preprocessor on the source code, but since our main goal is
> > transformation, we would like to stay as close as possible to the
> > structure of the source program.  Of course this is less of an issue for
> > this kind of searching, but we haven't explored this option.
> >
> > I haven't had a chance to look through all of your examples yet.  Were
> > there any cases where you found a local typedef? I also wrote a rule for
> > some of the standard things like u32, etc, but they didn't turn up much,
> > and not much that looked significant.
>
> Yes there were some, for instance in the -mm patch:
> ext4-mballoc-fix-hot-spins-after-err_freebuddy-and-err_freemeta.patch

OK, thanks for the pointer.

> I meant something like the bash script below. it isn't working, however. I
> suspect I did something wrong in the spatch patch or invocation.

OK, now I see what you mean.  I have indeed made scripts to do this sort
of thing - eg first you write a semantic match to find the names of all of
the functions that might return a negative constant, and then you use
those names to instantiate another semantic patch that searches for uses
of each one of them.  Finally, you run each of those semantic matches on
the Linux kernel.

Your script worked fine for me.  I did the following from my directory
containing the Linux sources:

bash ~/the_script > ~/the_script.output

I modified the script though to give -quiet as an argument to spatch,
since otherwise it is quite verbose.  Normally with -quiet, you have only
the output you are interested in.

I didn't let it run all the way, but I got the following output, that
looks reasonable:

--- arch/arm/mach-davinci/psc.c	2008-04-07 13:50:25.000000000 +0200
@@ -70,7 +70,7 @@ void davinci_psc_config(unsigned int dom
 {
 	u32 epcpr, ptcmd, ptstat, pdstat, pdctl1, mdstat, mdctl, mdstat_mask;

-	if (id < 0)
 		return;

 	mdctl = davinci_readl(DAVINCI_PWR_SLEEP_CNTRL_BASE + MDCTL + 4 *
id);
--- arch/arm/mach-omap2/usb-tusb6010.c	2008-04-07 13:50:25.000000000 +0200
@@ -124,7 +124,7 @@ static int tusb_set_sync_mode(unsigned s
 	tmp = (t.sync_clk * 1000 + fclk_ps - 1) / fclk_ps;
 	if (tmp > 4)
 		return -ERANGE;
-	if (tmp <= 0)
 		tmp = 1;
 	t.page_burst_access = (fclk_ps * tmp) / 1000;

--- arch/arm/mach-sa1100/collie.c	2008-04-07 13:50:25.000000000 +0200
@@ -112,7 +112,7 @@ static u_int collie_uart_get_mctrl(struc
 	unsigned int r;

 	r = locomo_gpio_read_output(&collie_locomo_device.dev,
LOCOMO_GPIO_CTS & LOCOMO_GPIO_DSR);
-	if (r = -ENODEV)
 		return ret;
 	if (r & LOCOMO_GPIO_CTS)
 		ret |= TIOCM_CTS;
--- arch/cris/arch-v10/kernel/dma.c	2008-04-16 13:27:54.000000000 +0200
@@ -24,7 +24,7 @@ int cris_request_dma(unsigned int dmanr,
 	unsigned long int gens;
 	int fail = -EINVAL;

-	if ((dmanr < 0) || (dmanr >= MAX_DMA_CHANNELS)) {
 		printk(KERN_CRIT "cris_request_dma: invalid DMA channel
%u\n", dmanr);
 		return -EINVAL;
 	}
@@ -213,7 +213,7 @@ int cris_request_dma(unsigned int dmanr,
 void cris_free_dma(unsigned int dmanr, const char * device_id)
 {
 	unsigned long flags;
-	if ((dmanr < 0) || (dmanr >= MAX_DMA_CHANNELS)) {
 		printk(KERN_CRIT "cris_free_dma: invalid DMA channel
%u\n", dmanr);
 		return;
 	}

julia
