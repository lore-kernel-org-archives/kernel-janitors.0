From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Thu, 30 May 2013 04:47:02 +0000
Subject: [Patch] Staging: winbond: usb_free_urb(NULL) is safe
Message-Id: <51A6D6F6.1050204@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

usb_free_urb(NULL) is safe. So, the check was removed. Also, couple of checkpatch.pl fixes

Signed-off-by: Harsh Kumar <harsh1kumar@gmail.com>

---
 drivers/staging/winbond/phy_calibration.c |    2 +-
 drivers/staging/winbond/wb35reg.c         |   14 +++++---------
 drivers/staging/winbond/wb35rx.c          |    3 +--
 3 files changed, 7 insertions(+), 12 deletions(-)

diff -uprN a/drivers/staging/winbond/phy_calibration.c b/drivers/staging/winbond/phy_calibration.c
--- a/drivers/staging/winbond/phy_calibration.c	2013-05-28 00:52:15.000000000 +0530
+++ b/drivers/staging/winbond/phy_calibration.c	2013-05-28 01:54:07.000000000 +0530
@@ -296,7 +296,7 @@ void _sin_cos(s32 angle, s32 *sin, s32 *
 	}
 }
 
-static unsigned char hal_get_dxx_reg(struct hw_data *pHwData, u16 number, u32 * pValue)
+static unsigned char hal_get_dxx_reg(struct hw_data *pHwData, u16 number, u32 *pValue)
 {
 	if (number < 0x1000)
 		number += 0x1000;
diff -uprN a/drivers/staging/winbond/wb35reg.c b/drivers/staging/winbond/wb35reg.c
--- a/drivers/staging/winbond/wb35reg.c	2013-05-28 00:52:26.000000000 +0530
+++ b/drivers/staging/winbond/wb35reg.c	2013-05-28 02:11:35.000000000 +0530
@@ -64,12 +64,11 @@ unsigned char Wb35Reg_BurstWrite(struct
 
 		return true;
 	} else {
-		if (urb)
-			usb_free_urb(urb);
+		usb_free_urb(urb);
 		kfree(reg_queue);
 		return false;
 	}
-   return false;
+	return false;
 }
 
 void Wb35Reg_Update(struct hw_data *pHwData,  u16 RegisterNo,  u32 RegisterValue)
@@ -206,8 +205,7 @@ unsigned char Wb35Reg_Write(struct hw_da
 
 		return true;
 	} else {
-		if (urb)
-			usb_free_urb(urb);
+		usb_free_urb(urb);
 		kfree(reg_queue);
 		return false;
 	}
@@ -270,8 +268,7 @@ unsigned char Wb35Reg_WriteWithCallbackV
 		Wb35Reg_EP0VM_start(pHwData);
 		return true;
 	} else {
-		if (urb)
-			usb_free_urb(urb);
+		usb_free_urb(urb);
 		kfree(reg_queue);
 		return false;
 	}
@@ -374,8 +371,7 @@ unsigned char Wb35Reg_Read(struct hw_dat
 
 		return true;
 	} else {
-		if (urb)
-			usb_free_urb(urb);
+		usb_free_urb(urb);
 		kfree(reg_queue);
 		return false;
 	}
diff -uprN a/drivers/staging/winbond/wb35rx.c b/drivers/staging/winbond/wb35rx.c
--- a/drivers/staging/winbond/wb35rx.c	2013-05-28 00:52:40.000000000 +0530
+++ b/drivers/staging/winbond/wb35rx.c	2013-05-28 02:25:16.000000000 +0530
@@ -343,8 +343,7 @@ void Wb35Rx_destroy(struct hw_data *pHwD
 	} while (pWb35Rx->EP3vm_state != VM_STOP);
 	msleep(10); /* Delay for waiting function exit */
 
-	if (pWb35Rx->RxUrb)
-		usb_free_urb(pWb35Rx->RxUrb);
+	usb_free_urb(pWb35Rx->RxUrb);
 	pr_debug("Wb35Rx_destroy OK\n");
 }
 
