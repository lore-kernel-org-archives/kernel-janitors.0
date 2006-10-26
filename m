From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 26 Oct 2006 19:05:30 +0000
Subject: [KJ] [Patch] kmemdup() cleanup in security/
Message-Id: <1161889530.7318.5.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

replace open coded kmemdup() to save some screen space,
and allow inlining/not inlining to be triggered by gcc.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.19-rc3-git1/security/keys/keyring.c.orig	2006-10-26 20:18:59.000000000 +0200
+++ linux-2.6.19-rc3-git1/security/keys/keyring.c	2006-10-26 20:19:22.000000000 +0200
@@ -706,12 +706,10 @@ int __key_link(struct key *keyring, stru
 				BUG_ON(size > PAGE_SIZE);
 
 				ret = -ENOMEM;
-				nklist = kmalloc(size, GFP_KERNEL);
+				nklist = kmemdup(klist, size, GFP_KERNEL);
 				if (!nklist)
 					goto error2;
 
-				memcpy(nklist, klist, size);
-
 				/* replace matched key */
 				atomic_inc(&key->usage);
 				nklist->keys[loop] = key;
--- linux-2.6.19-rc3-git1/security/keys/key.c.orig	2006-10-26 20:20:05.000000000 +0200
+++ linux-2.6.19-rc3-git1/security/keys/key.c	2006-10-26 20:20:53.000000000 +0200
@@ -290,11 +290,9 @@ struct key *key_alloc(struct key_type *t
 		goto no_memory_2;
 
 	if (desc) {
-		key->description = kmalloc(desclen, GFP_KERNEL);
+		key->description = kmemdup(desc, desclen, GFP_KERNEL);
 		if (!key->description)
 			goto no_memory_3;
-
-		memcpy(key->description, desc, desclen);
 	}
 
 	atomic_set(&key->usage, 1);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
