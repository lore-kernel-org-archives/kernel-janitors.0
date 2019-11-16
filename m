From: Joe Perches <joe@perches.com>
Date: Sat, 16 Nov 2019 06:45:29 +0000
Subject: Re: [PATCH] staging: rtl8192u: fix indentation issue
Message-Id: <3fd995ebb9ec87b202942fa1f000755c2d3cc4cb.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191114095430.132120-1-colin.king@canonical.com>
In-Reply-To: <20191114095430.132120-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2019-11-14 at 09:54 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a block of statements that are indented
> too deeply, remove the extraneous tabs.
[]
> diff --git a/drivers/staging/rtl8192u/r819xU_cmdpkt.c b/drivers/staging/rtl8192u/r819xU_cmdpkt.c
[]
> @@ -169,19 +169,20 @@ static void cmdpkt_beacontimerinterrupt_819xusb(struct net_device *dev)
>  {
>  	struct r8192_priv *priv = ieee80211_priv(dev);
>  	u16 tx_rate;
> -		/* 87B have to S/W beacon for DTM encryption_cmn. */
> -		if (priv->ieee80211->current_network.mode = IEEE_A ||
> -		    priv->ieee80211->current_network.mode = IEEE_N_5G ||
> -		    (priv->ieee80211->current_network.mode = IEEE_N_24G &&
> -		     (!priv->ieee80211->pHTInfo->bCurSuppCCK))) {
> -			tx_rate = 60;
> -			DMESG("send beacon frame  tx rate is 6Mbpm\n");
> -		} else {
> -			tx_rate = 10;
> -			DMESG("send beacon frame  tx rate is 1Mbpm\n");
> -		}
>  
> -		rtl819xusb_beacon_tx(dev, tx_rate); /* HW Beacon */
> +	/* 87B have to S/W beacon for DTM encryption_cmn. */
> +	if (priv->ieee80211->current_network.mode = IEEE_A ||
> +	    priv->ieee80211->current_network.mode = IEEE_N_5G ||
> +	    (priv->ieee80211->current_network.mode = IEEE_N_24G &&
> +	     (!priv->ieee80211->pHTInfo->bCurSuppCCK))) {
> +		tx_rate = 60;
> +		DMESG("send beacon frame  tx rate is 6Mbpm\n");
> +	} else {
> +		tx_rate = 10;
> +		DMESG("send beacon frame  tx rate is 1Mbpm\n");
> +	}
> +
> +	rtl819xusb_beacon_tx(dev, tx_rate); /* HW Beacon */

This function might as well be deleted instead as
rtl819xusb_beacon_tx is a noop function in
drivers/staging/rtl8192u/r8192U_core.c

void rtl819xusb_beacon_tx(struct net_device *dev, u16  tx_rate)
{
}
