From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Nov 2014 18:42:01 +0000
Subject: [patch] KEYS: remove a bogus NULL check
Message-Id: <20141122184201.GE6994@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We already checked if "desc" was NULL at the beginning of the function
and we've dereferenced it so this causes a static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/security/keys/key.c b/security/keys/key.c
index e17ba6a..aee2ec5 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -276,12 +276,10 @@ struct key *key_alloc(struct key_type *type, const char *desc,
 	if (!key)
 		goto no_memory_2;
 
-	if (desc) {
-		key->index_key.desc_len = desclen;
-		key->index_key.description = kmemdup(desc, desclen + 1, GFP_KERNEL);
-		if (!key->description)
-			goto no_memory_3;
-	}
+	key->index_key.desc_len = desclen;
+	key->index_key.description = kmemdup(desc, desclen + 1, GFP_KERNEL);
+	if (!key->description)
+		goto no_memory_3;
 
 	atomic_set(&key->usage, 1);
 	init_rwsem(&key->sem);
