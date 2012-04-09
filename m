From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 09 Apr 2012 08:41:10 +0000
Subject: [PATCH] net/key/af_key.c: add missing kfree_skb
Message-Id: <1333960870-19735-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

At the point of this error-handling code, alloc_skb has succeded, so free
the resulting skb by jumping to the err label.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 net/key/af_key.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/key/af_key.c b/net/key/af_key.c
index 11dbb22..7e5d927 100644
--- a/net/key/af_key.c
+++ b/net/key/af_key.c
@@ -3480,7 +3480,7 @@ static int pfkey_send_migrate(const struct xfrm_selector *sel, u8 dir, u8 type,
 
 	/* Addresses to be used by KM for negotiation, if ext is available */
 	if (k != NULL && (set_sadb_kmaddress(skb, k) < 0))
-		return -EINVAL;
+		goto err;
 
 	/* selector src */
 	set_sadb_address(skb, sasize_sel, SADB_EXT_ADDRESS_SRC, sel);

