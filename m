From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Apr 2017 12:57:56 +0000
Subject: [PATCH] netfilter: x_tables: unlock on error in xt_find_table_lock()
Message-Id: <20170428125756.s4ycoffclspnr4zo@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>
Cc: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

According to my static checker we should unlock here before the return.
That seems reasonable to me as well.

Fixes" b9e69e127397 ("netfilter: xtables: don't hook tables by default")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/netfilter/x_tables.c b/net/netfilter/x_tables.c
index e58ecff638b3..8876b7da6884 100644
--- a/net/netfilter/x_tables.c
+++ b/net/netfilter/x_tables.c
@@ -1041,8 +1041,10 @@ struct xt_table *xt_find_table_lock(struct net *net, u_int8_t af,
 	list_for_each_entry(t, &init_net.xt.tables[af], list) {
 		if (strcmp(t->name, name))
 			continue;
-		if (!try_module_get(t->me))
+		if (!try_module_get(t->me)) {
+			mutex_unlock(&xt[af].mutex);
 			return NULL;
+		}
 
 		mutex_unlock(&xt[af].mutex);
 		if (t->table_init(net) != 0) {
