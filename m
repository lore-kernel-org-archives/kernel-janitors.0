From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 14 Oct 2019 07:51:52 +0000
Subject: Re: [PATCH] dmaengine: k3dma: Use devm_platform_ioremap_resource() in k3_dma_probe()
Message-Id: <20191014075136.GE2654@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <aaed7862-49bb-e368-3e7b-5cc2c3d915b1@web.de>
In-Reply-To: <aaed7862-49bb-e368-3e7b-5cc2c3d915b1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 22-09-19, 12:09, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Sep 2019 11:36:18 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.

Applied, thanks

-- 
~Vinod
