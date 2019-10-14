From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 14 Oct 2019 07:53:40 +0000
Subject: Re: [PATCH] dmaengine: mediatek: Use devm_platform_ioremap_resource() in mtk_cqdma_probe()
Message-Id: <20191014075209.GF2654@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c7e3bbae-44fa-9019-18ee-c6cdfd7c2a14@web.de>
In-Reply-To: <c7e3bbae-44fa-9019-18ee-c6cdfd7c2a14@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Shun-Chih Yu <shun-chih.yu@mediatek.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 22-09-19, 13:00, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Sep 2019 12:52:25 +0200
> 
> Simplify this function implementation a bit by using
> a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.

Applied, thanks

-- 
~Vinod
