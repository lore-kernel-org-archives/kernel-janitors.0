From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 07 Sep 2016 12:00:27 +0000
Subject: Re: [bug report] x86/sfi: Enable enumeration of SD devices
Message-Id: <1473249627.11323.46.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715192348.GA6521@mwanda>
In-Reply-To: <20160715192348.GA6521@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Tue, 2016-09-06 at 17:51 -0700, Sathyanarayanan Kuppuswamy wrote:
> On 09/01/2016 06:17 AM, Andy Shevchenko wrote:
> > On Tue, 2016-08-30 at 11:18 -0700, Sathyanarayanan Kuppuswamy wrote:
> > IMO, Main problem here is, In some scenarios get_platform_data
> > > returns NULL on error case and in some cases it return NULL for no
> > > platform data case.

> > We have possibility of the following scenarios:
> > 1) fatal error (should return error code and fail booting)
> > 2) non-fatal error (prevents certain device to be enumerated, pdata
> > = NULL)
> > 3) no pdata for the device (not an error! pdata is optional to the
> > certain driver)
> > 4) pdata != NULL (fully armed device driver)
> > 
> > According to above I doubt we will have many 1) cases. Otherwise
> > pdata = NULL is okay.

> I agree with 2,3 and 4 scenarios. But I am not sure about the first 
> case. Since these are peripheral devices, any failure in them should
> not stop the device boot. Do you have any examples for this case ?

That's what I'm wondering of. I didn't investigate this deep.

In any case for 2) we have to print out a warning (?) message.

> Attached patch fixes the return value issues in get_platform_data
> code 
> in device_libs directory. Please check and let me know your comments.

Will do.


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
