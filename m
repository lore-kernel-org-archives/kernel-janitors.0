From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Sep 2013 08:06:11 +0000
Subject: [patch 4/4] skd: remove unneeded NULL check
Message-Id: <20130913080610.GH19211@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Jeff Moyer <jmoyer@redhat.com>, Ramprasad Chinthekindi <rchinthekindi@stec-inc.com>, Akhil Bhansali <abhansali@stec-inc.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We already dereferenced "skdev" a few lines earlier in the debug code so
my static checker complains.  I audited the callers and "skdev" is never
NULL here so I have removed the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
index 20ad843..827f927 100644
--- a/drivers/block/skd_main.c
+++ b/drivers/block/skd_main.c
@@ -2909,7 +2909,7 @@ static void skd_do_inq_page_da(struct skd_device *skdev,
 
 	inq.page_code = DRIVER_INQ_EVPD_PAGE_CODE;
 
-	if (skdev && skdev->pdev && skdev->pdev->bus) {
+	if (skdev->pdev && skdev->pdev->bus) {
 		skd_get_link_info(skdev->pdev,
 				  &inq.pcie_link_speed, &inq.pcie_link_lanes);
 		inq.pcie_bus_number = cpu_to_be16(skdev->pdev->bus->number);
