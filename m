From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 27 Apr 2017 09:13:45 +0000
Subject: [PATCH] fpga: region: Fix some error handling
Message-Id: <20170427091345.a6vpeapnesey7k6d@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We need to release some resources if fpga_region_get_manager() fails.

Fixes: 0fa20cdfcc1f ("fpga: fpga-region: device tree control for FPGA")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
index ae4c61aada99..3b6b2f4182a1 100644
--- a/drivers/fpga/fpga-region.c
+++ b/drivers/fpga/fpga-region.c
@@ -245,7 +245,8 @@ static int fpga_region_program_fpga(struct fpga_region *region,
 	mgr = fpga_region_get_manager(region);
 	if (IS_ERR(mgr)) {
 		pr_err("failed to get fpga region manager\n");
-		return PTR_ERR(mgr);
+		ret = PTR_ERR(mgr);
+		goto err_put_region;
 	}
 
 	ret = fpga_region_get_bridges(region, overlay);
@@ -281,6 +282,7 @@ static int fpga_region_program_fpga(struct fpga_region *region,
 	fpga_bridges_put(&region->bridge_list);
 err_put_mgr:
 	fpga_mgr_put(mgr);
+err_put_region:
 	fpga_region_put(region);
 
 	return ret;
