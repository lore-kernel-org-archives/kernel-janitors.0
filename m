From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Jan 2021 17:59:23 +0000
Subject: [PATCH] netfilter: nf_tables: remove redundant assignment of variable err
Message-Id: <20210128175923.645865-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being assigned a value that is never read,
the same error number is being returned at the error return
path via label err1.  Clean up the code by removing the assignment.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/netfilter/nft_cmp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/netfilter/nft_cmp.c b/net/netfilter/nft_cmp.c
index 00e563a72d3d..acbabffefebb 100644
--- a/net/netfilter/nft_cmp.c
+++ b/net/netfilter/nft_cmp.c
@@ -268,10 +268,8 @@ nft_cmp_select_ops(const struct nft_ctx *ctx, const struct nlattr * const tb[])
 	if (err < 0)
 		return ERR_PTR(err);
 
-	if (desc.type != NFT_DATA_VALUE) {
-		err = -EINVAL;
+	if (desc.type != NFT_DATA_VALUE)
 		goto err1;
-	}
 
 	if (desc.len <= sizeof(u32) && (op = NFT_CMP_EQ || op = NFT_CMP_NEQ))
 		return &nft_cmp_fast_ops;
-- 
2.29.2
