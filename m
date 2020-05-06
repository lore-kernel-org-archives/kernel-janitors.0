From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 May 2020 13:47:35 +0000
Subject: [PATCH -next v2] staging: kpc2000: fix error return code in kp2000_pcie_probe()
Message-Id: <20200506134735.102041-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506125255.90336-1-weiyongjun1@huawei.com>
In-Reply-To: <20200506125255.90336-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, simon@nikanor.nu, jeremy@azazel.net, dan.carpenter@oracle.com
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function. Also
removed var 'rv' since we can use 'err' instead.

Fixes: 7dc7967fc39a ("staging: kpc2000: add initial set of Daktronics drivers")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
v1 -> v2: fix code aligns and add fixes
---
 drivers/staging/kpc2000/kpc2000/core.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/kpc2000/kpc2000/core.c b/drivers/staging/kpc2000/kpc2000/core.c
index 7b00d7069e21..358d7b2f4ad1 100644
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
-			 pcard->name, pcard);
-	if (rv) {
+	err = request_irq(pcard->pdev->irq, kp2000_irq_handler, IRQF_SHARED,
+			  pcard->name, pcard);
+	if (err) {
 		dev_err(&pcard->pdev->dev,
-			"%s: failed to request_irq: %d\n", __func__, rv);
+			"%s: failed to request_irq: %d\n", __func__, err);
 		goto err_disable_msi;
 	}
