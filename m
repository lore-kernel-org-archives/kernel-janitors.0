From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 27 Apr 2020 09:38:35 +0000
Subject: Re: [PATCH net-next] ath11k: use GFP_ATOMIC under spin lock
Message-Id: <877dy1gtes.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427092417.56236-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427092417.56236-1-weiyongjun1@huawei.com> (Wei Yongjun's
 message of "Mon, 27 Apr 2020 09:24:17 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, dri-devel@lists.freedesktop.org, ath11k@lists.infradead.org, linaro-mm-sig@lists.linaro.org, Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org

Wei Yongjun <weiyongjun1@huawei.com> writes:

> A spin lock is taken here so we should use GFP_ATOMIC.
>
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Do note that ath11k patches go to my ath.git tree, not net-next. But no
need to resend because of this.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
