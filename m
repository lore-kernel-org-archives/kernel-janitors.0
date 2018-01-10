From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Jan 2018 09:47:35 +0000
Subject: [PATCH] netfilter: nf_tables: copy and paste bug in nf_tables_getflowtable()
Message-Id: <20180110094735.zyfdsonrb76x7cd6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

We should be testing "flowtable" instead of "table".

Fixes: 3b49e2e94e6e ("netfilter: nf_tables: add flow table netlink frontend")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The bug hasn't hit net-next yet, it's still in the netfilter tree.

diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index 336b81689ac9..40594bb57012 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -5420,7 +5420,7 @@ static int nf_tables_getflowtable(struct net *net, struct sock *nlsk,
 
 	flowtable = nf_tables_flowtable_lookup(table, nla[NFTA_FLOWTABLE_NAME],
 					       genmask);
-	if (IS_ERR(table))
+	if (IS_ERR(flowtable))
 		return PTR_ERR(flowtable);
 
 	skb2 = alloc_skb(NLMSG_GOODSIZE, GFP_KERNEL);
