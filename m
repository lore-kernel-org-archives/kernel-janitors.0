From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jul 2020 10:56:22 +0000
Subject: [PATCH] netfilter: nf_tables: Fix a use after free in nft_immediate_destroy()
Message-Id: <20200714105622.GB294318@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, Jakub Kicinski <kuba@kernel.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

The nf_tables_rule_release() function frees "rule" so we have to use
the _safe() version of list_for_each_entry().

Fixes: d0e2c7de92c7 ("netfilter: nf_tables: add NFT_CHAIN_BINDING")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/netfilter/nft_immediate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/nft_immediate.c b/net/netfilter/nft_immediate.c
index 9e556638bb32..c63eb3b17178 100644
--- a/net/netfilter/nft_immediate.c
+++ b/net/netfilter/nft_immediate.c
@@ -103,9 +103,9 @@ static void nft_immediate_destroy(const struct nft_ctx *ctx,
 {
 	const struct nft_immediate_expr *priv = nft_expr_priv(expr);
 	const struct nft_data *data = &priv->data;
+	struct nft_rule *rule, *n;
 	struct nft_ctx chain_ctx;
 	struct nft_chain *chain;
-	struct nft_rule *rule;
 
 	if (priv->dreg != NFT_REG_VERDICT)
 		return;
@@ -121,7 +121,7 @@ static void nft_immediate_destroy(const struct nft_ctx *ctx,
 		chain_ctx = *ctx;
 		chain_ctx.chain = chain;
 
-		list_for_each_entry(rule, &chain->rules, list)
+		list_for_each_entry_safe(rule, n, &chain->rules, list)
 			nf_tables_rule_release(&chain_ctx, rule);
 
 		nf_tables_chain_destroy(&chain_ctx);
-- 
2.27.0
