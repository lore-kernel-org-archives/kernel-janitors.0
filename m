From: David Miller <davem@davemloft.net>
Date: Sat, 07 Sep 2019 13:48:09 +0000
Subject: Re: [PATCH] net/hamradio/6pack: Fix the size of a sk_buff used in 'sp_bump()'
Message-Id: <20190907.154809.649105225947712090.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190826190209.16795-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190826190209.16795-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: ajk@comnets.uni-bremen.de, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 26 Aug 2019 21:02:09 +0200

> We 'allocate' 'count' bytes here. In fact, 'dev_alloc_skb' already add some
> extra space for padding, so a bit more is allocated.
> 
> However, we use 1 byte for the KISS command, then copy 'count' bytes, so
> count+1 bytes.
> 
> Explicitly allocate and use 1 more byte to be safe.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

I applied your patch as-is, as it is correct and doesn't change the contents
of the data put into the SKB at all.

->rcount is the cooked count minus two, but then we copy effectively
cooked count minus one bytes from one byte past the beginning of the
cooked buffer and so all the accesses are in range on the input buffer
side.
