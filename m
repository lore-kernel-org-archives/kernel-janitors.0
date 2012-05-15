From: "Arend van Spriel" <arend@broadcom.com>
Date: Tue, 15 May 2012 14:24:20 +0000
Subject: Re: [patch] brcm80211: remove an unneeded NULL check
Message-Id: <4FB26714.6020008@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120514205729.GD20836@elgon.mountain>
In-Reply-To: <20120514205729.GD20836@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brett Rudley <brudley@broadcom.com>, Roland Vossen <rvossen@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/14/2012 10:57 PM, Dan Carpenter wrote:
> This code causes a static checker warning because "pi" gets dereferenced
> before it is checked.  The dereference is inside the write_phy_reg()
> function which is called from wlc_phy_write_txmacreg_nphy().
> 
> This code is only called from wlc_phy_init_nphy() and "pi" is a
> valid pointer so we can remove the check for NULL.

Acked-by: Arend van Spriel <arend@broadcom.com>

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/wireless/brcm80211/brcmsmac/phy/phy_n.c b/drivers/net/wireless/brcm80211/brcmsmac/phy/phy_n.c
> index 812b6e3..d6380f3 100644
> --- a/drivers/net/wireless/brcm80211/brcmsmac/phy/phy_n.c
> +++ b/drivers/net/wireless/brcm80211/brcmsmac/phy/phy_n.c
> @@ -14358,7 +14358,7 @@ void wlc_phy_nphy_tkip_rifs_war(struct brcms_phy *pi, u8 rifs)
>  
>  	wlc_phy_write_txmacreg_nphy(pi, holdoff, delay);
>  
> -	if (pi && pi->sh && (pi->sh->_rifs_phy != rifs))
> +	if (pi->sh && (pi->sh->_rifs_phy != rifs))
>  		pi->sh->_rifs_phy = rifs;
>  }
>  
> 


