From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Mon, 14 Dec 2020 13:41:16 +0000
Subject: Re: [PATCH] mfd: wm831x-auxadc: Prevent use after free in wm831x_auxadc_read_irq()
Message-Id: <20201214134116.GC9673@ediswmail.ad.cirrus.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9dTjo3VQIMJP6O9@mwanda>
In-Reply-To: <X9dTjo3VQIMJP6O9@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Samuel Ortiz <sameo@linux.intel.com>, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Dec 14, 2020 at 02:59:10PM +0300, Dan Carpenter wrote:
> The "req" struct is always added to the "wm831x->auxadc_pending" list,
> but it's only removed from the list on the success path.  If a failure
> occurs then the "req" struct is freed but it's still on the list,
> leading to a use after free.
> 
> Fixes: 78bb3688ea18 ("mfd: Support multiple active WM831x AUXADC conversions")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
