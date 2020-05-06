From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 May 2020 12:52:55 +0000
Subject: [PATCH -next] staging: kpc2000: fix error return code in kp2000_pcie_probe()
Message-Id: <20200506125255.90336-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, simon@nikanor.nu, jeremy@azazel.net, dan.carpenter@oracle.com
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function. Also
removed var 'rv' since we can use 'err' instead.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/staging/kpc2000/kpc2000/core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/kpc2000/kpc2000/core.c b/drivers/staging/kpc2000/kpc2000/core.c
index 7b00d7069e21..14e07742dc9d 100644
--- a/drivers/staging/kpc2000/kpc2000/core.c
+++ b/drivers/staging/kpc2000/kpc2000/core.c
@@ -298,7 +298,6 @@ static int kp2000_pcie_probe(struct pci_dev *pdev,
 {
 	int err = 0;
 	struct kp2000_device *pcard;
-	int rv;
 	unsigned long reg_bar_phys_addr;
 	unsigned long reg_bar_phys_len;
 	unsigned long dma_bar_phys_addr;
@@ -445,11 +444,11 @@ static int kp2000_pcie_probe(struct pci_dev *pdev,
 	if (err < 0)
 		goto err_release_dma;
 
-	rv = request_irq(pcard->pdev->irq, kp2000_irq_handler, IRQF_SHARED,
+	err = request_irq(pcard->pdev->irq, kp2000_irq_handler, IRQF_SHARED,
 			 pcard->name, pcard);
-	if (rv) {
+	if (err) {
 		dev_err(&pcard->pdev->dev,
-			"%s: failed to request_irq: %d\n", __func__, rv);
+			"%s: failed to request_irq: %d\n", __func__, err);
 		goto err_disable_msi;
 	}
