From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 23 Jan 2018 02:09:21 +0000
Subject: [PATCH -next] ntb_hw_switchtec: Make function switchtec_ntb_remove() static
Message-Id: <1516673361-170397-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>, Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-pci@vger.kernel.org, linux-ntb@googlegroups.com, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

drivers/ntb/hw/mscc/ntb_hw_switchtec.c:1552:6: warning:
 symbol 'switchtec_ntb_remove' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/ntb/hw/mscc/ntb_hw_switchtec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
index a1d547b6..f624ae2 100644
--- a/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
+++ b/drivers/ntb/hw/mscc/ntb_hw_switchtec.c
@@ -1549,8 +1549,8 @@ static int switchtec_ntb_add(struct device *dev,
 	return rc;
 }
 
-void switchtec_ntb_remove(struct device *dev,
-			  struct class_interface *class_intf)
+static void switchtec_ntb_remove(struct device *dev,
+				 struct class_interface *class_intf)
 {
 	struct switchtec_dev *stdev = to_stdev(dev);
 	struct switchtec_ntb *sndev = stdev->sndev;

