From: Jakub Kicinski <kubakici@wp.pl>
Date: Fri, 20 Sep 2019 18:45:15 +0000
Subject: Re: [PATCH] mt7601u: phy: simplify zero check on val
Message-Id: <20190920114515.36e1ed90@cakuba.netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190920125414.15507-1-colin.king@canonical.com>
 <20190920135817.GC6456@localhost.localdomain>
In-Reply-To: <20190920135817.GC6456@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On Fri, 20 Sep 2019 15:58:17 +0200, Lorenzo Bianconi wrote:
> I think this is not correct since (not considering the cast) we should break
> from the loop if val != 0 and val != 0xff, so the right approach I guess is:
> 
> diff --git a/drivers/net/wireless/mediatek/mt7601u/phy.c b/drivers/net/wireless/mediatek/mt7601u/phy.c
> index 06f5702ab4bd..d863ab4a66c9 100644
> --- a/drivers/net/wireless/mediatek/mt7601u/phy.c
> +++ b/drivers/net/wireless/mediatek/mt7601u/phy.c
> @@ -213,7 +213,7 @@ int mt7601u_wait_bbp_ready(struct mt7601u_dev *dev)
>  
>  	do {
>  		val = mt7601u_bbp_rr(dev, MT_BBP_REG_VERSION);
> -		if (val && ~val)
> +		if (val && val != 0xff)
>  			break;
>  	} while (--i);

Yup, feel free to add my ack if you post this, Lorenzo.
