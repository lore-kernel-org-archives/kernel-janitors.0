From: Julia Lawall <julia@diku.dk>
Date: Tue, 06 Jul 2010 05:07:57 +0000
Subject: Re: [PATCH] drivers/net: correct valid flag
Message-Id: <Pine.LNX.4.64.1007060707460.30668@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1007051706530.15185@ask.diku.dk>
 <20100705.180349.112607097.davem@davemloft.net>
In-Reply-To: <20100705.180349.112607097.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 5 Jul 2010, David Miller wrote:

> From: Julia Lawall <julia@diku.dk>
> Date: Mon, 5 Jul 2010 17:07:15 +0200 (CEST)
> 
> > From: Julia Lawall <julia@diku.dk>
> > 
> > Elsewhere in the "optimized" functions, the "2" constants are used.
> > NV_TX_VALID and NV_TX2_VALID have the same value.
> > 
> > Signed-off-by: Julia Lawall <julia@diku.dk>
> > 
> > ---
> > diff --git a/drivers/net/forcedeth.c b/drivers/net/forcedeth.c
> > index 268ea4d..870c18b 100644
> > --- a/drivers/net/forcedeth.c
> > +++ b/drivers/net/forcedeth.c
> > @@ -2468,7 +2468,8 @@ static int nv_tx_done_optimized(struct net_device *dev, int limit)
> >  	struct ring_desc_ex* orig_get_tx = np->get_tx.ex;
> >  
> >  	while ((np->get_tx.ex != np->put_tx.ex) &&
> > -	       !((flags = le32_to_cpu(np->get_tx.ex->flaglen)) & NV_TX_VALID) &&
> > +	       !((flags = le32_to_cpu(np->get_tx.ex->flaglen)) & NV_TX2_VALID)
> > +	       &&
> >  	       (tx_work < limit)) {
> 
> Please don't put that "&&" on a line by itself.  I don't care if leaving it
> on the previous line makes it exceed 80 columns, what you're doing here is
> infinitely less pleasant to read.

OK, I'll put it back.

julia
