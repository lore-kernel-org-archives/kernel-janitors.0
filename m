From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Fri, 09 Sep 2016 11:20:14 +0000
Subject: Re: [PATCH v2 1/1] intel-mid: Fix sfi get_platform_data() return value issues
Message-Id: <1473420014.11323.119.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473210255-227672-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
         <1473293103-78682-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
         <1473339095.11323.112.camel@linux.intel.com>
         <32bf3578-ec96-b043-67a1-7c6defb8c88c@linux.intel.com>
In-Reply-To: <32bf3578-ec96-b043-67a1-7c6defb8c88c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: sathyanarayanan.kuppuswamy@linux.intel.com, wharms@bfs.de
Cc: dan.carpenter@oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, david.a.cohen@linux.intel.com

On Thu, 2016-09-08 at 15:41 -0700, sathyanarayanan kuppuswamy wrote:

> 1. Rewrite GPIO expander logic to cover dynamic allocation. You have
> > to
> > check how it supposed to be in GPIO framework. IIRC gpio_base = -1
> I checked the expander driver logic. As long as we return platform
> data 
> as NULL, it by default falls back to dynamic allocation. So I think 
> returning NULL on gpio_base = -1 is itself enough to support the 
> dynamic allocation.
> 
> file: a/drivers/gpio/gpio-pca953x.c
> 
> 755         pdata = dev_get_platdata(&client->dev);
> 756         if (pdata) {
> 757                 irq_base = pdata->irq_base;
> 758                 chip->gpio_start = pdata->gpio_base;
> 759                 invert = pdata->invert;
> 760                 chip->names = pdata->names;
> 761         } else {
> 762                 chip->gpio_start = -1;
> 763                 irq_base = 0;
> 764         }

Yes, but we get 2 parameters: IRQ line (if used) and gpio_base.
And I dunno how to proceed if we have gpio_base not set and IRQ line is
set.

So, it needs a comment what we will do. Currently it says that "Check if
the SFI record valid". So, if it's indeed so, than we can't use even
dynamic allocation.


>>> -	if (gpio_base < 0)
> > > +	if (gpio_base < 0) {
> > > +		pr_err("%s: Unknown GPIO base number, falling
> > > back
> > > to"
> > > +		       "dynamic allocation\n", __func__);
> > 

> > No. This not just the message you show and abort initialization, in
> > case
> > of dynamic allocation you have to proceed initialization.
> How about we go with following warning message. Since using dynamic
> gpio 
> allocation is not an error, I think a warning message is more than 
> enough here. Also , I don't see any value in adding "Unknown gpio
> base 
> number" to the error message. So we can remove it to fit the log
> message 
> into one line.
> 
> +       if (gpio_base = -1) {
> +               pr_warn("%s: falling back to dynamic gpio
> allocation\n",
> +                       __func__);

See above. Perhaps we need to prevent the device driver initialization.

> --- a/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
> > > +++ b/arch/x86/platform/intel-mid/device_libs/platform_mpu3050.c
> > > @@ -14,15 +14,21 @@
> > >   
> > >   	i2c_info->irq = intr + INTEL_MID_IRQ_OFFSET;
> > > +
> > >   	return NULL;
> > This change doesn't belong to the series.
> Submitting a separate patch to fix this this single style issue seems
> to 
> be over kill. Will it be ok if I add this to my debug message patch ?

For me sounds okay, but what I know most of the maintainers doesn't
approve such changes ("white space" type of patches are most hateful).

So, I would not do this at all.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
