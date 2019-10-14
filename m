From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 14 Oct 2019 07:53:43 +0000
Subject: Re: [PATCH] dmaengine: zx: Use devm_platform_ioremap_resource() in zx_dma_probe()
Message-Id: <20191014075311.GJ2654@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <85de79fa-1ca5-a1e5-0296-9e8a2066f134@web.de>
In-Reply-To: <85de79fa-1ca5-a1e5-0296-9e8a2066f134@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 22-09-19, 14:37, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Sep 2019 14:32:12 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.

Applied, thanks

-- 
~Vinod
