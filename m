From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 30 Oct 2017 13:11:01 +0000
Subject: [PATCH] pcmcia/vrc4171: Use common error handling code in vrc4171_card_init()
Message-Id: <c6a55205-0d89-fbd6-3161-5d68a6645a47@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 30 Oct 2017 14:05:35 +0100

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pcmcia/vrc4171_card.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/pcmcia/vrc4171_card.c b/drivers/pcmcia/vrc4171_card.c
index 1e5fa211fb70..56d39585ac9a 100644
--- a/drivers/pcmcia/vrc4171_card.c
+++ b/drivers/pcmcia/vrc4171_card.c
@@ -721,10 +721,8 @@ static int vrc4171_card_init(void)
 		return retval;
 
 	retval = platform_device_register(&vrc4171_card_device);
-	if (retval < 0) {
-		platform_driver_unregister(&vrc4171_card_driver);
-		return retval;
-	}
+	if (retval < 0)
+		goto unregister_driver;
 
 	vrc4171_set_multifunction_pin(vrc4171_slotb);
 
@@ -736,14 +734,17 @@ static int vrc4171_card_init(void)
 	if (retval < 0) {
 		vrc4171_remove_sockets();
 		platform_device_unregister(&vrc4171_card_device);
-		platform_driver_unregister(&vrc4171_card_driver);
-		return retval;
+		goto unregister_driver;
 	}
 
 	printk(KERN_INFO "%s, connected to IRQ %d\n",
 		vrc4171_card_driver.driver.name, vrc4171_irq);
 
 	return 0;
+
+unregister_driver:
+	platform_driver_unregister(&vrc4171_card_driver);
+	return retval;
 }
 
 static void vrc4171_card_exit(void)
-- 
2.14.3

