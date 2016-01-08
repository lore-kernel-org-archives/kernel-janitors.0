From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Jan 2016 10:57:58 +0000
Subject: [patch] staging: media: lirc: fix MODULE_PARM_DESC typo
Message-Id: <20160108105758.GC32195@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jarod Wilson <jarod@wilsonet.com>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Aya Mahfouz <mahfouz.saif.elyazal@gmail.com>, Tapasweni Pathak <tapaswenipathak@gmail.com>, Haneen Mohammed <hamohammed.sa@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It "tx_mask" was intended instead of "tx_maxk".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/lirc/lirc_parallel.c b/drivers/staging/media/lirc/lirc_parallel.c
index d009bcb..19c101b 100644
--- a/drivers/staging/media/lirc/lirc_parallel.c
+++ b/drivers/staging/media/lirc/lirc_parallel.c
@@ -730,7 +730,7 @@ module_param(irq, int, S_IRUGO);
 MODULE_PARM_DESC(irq, "Interrupt (7 or 5)");
 
 module_param(tx_mask, int, S_IRUGO);
-MODULE_PARM_DESC(tx_maxk, "Transmitter mask (default: 0x01)");
+MODULE_PARM_DESC(tx_mask, "Transmitter mask (default: 0x01)");
 
 module_param(debug, bool, S_IRUGO | S_IWUSR);
 MODULE_PARM_DESC(debug, "Enable debugging messages");
