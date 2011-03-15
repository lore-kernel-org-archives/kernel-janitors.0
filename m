From: "Guy, Wey-Yi" <wey-yi.w.guy@intel.com>
Date: Tue, 15 Mar 2011 09:04:17 +0000
Subject: Re: [patch 1/2] iwlwifi: missing unlock on error path
Message-Id: <1300179857.5082.213.camel@wwguy-huron>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110315070158.GQ2008@bicker>
In-Reply-To: <20110315070158.GQ2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "Berg, Johannes" <johannes.berg@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Tue, 2011-03-15 at 00:01 -0700, Dan Carpenter wrote:
> We should unlock here instead of returning -EINVAL directly.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> Acked-by: Wey-Yi Guy <wey-yi.w.guy@intel.com>

> diff --git a/drivers/net/wireless/iwlwifi/iwl-agn.c b/drivers/net/wireless/iwlwifi/iwl-agn.c
> index 581dc9f..321b18b 100644
> --- a/drivers/net/wireless/iwlwifi/iwl-agn.c
> +++ b/drivers/net/wireless/iwlwifi/iwl-agn.c
> @@ -3009,14 +3009,17 @@ static int iwl_mac_offchannel_tx_cancel_wait(struct ieee80211_hw *hw)
>  
>  	mutex_lock(&priv->mutex);
>  
> -	if (!priv->_agn.offchan_tx_skb)
> -		return -EINVAL;
> +	if (!priv->_agn.offchan_tx_skb) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
>  
>  	priv->_agn.offchan_tx_skb = NULL;
>  
>  	ret = iwl_scan_cancel_timeout(priv, 200);
>  	if (ret)
>  		ret = -EIO;
> +unlock:
>  	mutex_unlock(&priv->mutex);
>  
>  	return ret;
great catch

Thanks
Wey

