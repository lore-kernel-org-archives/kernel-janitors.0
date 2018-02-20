From: Christopher Diaz Riveros <chrisadr@gentoo.org>
Date: Tue, 20 Feb 2018 16:30:33 +0000
Subject: [PATCH-next] staging: net: netlogic: Remove unneeded cast
Message-Id: <20180220163033.14172-1-chrisadr@gentoo.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ganesanr@broadcom.com, gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, jchandra@broadcom.com, linux-kernel@vger.kernel.org

Fix Coccinelle alert:

drivers/staging//netlogic/xlr_net.c:996:12-30: WARNING: casting value returned by memory allocation function to (struct xlr_adapter *) is useless.

This issue was detected by using the Coccinelle software.

Signed-off-by: Christopher Diaz Riveros <chrisadr@gentoo.org>
---
 drivers/staging/netlogic/xlr_net.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/netlogic/xlr_net.c b/drivers/staging/netlogic/xlr_net.c
index 30532d8c310b..e461168313bf 100644
--- a/drivers/staging/netlogic/xlr_net.c
+++ b/drivers/staging/netlogic/xlr_net.c
@@ -993,8 +993,7 @@ static int xlr_net_probe(struct platform_device *pdev)
 	/*
 	 * Allocate our adapter data structure and attach it to the device.
 	 */
-	adapter = (struct xlr_adapter *)
-		devm_kzalloc(&pdev->dev, sizeof(*adapter), GFP_KERNEL);
+	adapter = devm_kzalloc(&pdev->dev, sizeof(*adapter), GFP_KERNEL);
 	if (!adapter)
 		return -ENOMEM;
 
-- 
2.16.2

