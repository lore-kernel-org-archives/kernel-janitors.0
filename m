From: Colin King <colin.king@canonical.com>
Date: Mon, 14 Dec 2020 23:40:15 +0000
Subject: [PATCH][next] netfilter: nftables: fix incorrect increment of loop counter
Message-Id: <20201214234015.85072-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The intention of the err_expr cleanup path is to iterate over the
allocated expr_array objects and free them, starting from i - 1 and
working down to the start of the array. Currently the loop counter
is being incremented instead of decremented and also the index i is
being used instead of k, repeatedly destroying the same expr_array
element.  Fix this by decrementing k and using k as the index into
expr_array.

Addresses-Coverity: ("Infinite loop")
Fixes: 8cfd9b0f8515 ("netfilter: nftables: generalize set expressions support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/netfilter/nf_tables_api.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index 8d5aa0ac45f4..4186b1e52d58 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -5254,8 +5254,8 @@ static int nft_set_elem_expr_clone(const struct nft_ctx *ctx,
 	return 0;
 
 err_expr:
-	for (k = i - 1; k >= 0; k++)
-		nft_expr_destroy(ctx, expr_array[i]);
+	for (k = i - 1; k >= 0; k--)
+		nft_expr_destroy(ctx, expr_array[k]);
 
 	return -ENOMEM;
 }
-- 
2.29.2
