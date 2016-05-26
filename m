From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 May 2016 06:45:59 +0000
Subject: [patch] KEYS: potential uninitialized variable
Message-Id: <20160526064559.GA6738@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If __key_link_begin() failed then "edit" would be uninitialized.  I've
added a check to fix that.

Fixes: f70e2e06196a ('KEYS: Do preallocation for __key_link()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/security/keys/key.c b/security/keys/key.c
index bd5a272..346fbf2 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -597,7 +597,7 @@ int key_reject_and_link(struct key *key,
 
 	mutex_unlock(&key_construction_mutex);
 
-	if (keyring)
+	if (keyring && link_ret = 0)
 		__key_link_end(keyring, &key->index_key, edit);
 
 	/* wake up anyone waiting for a key to be constructed */
