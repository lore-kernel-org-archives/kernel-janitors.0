From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Sep 2020 08:30:17 +0000
Subject: [PATCH net-next] tipc: potential memory corruption in tipc_crypto_key_rcv()
Message-Id: <20200923083017.GA1454948@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Maloy <jmaloy@redhat.com>
Cc: Ying Xue <ying.xue@windriver.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Tuong Lien <tuong.t.lien@dektech.com.au>, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>, Kees Cook <keescook@chromium.org>

This code uses "skey->keylen" as an memcpy() size and then checks that
it is valid on the next line.  The other problem is that the check has
a potential integer overflow, it's better to use struct_size() for this.

Fixes: 23700da29b83 ("tipc: add automatic rekeying for encryption key")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Hey Kees and Julia,

It would be nice to change tipc_aead_key_size() but I'm not sure how the
UAPI stuff works.  My first attempt at to change it to

	return struct_size(key, key, key->keylen);

broke the build.  I think you guys used Coccinelle to automatically
update these calculations.  Probably this wasn't updated because you
didn't want to break the build either?

 net/tipc/crypto.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/net/tipc/crypto.c b/net/tipc/crypto.c
index 40c44101fe8e..291ba276b835 100644
--- a/net/tipc/crypto.c
+++ b/net/tipc/crypto.c
@@ -2281,6 +2281,7 @@ static bool tipc_crypto_key_rcv(struct tipc_crypto *rx, struct tipc_msg *hdr)
 	u16 key_gen = msg_key_gen(hdr);
 	u16 size = msg_data_sz(hdr);
 	u8 *data = msg_data(hdr);
+	u32 keylen;
 
 	spin_lock(&rx->lock);
 	if (unlikely(rx->skey || (key_gen = rx->key_gen && rx->key.keys))) {
@@ -2289,6 +2290,10 @@ static bool tipc_crypto_key_rcv(struct tipc_crypto *rx, struct tipc_msg *hdr)
 		goto exit;
 	}
 
+	keylen = ntohl(*((__be32 *)(data + TIPC_AEAD_ALG_NAME)));
+	if (struct_size(skey, key, keylen) != size)
+		goto exit;
+
 	/* Allocate memory for the key */
 	skey = kmalloc(size, GFP_ATOMIC);
 	if (unlikely(!skey)) {
@@ -2297,18 +2302,11 @@ static bool tipc_crypto_key_rcv(struct tipc_crypto *rx, struct tipc_msg *hdr)
 	}
 
 	/* Copy key from msg data */
-	skey->keylen = ntohl(*((__be32 *)(data + TIPC_AEAD_ALG_NAME)));
+	skey->keylen = keylen;
 	memcpy(skey->alg_name, data, TIPC_AEAD_ALG_NAME);
 	memcpy(skey->key, data + TIPC_AEAD_ALG_NAME + sizeof(__be32),
 	       skey->keylen);
 
-	/* Sanity check */
-	if (unlikely(size != tipc_aead_key_size(skey))) {
-		kfree(skey);
-		skey = NULL;
-		goto exit;
-	}
-
 	rx->key_gen = key_gen;
 	rx->skey_mode = msg_key_mode(hdr);
 	rx->skey = skey;
-- 
2.28.0
