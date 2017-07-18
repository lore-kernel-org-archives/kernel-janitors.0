From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Jul 2017 19:38:56 +0000
Subject: [PATCH] netfilter: fix netfilter_net_init() return
Message-Id: <20170718193856.yh2qd2j5bloiuq5r@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

We accidentally return an uninitialized variable.

Fixes: cf56c2f892a8 ("netfilter: remove old pre-netns era hook api")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/netfilter/core.c b/net/netfilter/core.c
index 368610dbc3c0..974cf2a3795a 100644
--- a/net/netfilter/core.c
+++ b/net/netfilter/core.c
@@ -344,7 +344,7 @@ EXPORT_SYMBOL(nf_nat_decode_session_hook);
 
 static int __net_init netfilter_net_init(struct net *net)
 {
-	int i, h, ret;
+	int i, h;
 
 	for (i = 0; i < ARRAY_SIZE(net->nf.hooks); i++) {
 		for (h = 0; h < NF_MAX_HOOKS; h++)
@@ -362,7 +362,7 @@ static int __net_init netfilter_net_init(struct net *net)
 	}
 #endif
 
-	return ret;
+	return 0;
 }
 
 static void __net_exit netfilter_net_exit(struct net *net)
