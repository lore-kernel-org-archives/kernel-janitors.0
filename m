From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 18 Dec 2019 17:54:53 +0000
Subject: Re: [PATCH] ath11k: delete a stray unlock in ath11k_dbg_htt_stats_req()
Message-Id: <20191218175453.3AD92C43383@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213104754.2lwrq2qqokycjjbm@kili.mountain>
In-Reply-To: <20191213104754.2lwrq2qqokycjjbm@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Anilkumar Kolli <akolli@codeaurora.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Miles Hu <milehu@codeaurora.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The callers unlock this lock so this error path has a double unlock.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

cd21c827a155 ath11k: delete a stray unlock in ath11k_dbg_htt_stats_req()

-- 
https://patchwork.kernel.org/patch/11290409/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
