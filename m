From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 11:43:25 +0000
Subject: [PATCH] fscache: Replace four seq_puts() calls by seq_putc() in fscache_objlist_show()
Message-Id: <364f5283-8b2e-2f51-366e-f322655c3fa3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-cachefs@redhat.com, David Howells <dhowells@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 13:38:42 +0200

Four single characters should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/fscache/object-list.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/fscache/object-list.c b/fs/fscache/object-list.c
index 67f940892ef8..3916db02623d 100644
--- a/fs/fscache/object-list.c
+++ b/fs/fscache/object-list.c
@@ -187,7 +187,7 @@ static int fscache_objlist_show(struct seq_file *m, void *v)
 			seq_puts(m, ", ");
 		if (config & FSCACHE_OBJLIST_CONFIG_AUX)
 			seq_puts(m, "AUX_DATA");
-		seq_puts(m, "\n");
+		seq_putc(m, '\n');
 		return 0;
 	}
 
@@ -198,7 +198,7 @@ static int fscache_objlist_show(struct seq_file *m, void *v)
 		if (config & (FSCACHE_OBJLIST_CONFIG_KEY |
 			      FSCACHE_OBJLIST_CONFIG_AUX))
 			seq_puts(m, " ========");
-		seq_puts(m, "\n");
+		seq_putc(m, '\n');
 		return 0;
 	}
 
@@ -285,7 +285,7 @@ static int fscache_objlist_show(struct seq_file *m, void *v)
 		fscache_unuse_cookie(obj);
 
 		if (keylen > 0 || auxlen > 0) {
-			seq_puts(m, " ");
+			seq_putc(m, ' ');
 			for (p = buf; keylen > 0; keylen--)
 				seq_printf(m, "%02x", *p++);
 			if (auxlen > 0) {
@@ -296,7 +296,7 @@ static int fscache_objlist_show(struct seq_file *m, void *v)
 			}
 		}
 
-		seq_puts(m, "\n");
+		seq_putc(m, '\n');
 	} else {
 		seq_puts(m, "<no_netfs>\n");
 	}
-- 
2.12.2

