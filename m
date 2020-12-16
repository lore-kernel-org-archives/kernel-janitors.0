From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 16 Dec 2020 09:06:03 +0000
Subject: Re: [PATCH 1/2] ath11k: Fix error code in ath11k_core_suspend()
Message-Id: <87h7omxgqs.fsf@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9nF17L2/EKOSbn/@mwanda>
In-Reply-To: <X9nF17L2/EKOSbn/@mwanda> (Dan Carpenter's message of "Wed, 16
 Dec 2020 11:31:19 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, Carl Huang <cjhuang@codeaurora.org>, kernel-janitors@vger.kernel.org, ath11k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The "if (!ret)" condition is inverted and it should be "if (ret)".  It
> means that we return success when we had intended to return an error
> code.
>
> Fixes: d1b0c33850d2 ("ath11k: implement suspend for QCA6390 PCI devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index b97c38b9a270..350b7913622c 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -185,7 +185,7 @@ int ath11k_core_suspend(struct ath11k_base *ab)
>  	ath11k_hif_ce_irq_disable(ab);
>  
>  	ret = ath11k_hif_suspend(ab);
> -	if (!ret) {
> +	if (ret) {
>  		ath11k_warn(ab, "failed to suspend hif: %d\n", ret);
>  		return ret;
>  	}

I suspect I created these bugs while cleaning up the patches. But I
don't get how I missed them in testing, that's a mystery to me.

Anyway, I'll queue these two to v5.11.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
