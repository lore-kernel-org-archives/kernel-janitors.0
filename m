From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 09:34:40 +0000
Subject: [PATCH] memory-EMIF: Use seq_putc() in emif_regdump_show()
Message-Id: <1762e245-a88d-f82e-57e8-a4dab179ca03@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Santosh Shilimkar <ssantosh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 10:24:03 +0100

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/memory/emif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 04644e7b42b1..2f214440008c 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -127,7 +127,7 @@ static int emif_regdump_show(struct seq_file *s, void *unused)
 
 	for (i = 0; i < EMIF_MAX_NUM_FREQUENCIES && regs_cache[i]; i++) {
 		do_emif_regdump_show(s, emif, regs_cache[i]);
-		seq_printf(s, "\n");
+		seq_putc(s, '\n');
 	}
 
 	return 0;
-- 
2.15.1

