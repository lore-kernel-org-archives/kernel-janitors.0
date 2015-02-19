From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Feb 2015 09:59:44 +0000
Subject: Re: [patch] caif: fix a signedness bug in cfpkt_iterate()
Message-Id: <20150219095944.GD25513@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150219091313.GA29358@mwanda>
 <063D6719AE5E284EB5DD2968C1650D6D1CAE5EE1@AcuExch.aculab.com>
In-Reply-To: <063D6719AE5E284EB5DD2968C1650D6D1CAE5EE1@AcuExch.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Laight <David.Laight@ACULAB.COM>
Cc: Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, "David S. Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Thu, Feb 19, 2015 at 09:49:00AM +0000, David Laight wrote:
> From:  Dan Carpenter
> ...
> > Also this isn't ever going to be inlined so I removed the "inline".
> ...
> > -inline u16 cfpkt_iterate(struct cfpkt *pkt,
> > -			 u16 (*iter_func)(u16, void *, u16),
> > -			 u16 data)
> 
> static ??

There are some words missing in this sentence.


We could move this function to the header file and make it static inline
if we wanted but checksums aren't used on the fast path anyway so that's
a bit pointless.

regards,
dan carpenter
