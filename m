From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Sat, 20 Mar 2010 17:23:15 +0000
Subject: Re: [PATCH 17/24] regulator: fix dangling pointers
Message-Id: <20100320172315.GE1549@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de> <1269094385-16114-18-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1269094385-16114-18-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>

On Sat, Mar 20, 2010 at 03:12:58PM +0100, Wolfram Sang wrote:
> Fix I2C-drivers which missed setting clientdata to NULL before freeing the
> structure it points to. Also fix drivers which do this _after_ the structure
> was freed already.

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

but like I say this doesn't seem like something that belongs in the
drivers.
