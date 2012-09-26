From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Wed, 26 Sep 2012 18:18:15 +0000
Subject: [Patch 5/5] Staging: winbond: usb_free_urb(NULL) is safe
Message-Id: <50634417.6000109@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

usb_free_urb(NULL) is safe. So, the check was removed.

Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

---
 drivers/staging/winbond/wb35tx.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff -uprN a/drivers/staging/winbond/wb35tx.c b/drivers/staging/winbond/wb35tx.c
--- a/drivers/staging/winbond/wb35tx.c
+++ b/drivers/staging/winbond/wb35tx.c
@@ -170,11 +170,8 @@ void Wb35Tx_destroy(struct hw_data *pHwD
 	} while ((pWb35Tx->EP2vm_state != VM_STOP) && (pWb35Tx->EP4vm_state != VM_STOP));
 	msleep(10); /* Delay for waiting function enter 940623.1.b */
 
-	if (pWb35Tx->Tx4Urb)
-		usb_free_urb(pWb35Tx->Tx4Urb);
-
-	if (pWb35Tx->Tx2Urb)
-		usb_free_urb(pWb35Tx->Tx2Urb);
+	usb_free_urb(pWb35Tx->Tx4Urb);
+	usb_free_urb(pWb35Tx->Tx2Urb);
 
 	pr_debug("Wb35Tx_destroy OK\n");
 }
