From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Dec 2016 09:14:10 +0000
Subject: [patch] KEYS: Use memzero_explicit() for secret data
Message-Id: <20161216091410.GB7285@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I don't think GCC has figured out how to optimize the memset() away, but
they might eventually so let's future proof this code a bit.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/security/keys/encrypted-keys/encrypted.c b/security/keys/encrypted-keys/encrypted.c
index d7a4969b2dd3..4fb315cddf5b 100644
--- a/security/keys/encrypted-keys/encrypted.c
+++ b/security/keys/encrypted-keys/encrypted.c
@@ -985,7 +985,7 @@ static void encrypted_destroy(struct key *key)
 	if (!epayload)
 		return;
 
-	memset(epayload->decrypted_data, 0, epayload->decrypted_datalen);
+	memzero_explicit(epayload->decrypted_data, epayload->decrypted_datalen);
 	kfree(key->payload.data[0]);
 }
 
