From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 04 May 2020 08:53:36 +0000
Subject: Re: [PATCH net-next] ath11k: fix error return code in ath11k_dp_alloc()
Message-Id: <20200504085336.3D74AC44788@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427104621.23752-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427104621.23752-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: John Crispin <john@phrozen.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Fix to return negative error code -ENOMEM from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Fixes: d0998eb84ed3 ("ath11k: optimise ath11k_dp_tx_completion_handler")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

f76f750aeea4 ath11k: fix error return code in ath11k_dp_alloc()

-- 
https://patchwork.kernel.org/patch/11511849/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
