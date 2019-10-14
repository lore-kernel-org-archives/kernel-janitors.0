From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 14 Oct 2019 07:53:42 +0000
Subject: Re: [PATCH] dmaengine: jz4780: Use devm_platform_ioremap_resource() in jz4780_dma_probe()
Message-Id: <20191014075257.GI2654@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5dd19f28-349a-4957-ea3a-6aebbd7c97e2@web.de>
In-Reply-To: <5dd19f28-349a-4957-ea3a-6aebbd7c97e2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Paul Cercueil <paul@crapouillou.net>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Alex Smith <alex.smith@imgtec.com>

On 22-09-19, 11:25, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Sep 2019 11:18:27 +0200
> 
> Simplify this function implementation a bit by using
> a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.

Applied, thanks

-- 
~Vinod
