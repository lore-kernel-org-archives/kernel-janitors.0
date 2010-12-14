From: =?UTF-8?q?Toralf=20F=C3=B6rster?= <toralf.foerster@gmx.de>
Date: Tue, 14 Dec 2010 13:33:35 +0000
Subject: [PATCH] checkpatch.pl: fix 2 of 2 errors in ./kernek/panic.c
Message-Id: <1292333615-17860-1-git-send-email-toralf.foerster@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1292331348-27268-1-git-send-email-toralf.foerster@gmx.de>
In-Reply-To: <1292331348-27268-1-git-send-email-toralf.foerster@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Toralf=20F=C3=B6rster?= <toralf.foerster@gmx.de>


Signed-off-by: Toralf F=C3=B6rster <toralf.foerster@gmx.de>
---
 kernel/panic.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index 4c13b1a..13623e4 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -56,7 +56,7 @@ EXPORT_SYMBOL(panic_blink);
  *
  *	This function never returns.
  */
-NORET_TYPE void panic(const char * fmt, ...)
+NORET_TYPE void panic(const char *fmt, ...)
 {
 	static char buf[1024];
 	va_list args;
@@ -75,7 +75,7 @@ NORET_TYPE void panic(const char * fmt, ...)
 	va_start(args, fmt);
 	vsnprintf(buf, sizeof(buf), fmt, args);
 	va_end(args);
-	printk(KERN_EMERG "Kernel panic - not syncing: %s\n",buf);
+	printk(KERN_EMERG "Kernel panic - not syncing: %s\n", buf);
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 	dump_stack();
 #endif
--=20
1.7.3.3

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
