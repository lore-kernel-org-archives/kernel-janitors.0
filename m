From: Emil Goode <emilgoode@gmail.com>
Date: Sun, 16 Jun 2013 11:46:38 +0000
Subject: [PATCH] USB: EHCI: Remove double assignment of .start in ehci_msp_hc_driver
Message-Id: <1371383198-11383-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: stern@rowland.harvard.edu, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

This patch removes a double assignment of .start in struct hc_driver
ehci_msp_hc_driver and also makes the code look more tidy.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/usb/host/ehci-pmcmsp.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-pmcmsp.c b/drivers/usb/host/ehci-pmcmsp.c
index 363890e..601e208 100644
--- a/drivers/usb/host/ehci-pmcmsp.c
+++ b/drivers/usb/host/ehci-pmcmsp.c
@@ -291,8 +291,7 @@ static const struct hc_driver ehci_msp_hc_driver = {
 	/*
 	 * basic lifecycle operations
 	 */
-	.reset =		ehci_msp_setup,
-	.start =		ehci_run,
+	.reset			= ehci_msp_setup,
 	.shutdown		= ehci_shutdown,
 	.start			= ehci_run,
 	.stop			= ehci_stop,
-- 
1.7.10.4

