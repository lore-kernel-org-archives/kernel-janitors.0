From: Robin Murphy <robin.murphy@arm.com>
Date: Fri, 20 Sep 2019 13:25:21 +0000
Subject: Re: [PATCH] mt7601u: phy: simplify zero check on val
Message-Id: <2f9ab78a-ea76-0b60-375a-9a22cd2ff0f5@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190920125414.15507-1-colin.king@canonical.com>
In-Reply-To: <20190920125414.15507-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jakub Kicinski <kubakici@wp.pl>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 20/09/2019 13:54, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the zero check on val to break out of a loop
> is a little obscure.  Replace the val is zero and break check
> with a loop while value is non-zero.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/net/wireless/mediatek/mt7601u/phy.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt7601u/phy.c b/drivers/net/wireless/mediatek/mt7601u/phy.c
> index 06f5702ab4bd..4e0e473caae1 100644
> --- a/drivers/net/wireless/mediatek/mt7601u/phy.c
> +++ b/drivers/net/wireless/mediatek/mt7601u/phy.c
> @@ -213,9 +213,7 @@ int mt7601u_wait_bbp_ready(struct mt7601u_dev *dev)
>   
>   	do {
>   		val = mt7601u_bbp_rr(dev, MT_BBP_REG_VERSION);
> -		if (val && ~val)
> -			break;

AFAICS, this effectively implements "while (val = 0 || val = 0xff)", 
which is not at all equivalent to "while(val)"... :/

Robin.

> -	} while (--i);
> +	} while (val && --i);
>   
>   	if (!i) {
>   		dev_err(dev->dev, "Error: BBP is not ready\n");
> 
