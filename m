From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 10 May 2020 13:03:57 +0000
Subject: [PATCH] firmware: xilinx: Fix an error handling path in 'zynqmp_firmware_probe()'
Message-Id: <20200510130357.233364-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: michal.simek@xilinx.com, rajan.vaja@xilinx.com, jolly.shah@xilinx.com, gregkh@linuxfoundation.org, tejas.patel@xilinx.com, manish.narani@xilinx.com, ravi.patel@xilinx.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

If 'mfd_add_devices()' fails, we must undo 'zynqmp_pm_api_debugfs_init()'
otherwise some debugfs directory and files will be left.

Just move the call to 'zynqmp_pm_api_debugfs_init()' a few lines below to
fix the issue.

Fixes: e23d9c6d0d49 ("drivers: soc: xilinx: Add ZynqMP power domain driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not related to this fix, but I think that:
   - a call to 'of_platform_depopulate()' is missing in the remove function
   - we shouldn't return of_platform_populate(); directly because we
     don't have the opportunity to call 'mfd_remove_devices()' as done in
     the remove function, and 'of_platform_depopulate()' for what have
     been populated yet

I'm not familiar with this API, so I just point it out to get feedback.
---
 drivers/firmware/xilinx/zynqmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 8095fa84d5d7..8d1ff2454e2e 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1235,8 +1235,6 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
 	pr_info("%s Trustzone version v%d.%d\n", __func__,
 		pm_tz_version >> 16, pm_tz_version & 0xFFFF);
 
-	zynqmp_pm_api_debugfs_init();
-
 	ret = mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE, firmware_devs,
 			      ARRAY_SIZE(firmware_devs), NULL, 0, NULL);
 	if (ret) {
@@ -1244,6 +1242,8 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	zynqmp_pm_api_debugfs_init();
+
 	return of_platform_populate(dev->of_node, NULL, NULL, dev);
 }
 
-- 
2.25.1
