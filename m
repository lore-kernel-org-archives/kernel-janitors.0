From: Joe Perches <joe@perches.com>
Date: Sat, 10 Mar 2018 18:41:57 +0000
Subject: Re: [PATCH 1/2] net/usb/ax88179_178a: Use common code in ax88179_chk_eee()
Message-Id: <1520707317.5345.15.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a7fff45f-4426-ec33-8b8d-caf1e3a9f0be@users.sourceforge.net>
In-Reply-To: <a7fff45f-4426-ec33-8b8d-caf1e3a9f0be@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "Andrew F. Davis" <afd@ti.com>, =?ISO-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, "David S. Miller" <davem@davemloft.net>, Philippe Reynes <tremyfr@gmail.com>, Yuval Shaia <yuval.shaia@oracle.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, 2018-03-10 at 19:24 +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 10 Mar 2018 18:22:43 +0100
> 
> Adjust a jump target so that a bit of common code can be better reused
> at the end of this function.

Please stop mindlessly sending patching Markus.

How about looking at the code being modified and
thinking about what it does?

Try unindenting the block by reversing the first test
and using the same goto set_inactive.

Look at the last & tests
+		if (!(lp & adv & supported))
and see if it should use && or be more simple to read
by using
	if (!condition || !

> ---
>  drivers/net/usb/ax88179_178a.c | 34 +++++++++++-----------------------
>  1 file changed, 11 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
> index f32261ecd215..e4b0baa98e9a 100644
> --- a/drivers/net/usb/ax88179_178a.c
> +++ b/drivers/net/usb/ax88179_178a.c
> @@ -689,49 +689,37 @@ static int ax88179_chk_eee(struct usbnet *dev)
>  		eee_cap = ax88179_phy_read_mmd_indirect(dev,
>  							MDIO_PCS_EEE_ABLE,
>  							MDIO_MMD_PCS);
> -		if (eee_cap < 0) {
> -			priv->eee_active = 0;
> -			return false;
> -		}
> +		if (eee_cap < 0)
> +			goto set_inactive;
>  
>  		cap = mmd_eee_cap_to_ethtool_sup_t(eee_cap);
> -		if (!cap) {
> -			priv->eee_active = 0;
> -			return false;
> -		}
> +		if (!cap)
> +			goto set_inactive;
>  
>  		eee_lp = ax88179_phy_read_mmd_indirect(dev,
>  						       MDIO_AN_EEE_LPABLE,
>  						       MDIO_MMD_AN);
> -		if (eee_lp < 0) {
> -			priv->eee_active = 0;
> -			return false;
> -		}
> +		if (eee_lp < 0)
> +			goto set_inactive;
>  
>  		eee_adv = ax88179_phy_read_mmd_indirect(dev,
>  							MDIO_AN_EEE_ADV,
>  							MDIO_MMD_AN);
> -
> -		if (eee_adv < 0) {
> -			priv->eee_active = 0;
> -			return false;
> -		}
> +		if (eee_adv < 0)
> +			goto set_inactive;
>  
>  		adv = mmd_eee_adv_to_ethtool_adv_t(eee_adv);
>  		lp = mmd_eee_adv_to_ethtool_adv_t(eee_lp);
>  		supported = (ecmd.speed = SPEED_1000) ?
>  			     SUPPORTED_1000baseT_Full :
>  			     SUPPORTED_100baseT_Full;
> -
> -		if (!(lp & adv & supported)) {
> -			priv->eee_active = 0;
> -			return false;
> -		}
> +		if (!(lp & adv & supported))
> +			goto set_inactive;
>  
>  		priv->eee_active = 1;
>  		return true;
>  	}
> -
> +set_inactive:
>  	priv->eee_active = 0;
>  	return false;
>  }
