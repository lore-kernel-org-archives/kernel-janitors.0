From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 May 2017 18:12:58 +0000
Subject: [PATCH] drbd: Use seq_putc() once more in drbd_syncer_progress()
Message-Id: <2bb2d7fe-b27d-db5a-db0d-6159bc753599@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>, Philipp Reisner <philipp.reisner@linbit.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 May 2017 20:05:08 +0200

A single dot should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/drbd/drbd_proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_proc.c b/drivers/block/drbd/drbd_proc.c
index 8378142f7a55..fc0f627567fd 100644
--- a/drivers/block/drbd/drbd_proc.c
+++ b/drivers/block/drbd/drbd_proc.c
@@ -127,7 +127,7 @@ static void drbd_syncer_progress(struct drbd_device *device, struct seq_file *se
 		seq_putc(seq, '=');
 	seq_putc(seq, '>');
 	for (i = 0; i < y; i++)
-		seq_printf(seq, ".");
+		seq_putc(seq, '.');
 	seq_puts(seq, "] ");
 
 	if (state.conn = C_VERIFY_S || state.conn = C_VERIFY_T)
-- 
2.12.2

