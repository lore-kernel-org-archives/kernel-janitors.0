From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 28 Apr 2020 09:14:00 +0000
Subject: Re: [PATCH net-next] ath11k: use GFP_ATOMIC under spin lock
Message-Id: <20200428091400.8F890C433CB@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427092417.56236-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427092417.56236-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, kernel-janitors@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> wrote:

> A spin lock is taken here so we should use GFP_ATOMIC.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

69c93f9674c9 ath11k: use GFP_ATOMIC under spin lock

-- 
https://patchwork.kernel.org/patch/11511711/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
