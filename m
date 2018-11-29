From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 29 Nov 2018 13:51:24 +0000
Subject: Re: [PATCH] ath10k: remove an unnecessary NULL check
Message-Id: <87sgzk56w3.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181129103214.5tudci6izlfaasqx@kili.mountain>
In-Reply-To: <20181129103214.5tudci6izlfaasqx@kili.mountain> (Dan Carpenter's
 message of "Thu, 29 Nov 2018 13:32:14 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, Rakesh Pillai <pillair@codeaurora.org>, ath10k@lists.infradead.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The "survey" pointer is the address of an array element.  We know that
> it can't be NULL so this check can be removed.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index 659513bf4ddc..6a04727b63ce 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -2578,7 +2578,7 @@ static void ath10k_wmi_event_chan_info_unpaired(struct ath10k *ar,
>  
>  	survey = &ar->survey[idx];
>  
> -	if (!params->mac_clk_mhz || !survey)
> +	if (!params->mac_clk_mhz)
>  		return;

Can you please CC linux-wireless so that patchwork sees this?

-- 
Kalle Valo
