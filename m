From: David Miller <davem@davemloft.net>
Date: Wed, 28 Aug 2019 04:39:53 +0000
Subject: Re: [PATCH] net/hamradio/6pack: Fix the size of a sk_buff used in 'sp_bump()'
Message-Id: <20190827.213953.102911550129423796.davem@davemloft.net>
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
> ---
> This patch should be safe, be however may no be the correct way to fix the
> "buffer overflow". Maybe, the allocated size is correct and we should have:
>    memcpy(ptr, sp->cooked_buf + 1, count - 1);
> or
>    memcpy(ptr, sp->cooked_buf + 1, count - 1sp->rcount);
> 
> I've not dig deep enough to understand the link betwwen 'rcount' and
> how 'cooked_buf' is used.

I'm trying to figure out how this code works too.

Why are they skipping over the first byte?  Is that to avoid the
command byte?  Yes, then using sp->rcount as the memcpy length makes
sense.

Why is the caller subtracting 2 from the RX buffer count when
calculating sp->rcount?  This makes the situation even more confusing.
