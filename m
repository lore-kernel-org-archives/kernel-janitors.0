From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 26 May 2018 09:35:08 +0000
Subject: [PATCH -next] PCI: mobiveil: Add terminate entry for of_device_id tables
Message-Id: <1527327308-69566-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

Make sure of_device_id tables are NULL terminated.

Fixes: 0db7e807fa68 ("PCI: mobiveil: Add Mobiveil PCIe Host Bridge IP driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/pci/host/pcie-mobiveil.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/host/pcie-mobiveil.c b/drivers/pci/host/pcie-mobiveil.c
index f3fbe9d..4d6c20e 100644
--- a/drivers/pci/host/pcie-mobiveil.c
+++ b/drivers/pci/host/pcie-mobiveil.c
@@ -845,6 +845,7 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
 
 static const struct of_device_id mobiveil_pcie_of_match[] = {
 	{.compatible = "mbvl,gpex40-pcie",},
+	{},
 };
 
 MODULE_DEVICE_TABLE(of, mobiveil_pcie_of_match);

