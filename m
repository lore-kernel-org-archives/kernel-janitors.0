From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Apr 2012 06:31:54 +0000
Subject: [patch 1/2] target: usb-gadget: silently truncating the last character
Message-Id: <20120417063154.GD26756@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

strlen() doesn't count the NULL character, so this test is off by one.
The result is that sometimes it can silently chop off the last
character of the name.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/target/usb-gadget/usb_gadget.c b/drivers/target/usb-gadget/usb_gadget.c
index f5e7531..ba62bef 100644
--- a/drivers/target/usb-gadget/usb_gadget.c
+++ b/drivers/target/usb-gadget/usb_gadget.c
@@ -1830,7 +1830,7 @@ static ssize_t tcm_usbg_tpg_store_nexus(
 		ret = tcm_usbg_drop_nexus(tpg);
 		return (!ret) ? count : ret;
 	}
-	if (strlen(page) > USBG_NAMELEN) {
+	if (strlen(page) >= USBG_NAMELEN) {
 		pr_err("Emulated NAA Sas Address: %s, exceeds"
 				" max: %d\n", page, USBG_NAMELEN);
 		return -EINVAL;
