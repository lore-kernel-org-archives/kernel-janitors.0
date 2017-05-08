From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 13:30:07 +0000
Subject: [PATCH] misc: mic: Combine two function calls into one in mic_msi_irq_info_show()
Message-Id: <10a8b73e-5766-d14a-dff4-8288b94cb093@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 15:21:39 +0200

A bit of data was put into a sequence by two separate function calls.
Print the same data by a single function call instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/mic/host/mic_debugfs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/misc/mic/host/mic_debugfs.c b/drivers/misc/mic/host/mic_debugfs.c
index 0a9daba8bb5d..63df428ef150 100644
--- a/drivers/misc/mic/host/mic_debugfs.c
+++ b/drivers/misc/mic/host/mic_debugfs.c
@@ -126,10 +126,7 @@ static int mic_msi_irq_info_show(struct seq_file *s, void *pos)
 			seq_printf(s, "%-10s", "offset:");
 			for (j = (MIC_NUM_OFFSETS - 1); j >= 0; j--)
 				seq_printf(s, "%4d ", j);
-			seq_puts(s, "\n");
-
-
-			seq_printf(s, "%-10s", "count:");
+			seq_printf(s, "\n%-10s", "count:");
 			for (j = (MIC_NUM_OFFSETS - 1); j >= 0; j--)
 				seq_printf(s, "%4d ",
 					   (mdev->irq_info.mic_msi_map[i] &
-- 
2.12.2

