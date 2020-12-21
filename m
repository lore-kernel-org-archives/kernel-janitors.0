From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 21 Dec 2020 14:34:30 +0000
Subject: Re: [PATCH] dmaengine: mediatek: mtk-hsdma: Fix a resource leak in the error handling path of the pr
Message-Id: <20201221142230.GD3323@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201219124718.182664-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201219124718.182664-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: sean.wang@mediatek.com, dan.j.williams@intel.com, matthias.bgg@gmail.com, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 19-12-20, 13:47, Christophe JAILLET wrote:
> 'mtk_hsdma_hw_deinit()' should be called in the error handling path of the
> probe function to undo a previous 'mtk_hsdma_hw_init()' call, as already
> done in the remove function.

Applied, thanks

-- 
~Vinod
