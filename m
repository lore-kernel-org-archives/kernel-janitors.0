From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 May 2017 20:15:37 +0000
Subject: [PATCH] android: binder: Use seq_putc() in print_binder_node()
Message-Id: <ac183437-7f90-d24f-d415-8d83d6f21845@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, =?UTF-8?Q?Arve_Hj=c3=b8nnev=c3=a5g?= <arve@android.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Riley Andrews <riandrews@android.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 May 2017 22:07:16 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/android/binder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index aae4d8d4be36..041b49b0bbd9 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3871,7 +3871,7 @@ static void print_binder_node(struct seq_file *m, struct binder_node *node)
 		hlist_for_each_entry(ref, &node->refs, node_entry)
 			seq_printf(m, " %d", ref->proc->pid);
 	}
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
 	list_for_each_entry(w, &node->async_todo, entry)
 		print_binder_work(m, "    ",
 				  "    pending async transaction", w);
-- 
2.12.2

