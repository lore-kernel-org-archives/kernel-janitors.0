From: Colin King <colin.king@canonical.com>
Date: Sun, 14 May 2017 16:36:41 +0000
Subject: [PATCH] fsl_udc_core: fix spelling mistake: "Dectected" -> "Detected"
Message-Id: <20170514163641.6113-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Li Yang <leoli@freescale.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in seq_printf text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index 6f2f71c054be..63ab3d50f3f6 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -2067,7 +2067,7 @@ static int fsl_proc_read(struct seq_file *m, void *v)
 			"Sleep Enable: %d SOF Received Enable: %d "
 			"Reset Enable: %d\n"
 			"System Error Enable: %d "
-			"Port Change Dectected Enable: %d\n"
+			"Port Change Detected Enable: %d\n"
 			"USB Error Intr Enable: %d USB Intr Enable: %d\n\n",
 			(tmp_reg & USB_INTR_DEVICE_SUSPEND) ? 1 : 0,
 			(tmp_reg & USB_INTR_SOF_EN) ? 1 : 0,
-- 
2.11.0

