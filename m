From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 16:42:22 +0000
Subject: [PATCH] sky2: Use seq_putc() in sky2_debug_show()
Message-Id: <1f36d45e-3ca9-bfb8-0634-901c42390e2c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Mirko Lindner <mlindner@marvell.com>, Stephen Hemminger <stephen@networkplumber.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 18:38:17 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/marvell/sky2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/sky2.c b/drivers/net/ethernet/marvell/sky2.c
index 1145cde2274a..73575101cd72 100644
--- a/drivers/net/ethernet/marvell/sky2.c
+++ b/drivers/net/ethernet/marvell/sky2.c
@@ -4562,7 +4562,7 @@ static int sky2_debug_show(struct seq_file *seq, void *v)
 			seq_printf(seq, "[%d] %#x %d %#x\n",
 				   idx, le->opcode, le->length, le->status);
 		}
-		seq_puts(seq, "\n");
+		seq_putc(seq, '\n');
 	}
 
 	seq_printf(seq, "Tx ring pending=%u...%u report=%d done=%d\n",
-- 
2.12.2

