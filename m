From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Thu, 04 Jan 2018 17:40:39 +0000
Subject: Re: [PATCH][V2] wcn36xx: fix incorrect assignment to msg_body.min_ch_time
Message-Id: <20180104174039.GL12655@minitux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171229090732.14928-1-colin.king@canonical.com>
In-Reply-To: <20171229090732.14928-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Eugene Krasnikov <k.eugene.e@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri 29 Dec 01:07 PST 2017, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The second assignment to msg_body.min_ch_time is incorrect, it
> should actually be to msg_body.max_ch_time.
> 
> Thanks to Bjorn Andersson for identifying the correct way to fix
> this as my original fix was incorrect.
> 
> Detected by CoverityScan, CID#1463042 ("Unused Value")
> 
> Fixes: 2f3bef4b247e ("wcn36xx: Add hardware scan offload support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks Colin,

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/net/wireless/ath/wcn36xx/smd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireless/ath/wcn36xx/smd.c
> index 2914618a0335..2a4871ca9c72 100644
> --- a/drivers/net/wireless/ath/wcn36xx/smd.c
> +++ b/drivers/net/wireless/ath/wcn36xx/smd.c
> @@ -626,7 +626,7 @@ int wcn36xx_smd_start_hw_scan(struct wcn36xx *wcn, struct ieee80211_vif *vif,
>  
>  	msg_body.scan_type = WCN36XX_HAL_SCAN_TYPE_ACTIVE;
>  	msg_body.min_ch_time = 30;
> -	msg_body.min_ch_time = 100;
> +	msg_body.max_ch_time = 100;
>  	msg_body.scan_hidden = 1;
>  	memcpy(msg_body.mac, vif->addr, ETH_ALEN);
>  	msg_body.p2p_search = vif->p2p;
> -- 
> 2.14.1
> 
