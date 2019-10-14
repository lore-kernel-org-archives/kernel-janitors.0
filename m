From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 14 Oct 2019 07:53:41 +0000
Subject: Re: [PATCH] dmaengine: mediatek: Use devm_platform_ioremap_resource() in mtk_uart_apdma_probe()
Message-Id: <20191014075228.GG2654@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <366e776c-8760-eeb7-c248-7380c9f4fd34@web.de>
In-Reply-To: <366e776c-8760-eeb7-c248-7380c9f4fd34@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>, Long Cheng <long.cheng@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 22-09-19, 13:14, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Sep 2019 13:07:41 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.

Applied, thanks

-- 
~Vinod
