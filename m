From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 16:26:29 +0000
Subject: [PATCH] fs/proc: Use seq_putc() in show_console_dev()
Message-Id: <04fb69fe-d820-9141-820f-07e9a48f4635@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 17:17:59 +0100

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/proc/consoles.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/proc/consoles.c b/fs/proc/consoles.c
index 290ba85cb900..a8ac48aebd59 100644
--- a/fs/proc/consoles.c
+++ b/fs/proc/consoles.c
@@ -55,8 +55,7 @@ static int show_console_dev(struct seq_file *m, void *v)
 	if (dev)
 		seq_printf(m, " %4d:%d", MAJOR(dev), MINOR(dev));
 
-	seq_printf(m, "\n");
-
+	seq_putc(m, '\n');
 	return 0;
 }
 
-- 
2.15.1

