From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Fri, 25 Aug 2017 17:53:47 +0000
Subject: Re: [PATCH] x86/platform/intel-mid: make several arrays static, makes code smaller
Message-Id: <1503683627.25945.114.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825163206.23250-1-colin.king@canonical.com>
         <20170825175104.GA19150@wunner.de>
In-Reply-To: <20170825175104.GA19150@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Lukas Wunner <lukas@wunner.de>, Colin King <colin.king@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Bjorn Helgaas <bhelgaas@google.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2017-08-25 at 19:51 +0200, Lukas Wunner wrote:
> On Fri, Aug 25, 2017 at 05:32:06PM +0100, Colin King wrote:
> > --- a/arch/x86/platform/intel-mid/pwr.c
> > +++ b/arch/x86/platform/intel-mid/pwr.c
> > @@ -444,7 +444,7 @@ static int mid_set_initial_state(struct mid_pwr
> > *pwr, const u32 *states)
> >  static int pnw_set_initial_state(struct mid_pwr *pwr)
> >  {
> >  	/* On Penwell SRAM must stay powered on */
> > -	const u32 states[] = {
> > +	static const u32 states[] = {
> >  		0xf00fffff,		/* PM_SSC(0) */
> >  		0xffffffff,		/* PM_SSC(1) */
> >  		0xffffffff,		/* PM_SSC(2) */
> 
> That's a known gcc bug:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?idh725
> 
> There are hundreds of constant compound literals that are generated
> on the stack rather than stored in rodata, do you intend to file
> patches for all of them?  Adding static everywhere is just a
> workaround that bloats the code.  Fixing the root cause in gcc would
> make more sense.

That is a good point.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
