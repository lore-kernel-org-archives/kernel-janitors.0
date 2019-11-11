From: Colin King <colin.king@canonical.com>
Date: Mon, 11 Nov 2019 12:33:34 +0000
Subject: [PATCH][next] tipc: fix update of the uninitialized variable err
Message-Id: <20191111123334.68401-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Maloy <jon.maloy@ericsson.com>, Ying Xue <ying.xue@windreiver.com>, "David S . Miller" <davem@davemloft.net>, Tuong Lien <tuong.t.lien@dektech.com.au>, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable err is not uninitialized and hence can potentially contain
any garbage value.  This may cause an error when logical or'ing the
return values from the calls to functions crypto_aead_setauthsize or
crypto_aead_setkey.  Fix this by setting err to the return of
crypto_aead_setauthsize rather than or'ing in the return into the
uninitialized variable

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: fc1b6d6de220 ("tipc: introduce TIPC encryption & authentication")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/tipc/crypto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/tipc/crypto.c b/net/tipc/crypto.c
index 05f7ca76e8ce..990a872cec46 100644
--- a/net/tipc/crypto.c
+++ b/net/tipc/crypto.c
@@ -463,7 +463,7 @@ static int tipc_aead_init(struct tipc_aead **aead, struct tipc_aead_key *ukey,
 			break;
 		}
 
-		err |= crypto_aead_setauthsize(tfm, TIPC_AES_GCM_TAG_SIZE);
+		err = crypto_aead_setauthsize(tfm, TIPC_AES_GCM_TAG_SIZE);
 		err |= crypto_aead_setkey(tfm, ukey->key, keylen);
 		if (unlikely(err)) {
 			crypto_free_aead(tfm);
-- 
2.20.1
