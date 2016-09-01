From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 01 Sep 2016 13:17:18 +0000
Subject: Re: [bug report] x86/sfi: Enable enumeration of SD devices
Message-Id: <1472735838.4887.459.camel@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160715192348.GA6521@mwanda>
In-Reply-To: <20160715192348.GA6521@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Tue, 2016-08-30 at 11:18 -0700, Sathyanarayanan Kuppuswamy wrote:

> IMO, Main problem here is, In some scenarios get_platform_data
> returns 
> NULL on error case and in some cases it return NULL for no platform
> data 
> case.

We have possibility of the following scenarios:
1) fatal error (should return error code and fail booting)
2) non-fatal error (prevents certain device to be enumerated, pdata NULL)
3) no pdata for the device (not an error! pdata is optional to the
certain driver)
4) pdata != NULL (fully armed device driver)

According to above I doubt we will have many 1) cases. Otherwise pdata NULL is okay.

> 
> For example, in following function, returning NULL on gpio_base = -1 
> and when nr >= PCAL9555A_NUM is incorrect. I think in both these 
> scenarios valid behavior is to stop the device creation process. 

Yes, but do _not_ stop processing and booting!

> Creating an i2c device without validi irq number or gpio number is 
> incorrect.
> 
> So after investigating it bit more, I think its more appropriate to
> fix 
> these error cases in device_libs dir. Let me know your comments.

I doubt that is a proper fix. It might be part of the fix in sfi.c where
you somehow distinguish fatal errors from non-fatal.


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
