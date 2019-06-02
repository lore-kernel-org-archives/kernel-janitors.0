From: Ganapathi Bhat <gbhat@marvell.com>
Date: Sun, 02 Jun 2019 01:56:44 +0000
Subject: RE: [EXT] Re: [PATCH] mwifiex: check for null return from skb_copy
Message-Id: <BYAPR18MB26301A09FB55C44949AD8E30A01B0@BYAPR18MB2630.namprd18.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190413161438.6376-1-colin.king@canonical.com>
 <20190413192729.GL6095@kadam>
 <MN2PR18MB2637DAA4852542EDA2BBC01DA01A0@MN2PR18MB2637.namprd18.prod.outlook.com>
 <20190601210858.GG31203@kadam>
In-Reply-To: <20190601210858.GG31203@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Colin King <colin.king@canonical.com>, Amitkumar Karwar <amitkarwar@gmail.com>, Nishant Sarmukadam <nishants@marvell.com>, Xinming Hu <huxinming820@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Dan,

> > > >  	if (is_multicast_ether_addr(ra)) {
> > > >  		skb_uap = skb_copy(skb, GFP_ATOMIC);
> > > > +		if (!skb_uap)
> > > > +			return -ENOMEM;
> > >
> > > I think we would want to free dev_kfree_skb_any(skb) before returning.
> > I think if the pointer is NULL, no need to free it;
> 
> You're misreading skb vs skb_uap.  "skb_uap" is NULL but "skb" is non-NULL
> and I'm pretty sure we should free it.

Oh, right. I missed it; Yes you are correct.

Regards,
Ganapathi
