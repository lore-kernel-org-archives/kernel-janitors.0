From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Feb 2012 06:22:27 +0000
Subject: [patch] brcm80211: fmac: fix a couple checking after dereference bugs
Message-Id: <20120224062226.GA27261@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brett Rudley <brudley@broadcom.com>
Cc: Roland Vossen <rvossen@broadcom.com>, Arend van Spriel <arend@broadcom.com>, "Franky (Zhenhui) Lin" <frankyl@broadcom.com>, Kan Yan <kanyan@broadcom.com>, "John W. Linville" <linville@tuxdriver.com>, Pieter-Paul Giesberts <pieterpg@broadcom.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

There were two dereferencing before checking for NULL static checker
complaints in this new file.  The list cursor is never NULL so that
check can be removed.  I moved the other dereference after the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/brcm80211/brcmfmac/usb.c b/drivers/net/wireless/brcm80211/brcmfmac/usb.c
index 934ed78..7c54d1d 100644
--- a/drivers/net/wireless/brcm80211/brcmfmac/usb.c
+++ b/drivers/net/wireless/brcm80211/brcmfmac/usb.c
@@ -482,7 +482,7 @@ static void brcmf_usb_free_q(struct list_head *q, bool pending)
 	struct brcmf_usbreq *req, *next;
 	int i = 0;
 	list_for_each_entry_safe(req, next, q, list) {
-		if (!req || !req->urb) {
+		if (!req->urb) {
 			brcmf_dbg(ERROR, "bad req\n");
 			break;
 		}
@@ -712,12 +712,12 @@ static int brcmf_usb_up(struct device *dev)
 	struct brcmf_usbdev_info *devinfo = brcmf_usb_get_businfo(dev);
 	u16 ifnum;
 
-	if (devinfo->bus_pub.state = BCMFMAC_USB_STATE_UP)
-		return 0;
-
 	if (devinfo = NULL)
 		return -EINVAL;
 
+	if (devinfo->bus_pub.state = BCMFMAC_USB_STATE_UP)
+		return 0;
+
 	/* If the USB/HSIC bus in sleep state, wake it up */
 	if (devinfo->suspend_state = USBOS_SUSPEND_STATE_SUSPENDED) {
 		if (brcmf_usb_pnp(devinfo, BCMFMAC_USB_PNP_RESUME) != 0) {
