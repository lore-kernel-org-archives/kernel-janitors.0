From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 14 Jun 2018 15:11:07 +0000
Subject: Re: [net-next] ath10k: make some functions static
Message-Id: <20180614151107.CBAC8602D7@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527733994-149212-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1527733994-149212-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "weiyongjun (A)" <weiyongjun1@huawei.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, Govind Singh <govinds@codeaurora.org>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

"weiyongjun \(A\)" <weiyongjun1@huawei.com> wrote:

> Fixes the following sparse warnings:
> 
> drivers/net/wireless/ath/ath10k/snoc.c:823:5: warning:
>  symbol 'ath10k_snoc_get_ce_id_from_irq' was not declared. Should it be static?
> drivers/net/wireless/ath/ath10k/snoc.c:871:6: warning:
>  symbol 'ath10k_snoc_init_napi' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6ee0e175a33d ath10k: make some functions static

-- 
https://patchwork.kernel.org/patch/10440159/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

