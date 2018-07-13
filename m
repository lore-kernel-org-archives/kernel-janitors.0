From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Jul 2018 09:36:43 +0000
Subject: [PATCH] usb: host: u132-hcd: remove redundant variable num_ports
Message-Id: <20180713093643.16103-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <felipe.balbi@linux.intel.com>, Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable num_ports is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'num_ports' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/u132-hcd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/host/u132-hcd.c b/drivers/usb/host/u132-hcd.c
index 032b8652910a..072bd5d5738e 100644
--- a/drivers/usb/host/u132-hcd.c
+++ b/drivers/usb/host/u132-hcd.c
@@ -3062,7 +3062,6 @@ static int u132_probe(struct platform_device *pdev)
 	int retval;
 	u32 control;
 	u32 rh_a = -1;
-	u32 num_ports;
 
 	msleep(100);
 	if (u132_exiting > 0)
@@ -3077,7 +3076,6 @@ static int u132_probe(struct platform_device *pdev)
 	retval = ftdi_read_pcimem(pdev, roothub.a, &rh_a);
 	if (retval)
 		return retval;
-	num_ports = rh_a & RH_A_NDP;	/* refuse to confuse usbcore */
 	if (pdev->dev.dma_mask)
 		return -EINVAL;
 
-- 
2.17.1

