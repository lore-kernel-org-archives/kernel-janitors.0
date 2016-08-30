From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Tue, 30 Aug 2016 11:13:25 +0000
Subject: Re: [bug report] x86/sfi: Enable enumeration of SD devices
Message-Id: <1472555605.4887.383.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715192348.GA6521@mwanda>
In-Reply-To: <20160715192348.GA6521@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Tue, 2016-08-30 at 13:06 +0200, walter harms wrote:
> 
> Am 30.08.2016 11:46, schrieb Andy Shevchenko:
> > 
> > On Mon, 2016-08-29 at 20:59 +0000, Kuppuswamy, Sathyanarayanan
> > wrote:
> > > 
> > > Hi Andy/Dan,
> > > 
> > > Thanks for catching this bug. As Andy mentioned, this code is
> > > written
> > > in this manner to let the get_platform_data() function pointer to
> > > return the error value on initialization failure. But it has never
> > > been used properly in any of the existing code. So my suggestion
> > > is
> > > either change the platform_lib code to return ERR_PTR on failure
> > > or
> > > change the intel_mid_sfi_get_pdata to check for NULL as well.
> > > Since
> > > all the use case of intel_mid_sfi_get_pdata are void functions, I
> > > would prefer to go with second solution. Please let me know your
> > > comments.
> > > 
> > > diff --git a/arch/x86/platform/intel-mid/sfi.c
> > > b/arch/x86/platform/intel-mid/sfi.c
> > > index 051d264..a6bd275 100644
> > > --- a/arch/x86/platform/intel-mid/sfi.c
> > > +++ b/arch/x86/platform/intel-mid/sfi.c
> > > @@ -336,7 +336,7 @@ static void __init sfi_handle_ipc_dev(struct
> > > sfi_device_table_entry *pentry,
> > >         pr_debug("IPC bus, name = %16.16s, irq = 0x%2x\n",
> > >                 pentry->name, pentry->irq);
> > >         pdata = intel_mid_sfi_get_pdata(dev, pentry);
> > > -       if (IS_ERR(pdata))
> > > +       if (IS_ERR_OR_NULL(pdata))
> > 
> > But this looks wrong.
> > pdata = NULL is valid case for many devices! In other words pdata
> > is an
> > optional argument to the device drivers.
> > 
> 
> Yep, the way is wrong.
> NULL can say: get_platform_data does not exists
> or get_platform_data() returned NULL (what ever that means).
> 
> IMHO it feels better to drop the define and replace it
> with a proper function call and error.

Yeah, this direction looks better, thanks.

> 
> #define intel_mid_sfi_get_pdata(dev, priv)      \
>          ((dev)->get_platform_data ? (dev)->get_platform_data(priv) :
> NULL)
> 
> 
> void *fkt(struct devs_id *dev, void *info)
> {
>      if ( ! dev->get_platform_data)
> 	  return ERR_PTR(-ENOSYS);
> 
> 	return dev->get_platform_data(info);
> }
> 

> > > I've checked all upstreamed platform modules
> > > (arch/x86/platform/intel-
> > > mid/device_libs/) and noticed that not a single one returns
> > > ERR_PTR.
> > > 
> > > Though I think the idea was to provide a way to fail
> > > initialization in
> > > some cases where hardware must be initialized properly. Maybe
> > > David or
> > > Sathya can shed a light on this.
> > > 
> > > If we decide to change that it should be done for all so called
> > > device
> > > handlers in sfi.c.
> > > 
> > > --
> > > Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Intel Finland Oy
> > 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
