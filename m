From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 27 Apr 2018 11:32:20 +0000
Subject: Re: [PATCH] rsi: fix a bug in rsi_hal_key_config()
Message-Id: <87o9i46g1n.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180427112130.GA27655@mwanda>
In-Reply-To: <20180427112130.GA27655@mwanda> (Dan Carpenter's message of "Fri,
        27 Apr 2018 14:21:30 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Prameela Rani Garnepudi <prameela.j04cs@gmail.com>, Amitkumar Karwar <amit.karwar@redpinesignals.com>, Karun Eagalapati <karun256@gmail.com>, Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> Smatch complains that the end of this function is dead code.  I'm pretty
> sure that this return needs to be changed to only return on error.
>
> Fixes: 4fd6c4762f37 ("rsi: roaming enhancements")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/net/wireless/rsi/rsi_91x_mac80211.c b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
> index 766d874cc6e2..80e7f4f4f188 100644
> --- a/drivers/net/wireless/rsi/rsi_91x_mac80211.c
> +++ b/drivers/net/wireless/rsi/rsi_91x_mac80211.c
> @@ -911,14 +911,14 @@ static int rsi_hal_key_config(struct ieee80211_hw *hw,
>  		}
>  	}
>  
> -	return rsi_hal_load_key(adapter->priv,
> -				key->key,
> -				key->keylen,
> -				key_type,
> -				key->keyidx,
> -				key->cipher,
> -				sta_id,
> -				vif);
> +	status = rsi_hal_load_key(adapter->priv,
> +				  key->key,
> +				  key->keylen,
> +				  key_type,
> +				  key->keyidx,
> +				  key->cipher,
> +				  sta_id,
> +				  vif);

Gustavo submitted an identical patch also for this one :)

https://patchwork.kernel.org/patch/10365997/

-- 
Kalle Valo
