From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Oct 2012 17:28:10 +0000
Subject: re: aoe: print warning regarding a common reason for dropped transmits
Message-Id: <20121023172810.GA12454@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Ed L. Cashin,

The patch 6fde53abc51d: "aoe: print warning regarding a common reason 
for dropped transmits" from Oct 23, 2012, leads to the following 
warning:
drivers/block/aoe/aoenet.c:62 tx()
	 error: 'skb' was already used up by dev_queue_xmit()

61)              if (dev_queue_xmit(skb) = NET_XMIT_DROP && net_ratelimit())
62)                      pr_warn("aoe: packet could not be sent on %s.  %s\n",
63)                              skb->dev ? skb->dev->name : "netif",
64)                              "consider increasing tx_queue_len");

It's a use after free bug.

regards,
dan carpenter

