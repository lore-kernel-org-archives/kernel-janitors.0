From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Sep 2019 08:18:08 +0000
Subject: [PATCH] netfilter: nf_tables: Fix an Oops in nf_tables_updobj() error handling
Message-Id: <20190906081808.GA8281@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Fernando Fernandez Mancera <ffmancera@riseup.net>
Cc: Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

The "newobj" is an error pointer so we can't pass it to kfree().  It
doesn't need to be freed so we can remove that and I also renamed the
error label.

Fixes: d62d0ba97b58 ("netfilter: nf_tables: Introduce stateful object update operation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/netfilter/nf_tables_api.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index cf767bc58e18..6f66898d63b4 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -5148,7 +5148,7 @@ static int nf_tables_updobj(const struct nft_ctx *ctx,
 	newobj = nft_obj_init(ctx, type, attr);
 	if (IS_ERR(newobj)) {
 		err = PTR_ERR(newobj);
-		goto err1;
+		goto err_free_trans;
 	}
 
 	nft_trans_obj(trans) = obj;
@@ -5157,9 +5157,9 @@ static int nf_tables_updobj(const struct nft_ctx *ctx,
 	list_add_tail(&trans->list, &ctx->net->nft.commit_list);
 
 	return 0;
-err1:
+
+err_free_trans:
 	kfree(trans);
-	kfree(newobj);
 	return err;
 }
 
-- 
2.20.1
