From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 14 Oct 2019 07:53:43 +0000
Subject: Re: [PATCH] dmaengine: at_xdmac: Use devm_platform_ioremap_resource() in at_xdmac_probe()
Message-Id: <20191014075332.GK2654@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <377247f3-b53a-a9d9-66c7-4b8515de3809@web.de>
In-Reply-To: <377247f3-b53a-a9d9-66c7-4b8515de3809@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>

On 22-09-19, 10:48, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Sep 2019 10:37:31 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.

Applied, thanks

-- 
~Vinod
