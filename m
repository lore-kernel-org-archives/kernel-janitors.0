From: Vinod Koul <vkoul@kernel.org>
Date: Tue, 21 May 2019 04:58:56 +0000
Subject: Re: [PATCH] dmaengine: mediatek-cqdma: sleeping in atomic context
Message-Id: <20190521045851.GR15118@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190509100923.GA7024@mwanda>
In-Reply-To: <20190509100923.GA7024@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Shun-Chih Yu <shun-chih.yu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Dan Williams <dan.j.williams@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org

On 09-05-19, 13:09, Dan Carpenter wrote:
> The mtk_cqdma_poll_engine_done() function takes a true/false parameter
> where true means it's called from atomic context.  There are a couple
> places where it was set to false but it's actually in atomic context
> so it should be true.
> 
> All the callers for mtk_cqdma_hard_reset() are holding a spin_lock and
> in mtk_cqdma_free_chan_resources() we take a spin_lock before calling
> the mtk_cqdma_poll_engine_done() function.

Applied, thanks

> 
> Fixes: b1f01e48df5a ("dmaengine: mediatek: Add MediaTek Command-Queue DMA controller for MT6765 SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The "atomic" parameter is always true so the temptation was to just
> remove it entirely.

a patch is welcome :)

-- 
~Vinod
