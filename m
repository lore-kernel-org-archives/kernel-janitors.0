From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 09:14:04 +0000
Subject: [PATCH 4/4] dma-buf: Use seq_putc() in two functions
Message-Id: <609254ac-000d-c87c-eabc-7ca8814daf5c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3d972fa2-787a-d1f2-ff86-5c05494e00d3@users.sourceforge.net>
In-Reply-To: <3d972fa2-787a-d1f2-ff86-5c05494e00d3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org, Gustavo Padovan <gustavo@padovan.org>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 10:55:42 +0200

Three single characters (line breaks) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma-buf/sync_debug.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
index c769dc653b34..a0d780ab68c3 100644
--- a/drivers/dma-buf/sync_debug.c
+++ b/drivers/dma-buf/sync_debug.c
@@ -110,7 +110,7 @@ static void sync_print_fence(struct seq_file *s,
 		}
 	}
 
-	seq_puts(s, "\n");
+	seq_putc(s, '\n');
 }
 
 static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
@@ -161,7 +161,7 @@ static int sync_debugfs_show(struct seq_file *s, void *unused)
 				     sync_timeline_list);
 
 		sync_print_obj(s, obj);
-		seq_puts(s, "\n");
+		seq_putc(s, '\n');
 	}
 	spin_unlock_irqrestore(&sync_timeline_list_lock, flags);
 
@@ -173,7 +173,7 @@ static int sync_debugfs_show(struct seq_file *s, void *unused)
 			container_of(pos, struct sync_file, sync_file_list);
 
 		sync_print_sync_file(s, sync_file);
-		seq_puts(s, "\n");
+		seq_putc(s, '\n');
 	}
 	spin_unlock_irqrestore(&sync_file_list_lock, flags);
 	return 0;
-- 
2.12.2

