From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 04 Feb 2021 10:37:24 +0000
Subject: Re: [PATCH RESEND] mfd: wm831x-auxadc: Prevent use after free in wm831x_auxadc_read_irq()
Message-Id: <20210204103724.GC2789116@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210129143724.GX20820@kadam>
In-Reply-To: <20210129143724.GX20820@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Samuel Ortiz <sameo@linux.intel.com>, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 29 Jan 2021, Dan Carpenter wrote:

> The "req" struct is always added to the "wm831x->auxadc_pending" list,
> but it's only removed from the list on the success path.  If a failure
> occurs then the "req" struct is freed but it's still on the list,
> leading to a use after free.
> 
> Fixes: 78bb3688ea18 ("mfd: Support multiple active WM831x AUXADC conversions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/mfd/wm831x-auxadc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Patchwork still can't find this.

I've applied it manually, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
