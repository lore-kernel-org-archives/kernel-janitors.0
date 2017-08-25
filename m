From: Lukas Wunner <lukas@wunner.de>
Date: Fri, 25 Aug 2017 17:51:04 +0000
Subject: Re: [PATCH] x86/platform/intel-mid: make several arrays static, makes code smaller
Message-Id: <20170825175104.GA19150@wunner.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825163206.23250-1-colin.king@canonical.com>
In-Reply-To: <20170825163206.23250-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Bjorn Helgaas <bhelgaas@google.com>, kernel-janitors@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org

On Fri, Aug 25, 2017 at 05:32:06PM +0100, Colin King wrote:
> --- a/arch/x86/platform/intel-mid/pwr.c
> +++ b/arch/x86/platform/intel-mid/pwr.c
> @@ -444,7 +444,7 @@ static int mid_set_initial_state(struct mid_pwr *pwr, const u32 *states)
>  static int pnw_set_initial_state(struct mid_pwr *pwr)
>  {
>  	/* On Penwell SRAM must stay powered on */
> -	const u32 states[] = {
> +	static const u32 states[] = {
>  		0xf00fffff,		/* PM_SSC(0) */
>  		0xffffffff,		/* PM_SSC(1) */
>  		0xffffffff,		/* PM_SSC(2) */

That's a known gcc bug:
https://gcc.gnu.org/bugzilla/show_bug.cgi?idh725

There are hundreds of constant compound literals that are generated
on the stack rather than stored in rodata, do you intend to file
patches for all of them?  Adding static everywhere is just a
workaround that bloats the code.  Fixing the root cause in gcc would
make more sense.

Just my 2 cents worth of course.

Thanks,

Lukas
