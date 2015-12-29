From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 21:02:37 +0000
Subject: [PATCH 2/2] mmc-sdricoh_cs: Less checks in sdricoh_init_mmc() after, error detection
Message-Id: <5682F4ED.4070803@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5682F3AC.7050107@users.sourceforge.net>
In-Reply-To: <5682F3AC.7050107@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mmc@vger.kernel.org, Sascha Sommer <saschasommer@freenet.de>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 21:45:34 +0100

This issue was detected by using the Coccinelle software.

Two pointer checks could be repeated by the sdricoh_init_mmc() function
during error handling even if the relevant properties can be determined
for the involved variables before by source code analysis.

* This implementation detail could be improved by adjustments
  for jump targets according to the Linux coding style convention.

* Drop an unnecessary initialisation for the variable "mmc" then.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mmc/host/sdricoh_cs.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/sdricoh_cs.c b/drivers/mmc/host/sdricoh_cs.c
index 5e57d9f..5ff26ab 100644
--- a/drivers/mmc/host/sdricoh_cs.c
+++ b/drivers/mmc/host/sdricoh_cs.c
@@ -400,7 +400,7 @@ static int sdricoh_init_mmc(struct pci_dev *pci_dev,
 {
 	int result;
 	void __iomem *iobase;
-	struct mmc_host *mmc = NULL;
+	struct mmc_host *mmc;
 	struct sdricoh_host *host;
 	struct device *dev = &pcmcia_dev->dev;
 	/* map iomem */
@@ -419,7 +419,7 @@ static int sdricoh_init_mmc(struct pci_dev *pci_dev,
 	if (readl(iobase + R104_VERSION) != 0x4000) {
 		dev_dbg(dev, "no supported mmc controller found\n");
 		result = -ENODEV;
-		goto err;
+		goto unmap_io;
 	}
 	/* allocate privdata */
 	mmc = pcmcia_dev->priv @@ -427,7 +427,7 @@ static int sdricoh_init_mmc(struct pci_dev *pci_dev,
 	if (!mmc) {
 		dev_err(dev, "mmc_alloc_host failed\n");
 		result = -ENOMEM;
-		goto err;
+		goto unmap_io;
 	}
 	host = mmc_priv(mmc);
 
@@ -451,8 +451,7 @@ static int sdricoh_init_mmc(struct pci_dev *pci_dev,
 	if (sdricoh_reset(host)) {
 		dev_dbg(dev, "could not reset\n");
 		result = -EIO;
-		goto err;
-
+		goto free_host;
 	}
 
 	result = mmc_add_host(mmc);
@@ -461,13 +460,10 @@ static int sdricoh_init_mmc(struct pci_dev *pci_dev,
 		dev_dbg(dev, "mmc host registered\n");
 		return 0;
 	}
-
-err:
-	if (iobase)
-		pci_iounmap(pci_dev, iobase);
-	if (mmc)
-		mmc_free_host(mmc);
-
+free_host:
+	mmc_free_host(mmc);
+unmap_io:
+	pci_iounmap(pci_dev, iobase);
 	return result;
 }
 
-- 
2.6.3

