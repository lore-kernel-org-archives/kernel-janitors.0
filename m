From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Fri, 02 Nov 2012 09:19:45 +0000
Subject: [PATCH] staging: wlan-ng: hfa384x_usb.c: fixed a coding style issue
Message-Id: <1351847985-974-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: devendra.aaru@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

checkpatch.pl throws error message for the current code. This patch fixes
coding style issue.

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/wlan-ng/hfa384x_usb.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/wlan-ng/hfa384x_usb.c b/drivers/staging/wlan-ng/hfa384x_usb.c
index f180c3d..c1a8cb6 100644
--- a/drivers/staging/wlan-ng/hfa384x_usb.c
+++ b/drivers/staging/wlan-ng/hfa384x_usb.c
@@ -171,11 +171,11 @@ static void hfa384x_ctlxout_callback(struct urb *urb);
 static void hfa384x_usbin_callback(struct urb *urb);
 
 static void
-hfa384x_usbin_txcompl(wlandevice_t *wlandev, hfa384x_usbin_t * usbin);
+hfa384x_usbin_txcompl(wlandevice_t *wlandev, hfa384x_usbin_t *usbin);
 
 static void hfa384x_usbin_rx(wlandevice_t *wlandev, struct sk_buff *skb);
 
-static void hfa384x_usbin_info(wlandevice_t *wlandev, hfa384x_usbin_t * usbin);
+static void hfa384x_usbin_info(wlandevice_t *wlandev, hfa384x_usbin_t *usbin);
 
 static void
 hfa384x_usbout_tx(wlandevice_t *wlandev, hfa384x_usbout_t *usbout);
@@ -285,7 +285,7 @@ static inline const char *ctlxstr(CTLX_STATE s)
 	return ctlx_str[s];
 };
 
-static inline hfa384x_usbctlx_t *get_active_ctlx(hfa384x_t * hw)
+static inline hfa384x_usbctlx_t *get_active_ctlx(hfa384x_t *hw)
 {
 	return list_entry(hw->ctlxq.active.next, hfa384x_usbctlx_t, list);
 }
-- 
1.7.9.5

