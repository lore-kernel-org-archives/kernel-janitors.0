From: Larry Finger <Larry.Finger@lwfinger.net>
Date: Mon, 15 Feb 2021 15:58:41 +0000
Subject: Re: [PATCH] b43: N-PHY: Fix the update of coef for the PHY revision >= 3case
Message-Id: <a1f578d8-bfaf-ec92-7874-84a586385495@lwfinger.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210215120532.76889-1-colin.king@canonical.com>
In-Reply-To: <20210215120532.76889-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, "John W . Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, b43-dev@lists.infradead.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2/15/21 6:05 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The documentation for the PHY update [1] states:
> 
> Loop 4 times with index i
> 
>      If PHY Revision >= 3
>          Copy table[i] to coef[i]
>      Otherwise
>          Set coef[i] to 0
> 
> the copy of the table to coef is currently implemented the wrong way
> around, table is being updated from uninitialized values in coeff.
> Fix this by swapping the assignment around.
> 
> [1] https://bcm-v4.sipsolutions.net/802.11/PHY/N/RestoreCal/
> 
> Fixes: 2f258b74d13c ("b43: N-PHY: implement restoring general configuration")
> Addresses-Coverity: ("Uninitialized scalar variable")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/net/wireless/broadcom/b43/phy_n.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
> index b669dff24b6e..665b737fbb0d 100644
> --- a/drivers/net/wireless/broadcom/b43/phy_n.c
> +++ b/drivers/net/wireless/broadcom/b43/phy_n.c
> @@ -5311,7 +5311,7 @@ static void b43_nphy_restore_cal(struct b43_wldev *dev)
>   
>   	for (i = 0; i < 4; i++) {
>   		if (dev->phy.rev >= 3)
> -			table[i] = coef[i];
> +			coef[i] = table[i];
>   		else
>   			coef[i] = 0;
>   	}
> 

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Good catch, thanks.

Larry
