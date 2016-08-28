From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Sun, 28 Aug 2016 13:31:50 +0000
Subject: Re: [bug report] x86/sfi: Enable enumeration of SD devices
Message-Id: <1472391110.4887.328.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715192348.GA6521@mwanda>
In-Reply-To: <20160715192348.GA6521@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

+ David, Sathya

On Tue, 2016-08-09 at 20:58 +0300, Dan Carpenter wrote:
> On Tue, Aug 09, 2016 at 06:32:55PM +0300, Andy Shevchenko wrote:
> > 
> > On Fri, 2016-07-15 at 22:23 +0300, Dan Carpenter wrote:
> > > 
> > > Hello Andy Shevchenko,
> > > 
> > > The patch 05f310e26fe9: "x86/sfi: Enable enumeration of SD
> > > devices"
> > > from Jul 12, 2016, leads to the following static checker warning:
> > > 
> > > 	arch/x86/platform/intel-mid/sfi.c:427 sfi_handle_sd_dev()
> > > 	warn: 'pdata' isn't an ERR_PTR
> > > 
> > > arch/x86/platform/intel-mid/sfi.c
> > >    416          memset(&sd_info, 0, sizeof(sd_info));
> > >    417          strncpy(sd_info.name, pentry->name, SFI_NAME_LEN);
> > >    418          sd_info.bus_num = pentry->host_num;
> > >    419          sd_info.max_clk = pentry->max_freq;
> > >    420          sd_info.addr = pentry->addr;
> > >    421          pr_debug("SD bus = %d, name = %16.16s, max_clk > > > %d,
> > > addr = 0x%x\n",
> > >    422                   sd_info.bus_num,
> > >    423                   sd_info.name,
> > >    424                   sd_info.max_clk,
> > >    425                   sd_info.addr);
> > >    426          pdata = intel_mid_sfi_get_pdata(dev, &sd_info);
> > >                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > This is a macro calling a function pointer.  None of the functions
> > > return error pointers.  Some return NULL on error but some return
> > > NULL
> > > on success.
> > > 
> > >    427          if (IS_ERR(pdata))
> > >    428                  return;
> > >    429  
> > >    430          /* Nothing we can do with this for now */
> > >    431          sd_info.platform_data = pdata;
> > >    432  
> > 
> > Thanks for catching up this. At some point in the future I will re-
> > check 
> > all those so called "device lib" files to be aligned to one
> > standard. Of
> > course you may propose a patch if you feel you can do it.
> 
> I'm a temporary haitus from work but what's the standard supposed
> to be?

I've checked all upstreamed platform modules (arch/x86/platform/intel-
mid/device_libs/) and noticed that not a single one returns ERR_PTR. 

Though I think the idea was to provide a way to fail initialization in
some cases where hardware must be initialized properly. Maybe David or
Sathya can shed a light on this.

If we decide to change that it should be done for all so called device
handlers in sfi.c.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
