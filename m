From: =?UTF-8?q?Toralf=20F=C3=B6rster?= <toralf.foerster@gmx.de>
Date: Tue, 14 Dec 2010 12:55:48 +0000
Subject: [PATCH] checkpatch.pl: fix 2 of 2 errors in ./kernel/user.c
Message-Id: <1292331348-27268-1-git-send-email-toralf.foerster@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, =?UTF-8?q?Toralf=20F=C3=B6rster?= <toralf.foerster@gmx.de>


Signed-off-by: Toralf F=C3=B6rster <toralf.foerster@gmx.de>
---
 kernel/user.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/user.c b/kernel/user.c
index 2c7d8d5..6db8ed9 100644
--- a/kernel/user.c
+++ b/kernel/user.c
@@ -5,7 +5,7 @@
  *
  * We have a per-user structure to keep track of how many
  * processes, files etc the user has claimed, in order to be
- * able to have per-user limits for system resources.=20
+ * able to have per-user limits for system resources.
  */
=20
 #include <linux/init.h>
@@ -181,7 +181,7 @@ static int __init uid_cache_init(void)
 	uid_cachep =3D kmem_cache_create("uid_cache", sizeof(struct user_struct),
 			0, SLAB_HWCACHE_ALIGN|SLAB_PANIC, NULL);
=20
-	for(n =3D 0; n < UIDHASH_SZ; ++n)
+	for (n =3D 0; n < UIDHASH_SZ; ++n)
 		INIT_HLIST_HEAD(init_user_ns.uidhash_table + n);
=20
 	/* Insert the root user immediately (init already runs as root) */
--=20
1.7.3.3

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
