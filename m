From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Oct 2012 08:27:14 +0000
Subject: [patch 2/2] target: strlen() doesn't count the terminator
Message-Id: <20121002082714.GE12398@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We need to take the terminator into consideration here or the last
character gets silently truncated away later.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/gadget/tcm_usb_gadget.c b/drivers/usb/gadget/tcm_usb_gadget.c
index 1ad4a69..97e68b3 100644
--- a/drivers/usb/gadget/tcm_usb_gadget.c
+++ b/drivers/usb/gadget/tcm_usb_gadget.c
@@ -1812,7 +1812,7 @@ static ssize_t tcm_usbg_tpg_store_nexus(
 		ret = tcm_usbg_drop_nexus(tpg);
 		return (!ret) ? count : ret;
 	}
-	if (strlen(page) > USBG_NAMELEN) {
+	if (strlen(page) >= USBG_NAMELEN) {
 		pr_err("Emulated NAA Sas Address: %s, exceeds"
 				" max: %d\n", page, USBG_NAMELEN);
 		return -EINVAL;
