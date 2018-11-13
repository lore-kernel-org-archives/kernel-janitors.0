From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Nov 2018 14:23:28 +0000
Subject: [PATCH] af_key: fix indentation on declaration statement
Message-Id: <20181113142328.8322-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an indentation issue before the declaration of xfrm_ctx. Remove
spaces and replace with a tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/key/af_key.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/key/af_key.c b/net/key/af_key.c
index 9d61266526e7..655c787f9d54 100644
--- a/net/key/af_key.c
+++ b/net/key/af_key.c
@@ -2020,7 +2020,7 @@ parse_ipsecrequests(struct xfrm_policy *xp, struct sadb_x_policy *pol)
 
 static inline int pfkey_xfrm_policy2sec_ctx_size(const struct xfrm_policy *xp)
 {
-  struct xfrm_sec_ctx *xfrm_ctx = xp->security;
+	struct xfrm_sec_ctx *xfrm_ctx = xp->security;
 
 	if (xfrm_ctx) {
 		int len = sizeof(struct sadb_x_sec_ctx);
-- 
2.19.1
