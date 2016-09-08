From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 08 Sep 2016 09:49:06 +0000
Subject: Re: [PATCH 1/1] intel-mid: Fix sfi get_platform_data() return value issues
Message-Id: <1473328146.11323.92.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a42b4af5-e2a5-d922-b5a5-ab177bb15140@intel.com>
         <1473210255-227672-1-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
         <1473250509.11323.60.camel@linux.intel.com>
         <71e4231f-33dc-9a95-c748-89bc5ec322d5@linux.intel.com>
In-Reply-To: <71e4231f-33dc-9a95-c748-89bc5ec322d5@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: sathyanarayanan.kuppuswamy@linux.intel.com, wharms@bfs.de
Cc: dan.carpenter@oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, david.a.cohen@linux.intel.com

On Wed, 2016-09-07 at 17:04 -0700, sathyanarayanan kuppuswamy wrote:

> --- a/arch/x86/platform/intel-mid/sfi.c
> > > +++ b/arch/x86/platform/intel-mid/sfi.c
> > > @@ -335,9 +335,12 @@ static void __init sfi_handle_ipc_dev(struct
> > > sfi_device_table_entry *pentry,
> > >   
> > >   	pr_debug("IPC bus, name = %16.16s, irq = 0x%2x\n",
> > >   		pentry->name, pentry->irq);
> > > +
> > >   	pdata = intel_mid_sfi_get_pdata(dev, pentry);
> > > -	if (IS_ERR(pdata))
> > > +	if (IS_ERR(pdata)) {
> > > +		pr_err("ipc_device: %s: invalid platform data\n",
> > > pentry->name);
> > >   		return;
> > > +	}
> > This is actually needs more work. We have duplication in sfi.c and
> > platform_ipc.c.
> Yes. But platform_ipc.c implements custom ipc handler for audio ipc 
> device. Even though there are duplications between custom handler and 
> generic handler in sfi.c, I think its bit early to optimize this. I 
> think we should revisit this once we have one more implementation of 
> custom ipc handler.

Definitely it's out of scope for now.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
