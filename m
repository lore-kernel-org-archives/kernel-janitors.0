From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Fri, 31 May 2013 15:44:11 +0000
Subject: [Patch 2/2] Staging: winbond: Memory & urb freed
Message-Id: <51A8C27B.9090003@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Memory & urb should be freed before exiting from the function, I think.

Note: This patch is to be applied after applying the earlier patch i.e [patch 1/2]

Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

---
 drivers/staging/winbond/wb35reg.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff -uprN a/drivers/staging/winbond/wb35reg.c b/drivers/staging/winbond/wb35reg.c
--- a/drivers/staging/winbond/wb35reg.c	2013-05-31 20:03:17.000000000 +0530
+++ b/drivers/staging/winbond/wb35reg.c	2013-05-31 20:21:39.856010583 +0530
@@ -69,6 +69,9 @@ unsigned char Wb35Reg_BurstWrite(struct
 	/* Start EP0VM */
 	Wb35Reg_EP0VM_start(pHwData);
 
+	kfree(reg_queue);
+	usb_free_urb(urb);
+
 	return true;
 }
 
@@ -211,6 +214,9 @@ unsigned char Wb35Reg_Write(struct hw_da
 	/* Start EP0VM */
 	Wb35Reg_EP0VM_start(pHwData);
 
+	kfree(reg_queue);
+	usb_free_urb(urb);
+
 	return true;
 }
 
@@ -277,6 +283,9 @@ unsigned char Wb35Reg_WriteWithCallbackV
 	/* Start EP0VM */
 	Wb35Reg_EP0VM_start(pHwData);
 
+	kfree(reg_queue);
+	usb_free_urb(urb);
+
 	return true;
 }
 
@@ -381,6 +390,9 @@ unsigned char Wb35Reg_Read(struct hw_dat
 	/* Start EP0VM */
 	Wb35Reg_EP0VM_start(pHwData);
 
+	kfree(reg_queue);
+	usb_free_urb(urb);
+
 	return true;
 }
 
