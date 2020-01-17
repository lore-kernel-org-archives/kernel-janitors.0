From: Colin King <colin.king@canonical.com>
Date: Fri, 17 Jan 2020 09:31:24 +0000
Subject: [PATCH][next] usb: musb: fix spelling mistake: "periperal" -> "peripheral"
Message-Id: <20200117093124.97965-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/musb/musb_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 71691a1f8ae3..f616fb489542 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -540,7 +540,7 @@ int musb_set_peripheral(struct musb *musb)
 				   devctl & MUSB_DEVCTL_BDEVICE, 5000,
 				   1000000);
 	if (error) {
-		dev_err(musb->controller, "%s: could not set periperal: %02x\n",
+		dev_err(musb->controller, "%s: could not set peripheral: %02x\n",
 			__func__, devctl);
 
 		return error;
-- 
2.24.0
