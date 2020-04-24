From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Apr 2020 12:59:45 +0000
Subject: Re: [PATCH v2] staging: wfx: cleanup long lines in data_tx.c
Message-Id: <20200424125945.GP2659@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200424124105.GA18534@blackclown>
In-Reply-To: <20200424124105.GA18534@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suraj Upadhyay <usuraj35@gmail.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 24, 2020 at 06:11:32PM +0530, Suraj Upadhyay wrote:
>  static int wfx_get_hw_rate(struct wfx_dev *wdev,
>  			   const struct ieee80211_tx_rate *rate)
>  {
> +	struct ieee80211_rate tmp;
>  	if (rate->idx < 0)
>  		return -1;
>  	if (rate->flags & IEEE80211_TX_RC_MCS) {
> @@ -31,7 +32,8 @@ static int wfx_get_hw_rate(struct wfx_dev *wdev,
>  	}
>  	// WFx only support 2GHz, else band information should be retrieved
>  	// from ieee80211_tx_info
> -	return wdev->hw->wiphy->bands[NL80211_BAND_2GHZ]->bitrates[rate->idx].hw_value;
> +	tmp = wdev->hw->wiphy->bands[NL80211_BAND_2GHZ]->bitrates[rate->idx];
> +	return tmp.hw_value;

The original was better.  Just leave this one as-is.  It's okay to go
over 80 characters if there isn't a better option.

>  }
>  
>  /* TX policy cache implementation */
> @@ -159,14 +161,16 @@ static int wfx_tx_policy_upload(struct wfx_vif *wvif)
>  {
>  	struct tx_policy *policies = wvif->tx_policy_cache.cache;
>  	u8 tmp_rates[12];
> -	int i;
> +	int i, tmp;
>  
>  	do {
>  		spin_lock_bh(&wvif->tx_policy_cache.lock);
> -		for (i = 0; i < HIF_TX_RETRY_POLICY_MAX; ++i)
> -			if (!policies[i].uploaded &&
> -			    memzcmp(policies[i].rates, sizeof(policies[i].rates)))
> +		for (i = 0; i < HIF_TX_RETRY_POLICY_MAX; ++i) {
> +			tmp = memzcmp(policies[i].rates,
> +				      sizeof(policies[i].rates));
> +			if (!policies[i].uploaded && tmp)
>  				break;

The original was better.  I was hoping you would do:

			struct tx_policy *policy = &policies[i];

			if (!policy->uploaded &&
			    memzcmp(policy->rates, sizeof(policies->rates))
				break;


> +		}
>  		if (i < HIF_TX_RETRY_POLICY_MAX) {
>  			policies[i].uploaded = true;
>  			memcpy(tmp_rates, policies[i].rates, sizeof(tmp_rates));

regards,
dan carpenter
