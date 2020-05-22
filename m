From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 May 2020 10:15:53 +0000
Subject: [bug report] __netif_receive_skb_core: pass skb by reference
Message-Id: <20200522101553.GA41044@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Boris Sukholitko,

The patch c0bbbdc32feb: "__netif_receive_skb_core: pass skb by
reference" from May 19, 2020, leads to the following static checker
warning:

	net/core/dev.c:5256 __netif_receive_skb_core()
	warn: 'skb' was already freed.

net/core/dev.c
  5230          }
  5231  
  5232          if (pt_prev) {
  5233                  if (unlikely(skb_orphan_frags_rx(skb, GFP_ATOMIC)))
  5234                          goto drop;
  5235                  *ppt_prev = pt_prev;
  5236          } else {
  5237  drop:
  5238                  if (!deliver_exact)
  5239                          atomic_long_inc(&skb->dev->rx_dropped);
  5240                  else
  5241                          atomic_long_inc(&skb->dev->rx_nohandler);
  5242                  kfree_skb(skb);
                                  ^^^

  5243                  /* Jamal, now you will not able to escape explaining
  5244                   * me how you were going to use this. :-)
  5245                   */
  5246                  ret = NET_RX_DROP;
  5247          }
  5248  
  5249  out:
  5250          /* The invariant here is that if *ppt_prev is not NULL
  5251           * then skb should also be non-NULL.
  5252           *
  5253           * Apparently *ppt_prev assignment above holds this invariant due to
  5254           * skb dereferencing near it.
  5255           */
  5256          *pskb = skb;
                ^^^^^^^^^^^^
Freed and also used in the caller.

  5257          return ret;
  5258  }

regards,
dan carpenter
