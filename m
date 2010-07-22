From: Dan Williams <dcbw@redhat.com>
Date: Thu, 22 Jul 2010 20:23:43 +0000
Subject: Re: [patch -next] libertas: precedence bug
Message-Id: <1279837494.4829.18.camel@dcbw.foobar.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100722122102.GH17585@bicker>
In-Reply-To: <20100722122102.GH17585@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Holger Schurig <holgerschurig@gmail.com>, "David S. Miller" <davem@davemloft.net>, Amitkumar Karwar <akarwar@marvell.com>, Stephen Hemminger <shemminger@vyatta.com>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2010-07-22 at 14:21 +0200, Dan Carpenter wrote:
> Negate has precedence over comparison so the original test was always
> false.  (Neither 0 nor 1 are equal to NL80211_IFTYPE_MONITOR).
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Dan Williams <dcbw@redhat.com>

> diff --git a/drivers/net/wireless/libertas/tx.c b/drivers/net/wireless/libertas/tx.c
> index 411a3bb..8000ca6 100644
> --- a/drivers/net/wireless/libertas/tx.c
> +++ b/drivers/net/wireless/libertas/tx.c
> @@ -180,7 +180,7 @@ void lbs_send_tx_feedback(struct lbs_private *priv, u32 try_count)
>  {
>  	struct tx_radiotap_hdr *radiotap_hdr;
>  
> -	if (!priv->wdev->iftype = NL80211_IFTYPE_MONITOR ||
> +	if (priv->wdev->iftype != NL80211_IFTYPE_MONITOR ||
>  	    priv->currenttxskb = NULL)
>  		return;
>  
> --
> To unsubscribe from this list: send the line "unsubscribe linux-wireless" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


