From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 29 Apr 2020 09:35:03 +0000
Subject: [PATCH -next v2] mailbox: zynqmp-ipi: Fix NULL vs IS_ERR() check in zynqmp_ipi_mbox_probe()
Message-Id: <20200429093503.150485-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429073020.83519-1-weiyongjun1@huawei.com>
In-Reply-To: <20200429073020.83519-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>, Michal Simek <michal.simek@xilinx.com>, Wendy Liang <wendy.liang@xilinx.com>, Markus
 Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

In case of error, the function devm_ioremap() returns NULL pointer not
ERR_PTR(). So we should check whether the return value of devm_ioremap()
is NULL instead of IS_ERR.

Fixes: 4981b82ba2ff ("mailbox: ZynqMP IPI mailbox controller")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
v1 ->v2: fix the description and the module name in subject
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 86887c9a349a..f9cc674ba9b7 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -504,10 +504,9 @@ static int zynqmp_ipi_mbox_probe(struct zynqmp_ipi_mbox *ipi_mbox,
 		mchan->req_buf_size = resource_size(&res);
 		mchan->req_buf = devm_ioremap(mdev, res.start,
 					      mchan->req_buf_size);
-		if (IS_ERR(mchan->req_buf)) {
+		if (!mchan->req_buf) {
 			dev_err(mdev, "Unable to map IPI buffer I/O memory\n");
-			ret = PTR_ERR(mchan->req_buf);
-			return ret;
+			return -ENOMEM;
 		}
 	} else if (ret != -ENODEV) {
 		dev_err(mdev, "Unmatched resource %s, %d.\n", name, ret);
@@ -520,10 +519,9 @@ static int zynqmp_ipi_mbox_probe(struct zynqmp_ipi_mbox *ipi_mbox,
 		mchan->resp_buf_size = resource_size(&res);
 		mchan->resp_buf = devm_ioremap(mdev, res.start,
 					       mchan->resp_buf_size);
-		if (IS_ERR(mchan->resp_buf)) {
+		if (!mchan->resp_buf) {
 			dev_err(mdev, "Unable to map IPI buffer I/O memory\n");
-			ret = PTR_ERR(mchan->resp_buf);
-			return ret;
+			return -ENOMEM;
 		}
 	} else if (ret != -ENODEV) {
 		dev_err(mdev, "Unmatched resource %s.\n", name);
@@ -543,10 +541,9 @@ static int zynqmp_ipi_mbox_probe(struct zynqmp_ipi_mbox *ipi_mbox,
 		mchan->req_buf_size = resource_size(&res);
 		mchan->req_buf = devm_ioremap(mdev, res.start,
 					      mchan->req_buf_size);
-		if (IS_ERR(mchan->req_buf)) {
+		if (!mchan->req_buf) {
 			dev_err(mdev, "Unable to map IPI buffer I/O memory\n");
-			ret = PTR_ERR(mchan->req_buf);
-			return ret;
+			return -ENOMEM;
 		}
 	} else if (ret != -ENODEV) {
 		dev_err(mdev, "Unmatched resource %s.\n", name);
@@ -559,10 +556,9 @@ static int zynqmp_ipi_mbox_probe(struct zynqmp_ipi_mbox *ipi_mbox,
 		mchan->resp_buf_size = resource_size(&res);
 		mchan->resp_buf = devm_ioremap(mdev, res.start,
 					       mchan->resp_buf_size);
-		if (IS_ERR(mchan->resp_buf)) {
+		if (!mchan->resp_buf) {
 			dev_err(mdev, "Unable to map IPI buffer I/O memory\n");
-			ret = PTR_ERR(mchan->resp_buf);
-			return ret;
+			return -ENOMEM;
 		}
 	} else if (ret != -ENODEV) {
 		dev_err(mdev, "Unmatched resource %s.\n", name);
