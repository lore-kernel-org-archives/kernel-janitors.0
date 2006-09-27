From: Badari Pulavarty <pbadari@us.ibm.com>
Date: Wed, 27 Sep 2006 21:04:25 +0000
Subject: Re: [KJ] [RFC] request_region() error handling fixes
Message-Id: <1159391065.1709.46.camel@dyn9047017100.beaverton.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
In-Reply-To: <1159387194.1709.40.camel@dyn9047017100.beaverton.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 2006-09-27 at 13:48 -0700, Nishanth Aravamudan wrote:
> On 27.09.2006 [12:59:54 -0700], Badari Pulavarty wrote:
> > Hi,
> > 
> > I started working on request_region() error handling fixes.
> > Before I got too far, want to make sure its following approach
> > is acceptable. (not happy with too many "goto" statements). 
> > Is there a better way to do this ?
> 
> I don't think there is any better way to do multiple stacked failures
> than many gotos. At least, if the goal is to avoid code duplication
> (which I would say it is).

Okay. Do you think I should add unlikely() for these to get better
code ?

> > Please comment.
> 
> Looks good, except one nit and one error below.
> 
> <snip>
> 
> > =================================> > --- linux-2.6.18.orig/arch/powerpc/platforms/chrp/setup.c	2006-09-27 09:17:23.000000000 -0700
> > +++ linux-2.6.18/arch/powerpc/platforms/chrp/setup.c	2006-09-27 13:20:17.000000000 -0700
> 
> <snip>
> 
> > +	if (!request_region(0x20,0x20,"pic1")) {
> > +		printk(KERN_WARNING"chrp_init: pic1 request region failed\n");
> 
> nit: usually a space is placed between the KERN_ and the string to be
> output. Same goes for all the printk()s added.

Sure. Will do. I copied it from another place :(

> 
> <snip>
> 
> > Index: linux-2.6.18/arch/ppc/platforms/pplus.c
> > =================================> > --- linux-2.6.18.orig/arch/ppc/platforms/pplus.c	2006-09-19 20:42:06.000000000 -0700
> > +++ linux-2.6.18/arch/ppc/platforms/pplus.c	2006-09-27 10:02:48.000000000 -0700
> > @@ -814,14 +814,49 @@
> >  static void __init pplus_init2(void)
> >  {
> >  #ifdef CONFIG_NVRAM
> > -	request_region(PREP_NVRAM_AS0, 0x8, "nvram");
> > +	if (request_region(PREP_NVRAM_AS0, 0x8, "nvram")) {
> 
> This should be a negated test like all the rest, right?

Yes. My fault.

Thanks,
Badari

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
