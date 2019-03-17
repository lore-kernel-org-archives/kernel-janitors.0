From: Colin King <colin.king@canonical.com>
Date: Sun, 17 Mar 2019 17:27:06 +0000
Subject: [PATCH] netfilter: nf_tables: remove unused parameter ctx
Message-Id: <20190317172706.26050-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Function nf_tables_set_desc_parse parameter ctx is not being used
so remove it as it is redundant.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/netfilter/nf_tables_api.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
index faf6bd10a19f..e9d6f4c32a03 100644
--- a/net/netfilter/nf_tables_api.c
+++ b/net/netfilter/nf_tables_api.c
@@ -3434,8 +3434,7 @@ static int nf_tables_getset(struct net *net, struct sock *nlsk,
 	return err;
 }
 
-static int nf_tables_set_desc_parse(const struct nft_ctx *ctx,
-				    struct nft_set_desc *desc,
+static int nf_tables_set_desc_parse(struct nft_set_desc *desc,
 				    const struct nlattr *nla)
 {
 	struct nlattr *da[NFTA_SET_DESC_MAX + 1];
@@ -3561,7 +3560,7 @@ static int nf_tables_newset(struct net *net, struct sock *nlsk,
 		policy = ntohl(nla_get_be32(nla[NFTA_SET_POLICY]));
 
 	if (nla[NFTA_SET_DESC] != NULL) {
-		err = nf_tables_set_desc_parse(&ctx, &desc, nla[NFTA_SET_DESC]);
+		err = nf_tables_set_desc_parse(&desc, nla[NFTA_SET_DESC]);
 		if (err < 0)
 			return err;
 	}
-- 
2.20.1
