From: Joe Perches <joe@perches.com>
Date: Thu, 17 Jan 2019 19:29:46 +0000
Subject: Re: [PATCH] rtlwifi: rtl818x: fix indentation issue
Message-Id: <e68c7ae7b0a863742df0f4457368a3a529ed47e5.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190117152859.6873-1-colin.king@canonical.com>
In-Reply-To: <20190117152859.6873-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>, Larry Finger <Larry.Finger@lwfinger.net>

On Thu, 2019-01-17 at 15:28 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a statement that is indented too deeply. Fix this.

Thanks.

> diff --git a/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c b/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c
[]
> @@ -803,7 +803,7 @@ static void rtl8180_config_cardbus(struct ieee80211_hw *dev)
>  		rtl818x_iowrite16(priv, FEMR_SE, 0xffff);
>  	} else {
>  		reg16 = rtl818x_ioread16(priv, &priv->map->FEMR);
> -			reg16 |= (1 << 15) | (1 << 14) | (1 << 4);
> +		reg16 |= (1 << 15) | (1 << 14) | (1 << 4);
>  		rtl818x_iowrite16(priv, &priv->map->FEMR, reg16);
>  	}

trivia:

It sure looks as if there could be some rather useful
conversions of magic bits to constants one day.
