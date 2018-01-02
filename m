From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 02 Jan 2018 13:28:00 +0000
Subject: [PATCH 04/12] PCI: qcom: account for const type of of_device_id.data
Message-Id: <1514899688-27844-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1514899688-27844-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1514899688-27844-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: kernel-janitors@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org

This driver creates various const structures that it stores in the
data field of an of_device_id array.

Adding const to the declaration of the location that receives the
const value from the data field ensures that the compiler will
continue to check that the value is not modified.  Furthermore, the
const-discarding cast on the extraction from the data field is no
longer needed.

Done using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pci/dwc/pcie-qcom.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/pci/dwc/pcie-qcom.c b/drivers/pci/dwc/pcie-qcom.c
--- a/drivers/pci/dwc/pcie-qcom.c
+++ b/drivers/pci/dwc/pcie-qcom.c
@@ -171,7 +171,7 @@ struct qcom_pcie {
 	union qcom_pcie_resources res;
 	struct phy *phy;
 	struct gpio_desc *reset;
-	struct qcom_pcie_ops *ops;
+	const struct qcom_pcie_ops *ops;
 };
 
 #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
@@ -1234,7 +1234,7 @@ static int qcom_pcie_probe(struct platfo
 
 	pcie->pci = pci;
 
-	pcie->ops = (struct qcom_pcie_ops *)of_device_get_match_data(dev);
+	pcie->ops = of_device_get_match_data(dev);
 
 	pcie->reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_LOW);
 	if (IS_ERR(pcie->reset))

