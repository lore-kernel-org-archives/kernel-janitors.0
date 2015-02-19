From: David Laight <David.Laight@ACULAB.COM>
Date: Thu, 19 Feb 2015 09:49:00 +0000
Subject: RE: [patch] caif: fix a signedness bug in cfpkt_iterate()
Message-Id: <063D6719AE5E284EB5DD2968C1650D6D1CAE5EE1@AcuExch.aculab.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150219091313.GA29358@mwanda>
In-Reply-To: <20150219091313.GA29358@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <dan.carpenter@oracle.com>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>
Cc: "David S. Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

From:  Dan Carpenter
...
> Also this isn't ever going to be inlined so I removed the "inline".
...
> -inline u16 cfpkt_iterate(struct cfpkt *pkt,
> -			 u16 (*iter_func)(u16, void *, u16),
> -			 u16 data)

static ??

> +int cfpkt_iterate(struct cfpkt *pkt,
> +		  u16 (*iter_func)(u16, void *, u16),
> +		  u16 data)

	David

