From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Dec 2016 09:08:27 +0000
Subject: [patch] KEYS: Fix an error code in request_master_key()
Message-Id: <20161216090827.GA7285@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: David Safford <safford@us.ibm.com>, David Howells <dhowells@redhat.com>, James Morris <james.l.morris@oracle.com>, "Serge E. Hallyn" <serge@hallyn.com>, linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This function has two callers and neither are able to handle a NULL
return.  Really, -EINVAL is the correct thing return here anyway.  This
fixes some static checker warnings like:

	security/keys/encrypted-keys/encrypted.c:709 encrypted_key_decrypt()
	error: uninitialized symbol 'master_key'.

Fixes: 7e70cb497850 ("keys: add new key-type encrypted")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/security/keys/encrypted-keys/encrypted.c b/security/keys/encrypted-keys/encrypted.c
index 17a06105ccb6..d7a4969b2dd3 100644
--- a/security/keys/encrypted-keys/encrypted.c
+++ b/security/keys/encrypted-keys/encrypted.c
@@ -437,7 +437,7 @@ static struct skcipher_request *init_skcipher_req(const u8 *key,
 static struct key *request_master_key(struct encrypted_key_payload *epayload,
 				      const u8 **master_key, size_t *master_keylen)
 {
-	struct key *mkey = NULL;
+	struct key *mkey = ERR_PTR(-EINVAL);
 
 	if (!strncmp(epayload->master_desc, KEY_TRUSTED_PREFIX,
 		     KEY_TRUSTED_PREFIX_LEN)) {
