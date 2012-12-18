From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Dec 2012 18:48:17 +0000
Subject: Re: [PATCH RESEND 2/6] clk: exynos: Fix incorrect usage of IS_ERR_OR_NULL
Message-Id: <20121218184816.GJ5032@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355852048-23188-1-git-send-email-linux@prisktech.co.nz>
 <1355852048-23188-3-git-send-email-linux@prisktech.co.nz>
In-Reply-To: <1355852048-23188-3-git-send-email-linux@prisktech.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tony Prisk <linux@prisktech.co.nz>
Cc: kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org

On Wed, Dec 19, 2012 at 06:34:04AM +1300, Tony Prisk wrote:
> Resend to include mailing lists.

These kind of comments should go under the Signed of by line under
a "---" line.  They will be removed by git-am instead of being
preserved in the git log.

Signed-off-by bla bla blah
---
Commments...

<patch>

regards,
dan carpenter

