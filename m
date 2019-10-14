From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 14 Oct 2019 07:53:41 +0000
Subject: Re: [PATCH] dmaengine: owl: Use devm_platform_ioremap_resource() in owl_dma_probe()
Message-Id: <20191014075242.GH2654@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d36b6a6c-2e3d-8d68-6ddc-969a377ca3b2@web.de>
In-Reply-To: <d36b6a6c-2e3d-8d68-6ddc-969a377ca3b2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Dan Williams <dan.j.williams@intel.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 22-09-19, 13:30, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Sep 2019 13:23:54 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.

Applied, thanks

-- 
~Vinod
