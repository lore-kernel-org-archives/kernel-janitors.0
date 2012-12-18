From: Tony Prisk <linux@prisktech.co.nz>
Date: Tue, 18 Dec 2012 19:11:57 +0000
Subject: Re: [PATCH RESEND 3/6] clk: exynos: Fix incorrect usage of IS_ERR_OR_NULL
Message-Id: <1355857917.24188.3.camel@gitbox>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355852048-23188-1-git-send-email-linux@prisktech.co.nz>
	 <1355852048-23188-4-git-send-email-linux@prisktech.co.nz>
	 <20121218183944.GH5032@mwanda> <1355856767.23479.3.camel@gitbox>
	 <20121218190334.GK5032@mwanda>
In-Reply-To: <20121218190334.GK5032@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org, Mike Turquette <mturquette@linaro.org>

On Tue, 2012-12-18 at 22:03 +0300, Dan Carpenter wrote:
> I don't care either way, but being different from the documentation
> is less bad than crashing which is what your patch does.  Please
> be more careful in the future.
> 
> regards,
> dan carpenter

Critism accepted.

Given that the driver depends on (PLAT_SAMSUNG || ARCH_MULTIPLATFORM),
and multiplatform select COMMON_CLK and PLAT_SAMSUNG is selected only by
ARCH_S3C64XX which has HAVE_CLK I didn't see a problem here.

Your point is still valid and I will sort it out with Mike first.

Regards
Tony P

