From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Mar 2015 17:48:46 +0000
Subject: [patch -next] ax25: remove unneeded NULL test in ax_xmit()
Message-Id: <20150305174846.GA17072@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>, Tom Gundersen <teg@jklm.no>, David Herrmann <dh.herrmann@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We get a static checker warning here on devel kernels:

	drivers/net/hamradio/mkiss.c:560 ax_xmit()
	warn: variable dereferenced before check 'skb' (see line 532)

It turns out that the NULL check can be deleted.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/hamradio/mkiss.c b/drivers/net/hamradio/mkiss.c
index 17058c4..2ffbf13 100644
--- a/drivers/net/hamradio/mkiss.c
+++ b/drivers/net/hamradio/mkiss.c
@@ -557,11 +557,9 @@ static netdev_tx_t ax_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	/* We were not busy, so we are now... :-) */
-	if (skb != NULL) {
-		netif_stop_queue(dev);
-		ax_encaps(dev, skb->data, skb->len);
-		kfree_skb(skb);
-	}
+	netif_stop_queue(dev);
+	ax_encaps(dev, skb->data, skb->len);
+	kfree_skb(skb);
 
 	return NETDEV_TX_OK;
 }
