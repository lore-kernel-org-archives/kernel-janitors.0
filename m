From: Dan Carpenter <error27@gmail.com>
Date: Wed, 23 Feb 2011 20:26:01 +0000
Subject: [patch] watchdog: sch311x_wdt: fix printk condition
Message-Id: <20110223202601.GH19898@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wim Van Sebroeck <wim@iguana.be>
Cc: linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

"=" has higher precedence than "&".  Since
if (sch311x_sio_inb(sio_config_port, 0x30) & (0x01 = 0)) is always
false the message is never printed.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Btw, is this printk() even worth printing?

diff --git a/drivers/watchdog/sch311x_wdt.c b/drivers/watchdog/sch311x_wdt.c
index 7b687e9..b61ab1c 100644
--- a/drivers/watchdog/sch311x_wdt.c
+++ b/drivers/watchdog/sch311x_wdt.c
@@ -508,7 +508,7 @@ static int __init sch311x_detect(int sio_config_port, unsigned short *addr)
 	sch311x_sio_outb(sio_config_port, 0x07, 0x0a);
 
 	/* Check if Logical Device Register is currently active */
-	if (sch311x_sio_inb(sio_config_port, 0x30) & 0x01 = 0)
+	if ((sch311x_sio_inb(sio_config_port, 0x30) & 0x01) = 0)
 		printk(KERN_INFO PFX "Seems that LDN 0x0a is not active...\n");
 
 	/* Get the base address of the runtime registers */
