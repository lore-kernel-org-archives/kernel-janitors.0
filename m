From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 17 Aug 2020 10:25:38 +0000
Subject: Re: [PATCH] ath10k: Fix the size used in a 'dma_free_coherent()' call in
Message-Id: <20200817102538.B2742C433C6@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200802122227.678637-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200802122227.678637-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, kuba@kernel.org, pillair@codeaurora.org, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> Update the size used in 'dma_free_coherent()' in order to match the one
> used in the corresponding 'dma_alloc_coherent()'.
> 
> Fixes: 1863008369ae ("ath10k: fix shadow register implementation for WCN3990")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

454530a9950b ath10k: Fix the size used in a 'dma_free_coherent()' call in an error handling path

-- 
https://patchwork.kernel.org/patch/11696383/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
