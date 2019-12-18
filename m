From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 18 Dec 2019 17:55:56 +0000
Subject: Re: [PATCH] ath11k: checking for NULL vs IS_ERR()
Message-Id: <20191218175556.7F45EC447A4@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213105127.kijiazxwtghmubyk@kili.mountain>
In-Reply-To: <20191213105127.kijiazxwtghmubyk@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>, Muna Sinada <msinada@codeaurora.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>, Miles Hu <milehu@codeaurora.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The ath11k_ce_alloc_ring() function returns error pointers on error, not
> NULL.  The rest of the driver assumes that "pipe->src_ring" is either
> valid or NULL so this patch introduces a temporary varaible to avoid
> leaving it as an error pointer.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

c76fa846b0e1 ath11k: checking for NULL vs IS_ERR()

-- 
https://patchwork.kernel.org/patch/11290421/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
