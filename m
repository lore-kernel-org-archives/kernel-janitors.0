From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jul 2015 08:07:47 +0000
Subject: [patch -next] lwtunnel: use kfree_skb() instead of vanilla kfree()
Message-Id: <20150727080747.GA2937@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Roopa Prabhu <roopa@cumulusnetworks.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

kfree_skb() is correct here.

Fixes: ffce41962ef6 ('lwtunnel: support dst output redirect function')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/core/lwtunnel.c b/net/core/lwtunnel.c
index bb58826..5f7fae7 100644
--- a/net/core/lwtunnel.c
+++ b/net/core/lwtunnel.c
@@ -205,7 +205,7 @@ int __lwtunnel_output(struct sock *sk, struct sk_buff *skb,
 	return ret;
 
 drop:
-	kfree(skb);
+	kfree_skb(skb);
 
 	return ret;
 }
