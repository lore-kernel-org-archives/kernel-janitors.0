From: Shawn Guo <shawnguo@kernel.org>
Date: Mon, 07 Oct 2019 12:25:49 +0000
Subject: Re: [PATCH] dmaengine: zx: Use devm_platform_ioremap_resource() in zx_dma_probe()
Message-Id: <20191007122546.GK7150@dragon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <85de79fa-1ca5-a1e5-0296-9e8a2066f134@web.de>
In-Reply-To: <85de79fa-1ca5-a1e5-0296-9e8a2066f134@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Jun Nie <jun.nie@linaro.org>, Vinod Koul <vkoul@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Sep 22, 2019 at 02:37:13PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Sep 2019 14:32:12 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Shawn Guo <shawnguo@kernel.org>
