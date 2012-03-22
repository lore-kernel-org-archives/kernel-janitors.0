From: "Jack Wang" <jack_wang@usish.com>
Date: Thu, 22 Mar 2012 01:49:05 +0000
Subject: Re: [PATCH] [SCSI] pm8001: Add error handler in pm8001_init_sas_add() if kzalloc fails.
Message-Id: <93577C2F32CB4495B816D76D6362883C@usish.com.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1332319094-11864-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1332319094-11864-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'santosh nayak' <santoshprasadnayak@gmail.com>
Cc: mark_salyzyn@xyratex.com, lindar_liu@usish.com, JBottomley@parallels.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

Based on all comment from others, I ACK this patch.
Thanks.

Acked-by: Jack Wang <jack_wang@usish.com>

> 
> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> We need to add error handler if kzalloc fails to allocate and initialize.
> Otherwise it may lead to Null derefernce error in
> 'pm8001_chip_get_nvmd_req()'.
> 
> Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
> ---
>  drivers/scsi/pm8001/pm8001_init.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/scsi/pm8001/pm8001_init.c
> b/drivers/scsi/pm8001/pm8001_init.c
> index 36efaa7..fdce28e 100644
> --- a/drivers/scsi/pm8001/pm8001_init.c
> +++ b/drivers/scsi/pm8001/pm8001_init.c
> @@ -519,6 +519,10 @@ static void pm8001_init_sas_add(struct
pm8001_hba_info
> *pm8001_ha)
>  	payload.minor_function = 0;
>  	payload.length = 128;
>  	payload.func_specific = kzalloc(128, GFP_KERNEL);
> +	if (unlikely(!payload.func_specific)) {
> +		printk(KERN_ERR "%s: failed to alloc memory\n", __func__);
> +		return;
> +	}
>  	PM8001_CHIP_DISP->get_nvmd_req(pm8001_ha, &payload);
>  	wait_for_completion(&completion);
>  	for (i = 0; i < pm8001_ha->chip->n_phy; i++) {
> --
> 1.7.4.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-scsi" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

