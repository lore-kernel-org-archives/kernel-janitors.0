From: Joe Perches <joe@perches.com>
Date: Thu, 17 Jan 2019 19:59:42 +0000
Subject: Re: [PATCH] rtlwifi: rtl818x: fix indentation issue
Message-Id: <23fbcc92e52dea477ea16f02cced239f4afcba9a.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190117152859.6873-1-colin.king@canonical.com>
         <e68c7ae7b0a863742df0f4457368a3a529ed47e5.camel@perches.com>
         <284e7ef0-5820-021b-7b0c-2fc754440fe8@lwfinger.net>
In-Reply-To: <284e7ef0-5820-021b-7b0c-2fc754440fe8@lwfinger.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>, Colin King <colin.king@canonical.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>

On Thu, 2019-01-17 at 13:33 -0600, Larry Finger wrote:
> On 1/17/19 1:29 PM, Joe Perches wrote:
> > On Thu, 2019-01-17 at 15:28 +0000, Colin King wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > > 
> > > There is a statement that is indented too deeply. Fix this.
> > 
> > Thanks.
> > 
> > > diff --git a/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c b/drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c
> > []
> > > @@ -803,7 +803,7 @@ static void rtl8180_config_cardbus(struct ieee80211_hw *dev)
> > >   		rtl818x_iowrite16(priv, FEMR_SE, 0xffff);
> > >   	} else {
> > >   		reg16 = rtl818x_ioread16(priv, &priv->map->FEMR);
> > > -			reg16 |= (1 << 15) | (1 << 14) | (1 << 4);
> > > +		reg16 |= (1 << 15) | (1 << 14) | (1 << 4);
> > >   		rtl818x_iowrite16(priv, &priv->map->FEMR, reg16);
> > >   	}
> > 
> > trivia:
> > 
> > It sure looks as if there could be some rather useful
> > conversions of magic bits to constants one day.
> 
> How much work is warranted for this driver for a device that is not likely in 
> use anywhere in the wild?

Hey Larry.

Perhaps none.  The part is from 2002 after all.

But if it really is unused, it might be better to remove
the whole driver and see if anyone notices.

> In addition, I'm not sure anyone knows what those bits 
> actually do, I certainly do not have a product sheet for that one.

It does look like this document
http://realtek.info/pdf/rtl8180.pdf
has a description on page 36.

6.33 FEMR: Function Event Mask Register
