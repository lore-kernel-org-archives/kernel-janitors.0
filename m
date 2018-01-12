From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 16:58:42 +0000
Subject: [PATCH 1/2] mvebu-mbus: Use seq_putc() in mvebu_devs_debug_show()
Message-Id: <8dae6f05-2403-42d3-8728-96d69e4a965b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4796228f-fa7f-24db-0049-2d2b9041c5b0@users.sourceforge.net>
In-Reply-To: <4796228f-fa7f-24db-0049-2d2b9041c5b0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Gregory Clement <gregory.clement@free-electrons.com>, =?UTF-8?Q?Jan_L=c3=bcbbe?= <jlu@pengutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 Jan 2018 17:12:14 +0100

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/bus/mvebu-mbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 70db4d5638a6..5844901aea0b 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -514,7 +514,7 @@ static int mvebu_devs_debug_show(struct seq_file *seq, void *v)
 			seq_printf(seq, " (remap %016llx)\n",
 				   (unsigned long long)wremap);
 		} else
-			seq_printf(seq, "\n");
+			seq_putc(seq, '\n');
 	}
 
 	return 0;
-- 
2.15.1

