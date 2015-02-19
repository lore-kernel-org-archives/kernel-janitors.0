From: David Laight <David.Laight@ACULAB.COM>
Date: Thu, 19 Feb 2015 10:06:09 +0000
Subject: RE: [patch] caif: fix a signedness bug in cfpkt_iterate()
Message-Id: <063D6719AE5E284EB5DD2968C1650D6D1CAE5F02@AcuExch.aculab.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150219091313.GA29358@mwanda>
 <063D6719AE5E284EB5DD2968C1650D6D1CAE5EE1@AcuExch.aculab.com>
 <20150219095944.GD25513@mwanda>
In-Reply-To: <20150219095944.GD25513@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <dan.carpenter@oracle.com>
Cc: Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, "David S. Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

From: Dan Carpenter 
> On Thu, Feb 19, 2015 at 09:49:00AM +0000, David Laight wrote:
> > From:  Dan Carpenter
> > ...
> > > Also this isn't ever going to be inlined so I removed the "inline".
> > ...
> > > -inline u16 cfpkt_iterate(struct cfpkt *pkt,
> > > -			 u16 (*iter_func)(u16, void *, u16),
> > > -			 u16 data)
> >
> > static ??
> 
> There are some words missing in this sentence.

I should have drunk some coffee first.

	David

