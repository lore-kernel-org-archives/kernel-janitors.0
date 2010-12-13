From: =?UTF-8?q?Toralf=20F=C3=B6rster?= <toralf.foerster@gmx.de>
Date: Mon, 13 Dec 2010 16:19:35 +0000
Subject: [PATCH] fix : ERROR: space required after that ',' (ctx:WxV)
Message-Id: <1292257175-7810-1-git-send-email-toralf.foerster@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Signed-off-by: Toralf F=C3=B6rster <toralf.foerster@gmx.de>
---
 kernel/cred.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cred.c b/kernel/cred.c
index 6a1aa00..aab705a 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -20,10 +20,10 @@
=20
 #if 0
 #define kdebug(FMT, ...) \
-	printk("[%-5.5s%5u] "FMT"\n", current->comm, current->pid ,##__VA_ARGS__)
+	printk("[%-5.5s%5u] "FMT"\n", current->comm, current->pid, ##__VA_ARGS__)
 #else
 #define kdebug(FMT, ...) \
-	no_printk("[%-5.5s%5u] "FMT"\n", current->comm, current->pid ,##__VA_ARGS=
__)
+	no_printk("[%-5.5s%5u] "FMT"\n", current->comm, current->pid, ##__VA_ARGS=
__)
 #endif
=20
 static struct kmem_cache *cred_jar;
--=20
1.7.2.2

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
