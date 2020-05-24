From: Boris Sukholitko <boris.sukholitko@broadcom.com>
Date: Sun, 24 May 2020 05:25:42 +0000
Subject: Re: [bug report] __netif_receive_skb_core: pass skb by reference
Message-Id: <20200524052540.GA11080@noodle>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200522101553.GA41044@mwanda>
In-Reply-To: <20200522101553.GA41044@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, May 22, 2020 at 01:15:53PM +0300, Dan Carpenter wrote:
> Hello Boris Sukholitko,
> 
> The patch c0bbbdc32feb: "__netif_receive_skb_core: pass skb by
> reference" from May 19, 2020, leads to the following static checker
> warning:
> 
> 	net/core/dev.c:5256 __netif_receive_skb_core()
> 	warn: 'skb' was already freed.

IMHO, the static checker is wrong in this case. Please see below.

> 
> net/core/dev.c
>   5230          }
>   5231  
>   5232          if (pt_prev) {
>   5233                  if (unlikely(skb_orphan_frags_rx(skb, GFP_ATOMIC)))
>   5234                          goto drop;
>   5235                  *ppt_prev = pt_prev;
>   5236          } else {
>   5237  drop:
>   5238                  if (!deliver_exact)
>   5239                          atomic_long_inc(&skb->dev->rx_dropped);
>   5240                  else
>   5241                          atomic_long_inc(&skb->dev->rx_nohandler);
>   5242                  kfree_skb(skb);
>                                   ^^^

Notice how the *ppt_prev is *not* being set in the drop case, when we
are freeing the skb.

> 
>   5243                  /* Jamal, now you will not able to escape explaining
>   5244                   * me how you were going to use this. :-)
>   5245                   */
>   5246                  ret = NET_RX_DROP;
>   5247          }
>   5248  
>   5249  out:
>   5250          /* The invariant here is that if *ppt_prev is not NULL
>   5251           * then skb should also be non-NULL.
>   5252           *
>   5253           * Apparently *ppt_prev assignment above holds this invariant due to
>   5254           * skb dereferencing near it.
>   5255           */
>   5256          *pskb = skb;
>                 ^^^^^^^^^^^^
> Freed and also used in the caller.
> 

Although the skb may be freed at this point, the callers have their pt_prev
being set to NULL. Therefore none of them will try to use the bad skb.

Thanks,
Boris.

>   5257          return ret;
>   5258  }
> 
> regards,
> dan carpenter
