From: Tony Prisk <linux@prisktech.co.nz>
Date: Tue, 18 Dec 2012 18:52:47 +0000
Subject: Re: [PATCH RESEND 3/6] clk: exynos: Fix incorrect usage of IS_ERR_OR_NULL
Message-Id: <1355856767.23479.3.camel@gitbox>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355852048-23188-1-git-send-email-linux@prisktech.co.nz>
	 <1355852048-23188-4-git-send-email-linux@prisktech.co.nz>
	 <20121218183944.GH5032@mwanda>
In-Reply-To: <20121218183944.GH5032@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, Mike Turquette <mturquette@linaro.org>

On Tue, 2012-12-18 at 21:39 +0300, Dan Carpenter wrote:
> On Wed, Dec 19, 2012 at 06:34:05AM +1300, Tony Prisk wrote:
> > Resend to include mailing lists.
> > 
> > Replace IS_ERR_OR_NULL with IS_ERR on clk_get results.
> > 
> 
> The original code is correct.  clk_get() can return NULL depending
> on the .config.
> 
> regards,
> dan carpenter

Thanks for than Dan,

Arguably that seems like an incorrect behaviour on the part of the clock
subsystem given that the 'proper' function has kernel doc:

* Returns a struct clk corresponding to the clock producer, or
* valid IS_ERR() condition containing errno.

Therefore the 'empty' version should adhere to the same rules, and not
return NULL.

I've cc'd Mike Turquette as well for his thoughts.

Regards
Tony P

