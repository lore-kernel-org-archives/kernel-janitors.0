From: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Date: Sat, 21 Nov 2015 18:24:49 +0000
Subject: Re: [patch] iwlwifi: mvm: rs: fix a warning message
Message-Id: <0BA3FCBA62E2DC44AF3030971E174FB32E8F6961@hasmsx107.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151121103338.GE7002@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Berg, Johannes" <johannes.berg@intel.com>
Cc: linuxwifi <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, Eyal Shapira <eyal@wizery.com>, "Coelho, Luciano" <luciano.coelho@intel.com>, "Kaufman, Liad" <liad.kaufman@intel.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



On 11/21/2015 12:33 PM, Dan Carpenter wrote:
> WARN_ON_ONCE() doesn't take a message, it only takes a condition.  I
> have changed this to WARN(1, ...).
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/net/wireless/iwlwifi/mvm/rs.c b/drivers/net/wireless/iwlwifi/mvm/rs.c
> index d1ad103..58d7bee 100644
> --- a/drivers/net/wireless/iwlwifi/mvm/rs.c
> +++ b/drivers/net/wireless/iwlwifi/mvm/rs.c
> @@ -1827,7 +1827,7 @@ static int rs_switch_to_column(struct iwl_mvm *mvm,
>  		rate->type = lq_sta->is_vht ? LQ_VHT_MIMO2 : LQ_HT_MIMO2;
>  		rate_mask = lq_sta->active_mimo2_rate;
>  	} else {
> -		WARN_ON_ONCE("Bad column mode");
> +		WARN_ONCE(1, "Bad column mode");
>  	}
>  
>  	if (column->mode != RS_LEGACY) {
>
Ouch - thanks. Clearly, this one doesn't trigger very often :)
