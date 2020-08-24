From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Aug 2020 08:59:02 +0000
Subject: [PATCH] crypto/chtls: Fix double free in chtls_pass_accept_request()
Message-Id: <20200824085902.GC208317@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ayush Sawal <ayush.sawal@chelsio.com>
Cc: Vinay Kumar Yadav <vinay.yadav@chelsio.com>, Rohit Maheshwari <rohitm@chelsio.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Florian Westphal <fw@strlen.de>, Eric Dumazet <edumazet@google.com>, Shahjada Abul Husain <shahjada@chelsio.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

The chtls_recv_sock() function frees "oreq" so the free here is a double
free.

Fixes: 6abde0b24122 ("crypto/chtls: IPv6 support for inline TLS")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/crypto/chelsio/chtls/chtls_cm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/crypto/chelsio/chtls/chtls_cm.c b/drivers/crypto/chelsio/chtls/chtls_cm.c
index 05520dccd906..140342024bd1 100644
--- a/drivers/crypto/chelsio/chtls/chtls_cm.c
+++ b/drivers/crypto/chelsio/chtls/chtls_cm.c
@@ -1381,7 +1381,7 @@ static void chtls_pass_accept_request(struct sock *sk,
 
 	newsk = chtls_recv_sock(sk, oreq, network_hdr, req, cdev);
 	if (!newsk)
-		goto free_oreq;
+		goto reject;
 
 	if (chtls_get_module(newsk))
 		goto reject;
@@ -1397,8 +1397,6 @@ static void chtls_pass_accept_request(struct sock *sk,
 	kfree_skb(skb);
 	return;
 
-free_oreq:
-	chtls_reqsk_free(oreq);
 reject:
 	mk_tid_release(reply_skb, 0, tid);
 	cxgb4_ofld_send(cdev->lldi->ports[0], reply_skb);
-- 
2.28.0
