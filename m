From: Ganapathi Bhat <gbhat@marvell.com>
Date: Sat, 01 Jun 2019 17:29:26 +0000
Subject: RE: [EXT] Re: [PATCH] mwifiex: check for null return from skb_copy
Message-Id: <MN2PR18MB2637DAA4852542EDA2BBC01DA01A0@MN2PR18MB2637.namprd18.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190413161438.6376-1-colin.king@canonical.com>
 <20190413192729.GL6095@kadam>
In-Reply-To: <20190413192729.GL6095@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Colin King <colin.king@canonical.com>
Cc: Amitkumar Karwar <amitkarwar@gmail.com>, Nishant Sarmukadam <nishants@marvell.com>, Xinming Hu <huxinming820@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Dan,

> >  	if (is_multicast_ether_addr(ra)) {
> >  		skb_uap = skb_copy(skb, GFP_ATOMIC);
> > +		if (!skb_uap)
> > +			return -ENOMEM;
> 
> I think we would want to free dev_kfree_skb_any(skb) before returning.
I think if the pointer is NULL, no need to free it; 

Regards,
Ganapathi
