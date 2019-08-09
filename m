From: Colin King <colin.king@canonical.com>
Date: Fri, 09 Aug 2019 17:02:59 +0000
Subject: [PATCH][net-next] rxrpc: fix uninitialized return value in variable err
Message-Id: <20190809170259.29859-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, "David S . Miller" <davem@davemloft.net>, linux-afs@lists.infradead.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An earlier commit removed the setting of err to -ENOMEM so currently
the skb_shinfo(skb)->nr_frags > 16 check returns with an uninitialized
bogus return code.  Fix this by setting err to -ENOMEM to restore
the original behaviour.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: b214b2d8f277 ("rxrpc: Don't use skb_cow_data() in rxkad")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/rxrpc/rxkad.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/rxrpc/rxkad.c b/net/rxrpc/rxkad.c
index 8b4cddd8b673..c810a7c43b0f 100644
--- a/net/rxrpc/rxkad.c
+++ b/net/rxrpc/rxkad.c
@@ -248,8 +248,10 @@ static int rxkad_secure_packet_encrypt(const struct rxrpc_call *call,
 	crypto_skcipher_encrypt(req);
 
 	/* we want to encrypt the skbuff in-place */
-	if (skb_shinfo(skb)->nr_frags > 16)
+	if (skb_shinfo(skb)->nr_frags > 16) {
+		err = -ENOMEM;
 		goto out;
+	}
 
 	len = data_size + call->conn->size_align - 1;
 	len &= ~(call->conn->size_align - 1);
-- 
2.20.1
