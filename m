From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 Jul 2016 18:26:17 +0000
Subject: [bug report] macvtap: switch to use skb array
Message-Id: <20160718150651.GA31660@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jason Wang,

The patch 362899b8725b: "macvtap: switch to use skb array" from Jul
15, 2016, leads to the following static checker warning:

	drivers/net/macvtap.c:539 macvtap_sock_destruct()
	error: use kfree_skb() here instead of kfree(skb)

drivers/net/macvtap.c
   533  static void macvtap_sock_destruct(struct sock *sk)
   534  {
   535          struct macvtap_queue *q = container_of(sk, struct macvtap_queue, sk);
   536          struct sk_buff *skb;
   537  
   538          while ((skb = skb_array_consume(&q->skb_array)) != NULL)
   539                  kfree(skb);

Should be kfree_skb().  On my way to airport or would send patch.

   540  }

regards,
dan carpenter
