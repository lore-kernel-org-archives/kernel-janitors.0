From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 05 Nov 2018 11:11:09 +0000
Subject: Re: [PATCH] ath10k: Fixup extended per sta tx statistics
Message-Id: <20181105111109.231AA6053D@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181018073619.c2cxj74enkramhjr@kili.mountain>
In-Reply-To: <20181018073619.c2cxj74enkramhjr@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Anilkumar Kolli <akolli@codeaurora.org>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> I had a couple concerns with this code.  First, we definitely need to
> set the error code if the kzalloc() fails.  Secondly, I was worried that
> if we didn't set "arsta->tx_stats" to NULL after freeing it, then it
> looks to me like it might lead to a use after free.  I can't test that,
> but it's harmless to set it to NULL so I did.
> 
> Fixes: a904417fc876 ("ath10k: add extended per sta tx statistics support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

539b44e70c5b ath10k: fixup extended per sta tx statistics

-- 
https://patchwork.kernel.org/patch/10646825/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
