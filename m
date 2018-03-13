From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Mar 2018 15:50:24 +0000
Subject: [PATCH][usb-next] usb: dwc2: ix spelling mistake: "genereted" -> "generated"
Message-Id: <20180313155024.1195-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Youn <johnyoun@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_warn warning message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/dwc2/hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index dcfda5eb4cac..190f95964000 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -5433,7 +5433,7 @@ int dwc2_host_enter_hibernation(struct dwc2_hsotg *hsotg)
 
 	/* Wait for the HPRT0.PrtSusp register field to be set */
 	if (dwc2_hsotg_wait_bit_set(hsotg, HPRT0, HPRT0_SUSP, 300))
-		dev_warn(hsotg->dev, "Suspend wasn't genereted\n");
+		dev_warn(hsotg->dev, "Suspend wasn't generated\n");
 
 	/*
 	 * We need to disable interrupts to prevent servicing of any IRQ
-- 
2.15.1

