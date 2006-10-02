From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 02 Oct 2006 10:54:00 +0000
Subject: [KJ] [PATCH] drivers/usb/atm/ueagle-atm: Handle return value of
Message-Id: <20061002105400.GA12109@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Handle the return value of usb_register() in the module_init function.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

---
 drivers/usb/atm/ueagle-atm.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 465961a..90e8062 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -1830,9 +1830,7 @@ static int __init uea_init(void)
 {
 	printk(KERN_INFO "[ueagle-atm] driver " EAGLEUSBVERSION " loaded\n");
 
-	usb_register(&uea_driver);
-
-	return 0;
+	return usb_register(&uea_driver);
 }
 
 module_init(uea_init);
-- 
1.4.2

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
