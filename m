From: Colin King <colin.king@canonical.com>
Date: Tue, 04 Jul 2017 10:31:24 +0000
Subject: [PATCH] usb: renesas_usbhs: make array type_array static const
Message-Id: <20170704103124.15217-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang <wsa-dev@sang-engineering.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Array type_array can be made static const rather than being
populated on the stack. Makes the object code smaller:

Before:
   text    data     bss     dec     hex filename
   8087    1496       0    9583    256f drivers/usb/renesas_usbhs/pipe.o

After:
   text    data     bss     dec     hex filename
   7883    1584       0    9467    24fb drivers/usb/renesas_usbhs/pipe.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/renesas_usbhs/pipe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/pipe.c b/drivers/usb/renesas_usbhs/pipe.c
index 9396a8c14af8..d811f0550c04 100644
--- a/drivers/usb/renesas_usbhs/pipe.c
+++ b/drivers/usb/renesas_usbhs/pipe.c
@@ -401,7 +401,7 @@ static int usbhsp_setup_pipecfg(struct usbhs_pipe *pipe, int is_host,
 	u16 dir = 0;
 	u16 epnum = 0;
 	u16 shtnak = 0;
-	u16 type_array[] = {
+	static const u16 type_array[] = {
 		[USB_ENDPOINT_XFER_BULK] = TYPE_BULK,
 		[USB_ENDPOINT_XFER_INT]  = TYPE_INT,
 		[USB_ENDPOINT_XFER_ISOC] = TYPE_ISO,
-- 
2.11.0

