From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 05 Dec 2017 20:27:05 +0000
Subject: [PATCH 1/4] uwb: Delete an error message for a failed memory allocation in hwarc_probe()
Message-Id: <aee8fcc1-3f35-4e64-bc54-065473ec29d3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <994a4a57-cfe6-91b5-5fc1-d4153cc5b0e6@users.sourceforge.net>
In-Reply-To: <994a4a57-cfe6-91b5-5fc1-d4153cc5b0e6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-usb@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 5 Dec 2017 20:30:50 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/uwb/hwa-rc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/uwb/hwa-rc.c b/drivers/uwb/hwa-rc.c
index 9a53912bdfe9..ecd1f0d60487 100644
--- a/drivers/uwb/hwa-rc.c
+++ b/drivers/uwb/hwa-rc.c
@@ -835,10 +835,9 @@ static int hwarc_probe(struct usb_interface *iface,
 		goto error_rc_alloc;
 	}
 	hwarc = kzalloc(sizeof(*hwarc), GFP_KERNEL);
-	if (hwarc = NULL) {
-		dev_err(dev, "unable to allocate HWA RC instance\n");
+	if (!hwarc)
 		goto error_alloc;
-	}
+
 	hwarc_init(hwarc);
 	hwarc->usb_dev = usb_get_dev(interface_to_usbdev(iface));
 	hwarc->usb_iface = usb_get_intf(iface);
-- 
2.15.1

