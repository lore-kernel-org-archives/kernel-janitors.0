From: Andrew Lunn <andrew@lunn.ch>
Date: Thu, 05 Jul 2018 13:54:00 +0000
Subject: Re: [PATCH] net: ethernet: sun: remove redundant variables adv and lpa
Message-Id: <20180705135400.GG23469@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180705093732.21650-1-colin.king@canonical.com>
In-Reply-To: <20180705093732.21650-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 05, 2018 at 10:37:32AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables adv and lpa are being assigned but are never used hence they
> are redundant and can be removed.
> 
> Cleans up clang warnings:
> warning: variable 'lpa' set but not used [-Wunused-but-set-variable]
> warning: variable 'adv' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/sun/niu.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
> index 88c12474a0c3..2d6b62c6d9ab 100644
> --- a/drivers/net/ethernet/sun/niu.c
> +++ b/drivers/net/ethernet/sun/niu.c
> @@ -1225,17 +1225,13 @@ static int link_status_1g_rgmii(struct niu *np, int *link_up_p)
>  
>  	bmsr = err;
>  	if (bmsr & BMSR_LSTATUS) {
> -		u16 adv, lpa;
> -
>  		err = mii_read(np, np->phy_addr, MII_ADVERTISE);
>  		if (err < 0)
>  			goto out;
> -		adv = err;
>  
>  		err = mii_read(np, np->phy_addr, MII_LPA);
>  		if (err < 0)
>  			goto out;
> -		lpa = err;
>  
>  		err = mii_read(np, np->phy_addr, MII_ESTATUS);
>  		if (err < 0)

What should really happen is something like:

                common_adv = lpa & adv;

                lp->active_speed = SPEED_10;
                lp->active_duplex = DUPLEX_HALF;

                if (common_adv_gb & (LPA_1000FULL | LPA_1000HALF)) {
                        lp->active_speed = SPEED_1000;

                        if (common_adv_gb & LPA_1000FULL)
                                lp->active_duplex = DUPLEX_FULL;
                } else if (common_adv & (LPA_100FULL | LPA_100HALF)) {
                        lp->active_speed = SPEED_100;

                        if (common_adv & LPA_100FULL)
                                lp->active_duplex = DUPLEX_FULL;
                } else
                        if (common_adv & LPA_10FULL)
                                lp->active_duplex = DUPLEX_FULL;

i.e. making use of the results of the autoneg to determine the link
speed and duplex, rather than just assuming it is 1G.

If i turn this into a real patch, does anybody have the hardware to
test it?

      Andrew
