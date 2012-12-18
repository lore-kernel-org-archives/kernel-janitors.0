From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Dec 2012 19:03:34 +0000
Subject: Re: [PATCH RESEND 3/6] clk: exynos: Fix incorrect usage of IS_ERR_OR_NULL
Message-Id: <20121218190334.GK5032@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355852048-23188-1-git-send-email-linux@prisktech.co.nz>
	<1355852048-23188-4-git-send-email-linux@prisktech.co.nz>
	<20121218183944.GH5032@mwanda> <1355856767.23479.3.camel@gitbox>
In-Reply-To: <1355856767.23479.3.camel@gitbox>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Prisk <linux@prisktech.co.nz>
Cc: Mike Turquette <mturquette@linaro.org>, kernel-janitors@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>, linux-arm-kernel@lists.infradead.org

I don't care either way, but being different from the documentation
is less bad than crashing which is what your patch does.  Please
be more careful in the future.

regards,
dan carpenter

