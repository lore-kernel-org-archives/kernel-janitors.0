From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 20 Apr 2012 08:37:18 +0000
Subject: Re: [patch 1/2] ath6kl: change || to &&
Message-Id: <4F91203E.9090308@qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120420064328.GC22649@elgon.mountain>
In-Reply-To: <20120420064328.GC22649@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, ath6kl-devel <ath6kl-devel@qualcomm.com>, "Ng, Chilam" <chilamng@qca.qualcomm.com>

On 04/20/2012 09:43 AM, Dan Carpenter wrote:
> The original conditions are always true.  I think && was intended here,
> but I don't have the hardware to test.  Could you take a look?
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/wireless/ath/ath6kl/htc_mbox.c b/drivers/net/wireless/ath/ath6kl/htc_mbox.c
> index 065e615..086a8e1 100644
> --- a/drivers/net/wireless/ath/ath6kl/htc_mbox.c
> +++ b/drivers/net/wireless/ath/ath6kl/htc_mbox.c
> @@ -758,7 +758,7 @@ static void ath6kl_htc_tx_bundle(struct htc_endpoint *endpoint,
>  	u32 txb_mask;
>  	u8 ac = WMM_NUM_AC;
>  
> -	if ((HTC_CTRL_RSVD_SVC != endpoint->svc_id) ||
> +	if ((HTC_CTRL_RSVD_SVC != endpoint->svc_id) &&
>  	    (WMI_CONTROL_SVC != endpoint->svc_id))
>  		ac = target->dev->ar->ep2ac_map[endpoint->eid];
>  
> @@ -866,7 +866,7 @@ static void ath6kl_htc_tx_from_queue(struct htc_target *target,
>  	 */
>  	INIT_LIST_HEAD(&txq);
>  
> -	if ((HTC_CTRL_RSVD_SVC != endpoint->svc_id) ||
> +	if ((HTC_CTRL_RSVD_SVC != endpoint->svc_id) &&
>  	    (WMI_CONTROL_SVC != endpoint->svc_id))
>  		ac = target->dev->ar->ep2ac_map[endpoint->eid];

Dan, that's a good catch. This is coming from Chilam's patch:

https://github.com/kvalo/ath6kl/commit/b29072cc7b0e08ace48ab709c40cf6246fb2e8b0

Chilam, is it safe to take Dan's patch?

Kalle
