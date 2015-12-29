From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 21:00:35 +0000
Subject: [PATCH 1/2] mmc-sdricoh_cs: Delete unnecessary variable initialisations in sdricoh_init_mmc()
Message-Id: <5682F473.9040609@users.sourceforge.net>
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
Date: Tue, 29 Dec 2015 21:11:45 +0100

These variables will eventually be set to an appropriate value a bit later.
* host
* iobase
* result

Thus let us omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mmc/host/sdricoh_cs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdricoh_cs.c b/drivers/mmc/host/sdricoh_cs.c
index b7e3057..5e57d9f 100644
--- a/drivers/mmc/host/sdricoh_cs.c
+++ b/drivers/mmc/host/sdricoh_cs.c
@@ -398,10 +398,10 @@ static struct mmc_host_ops sdricoh_ops = {
 static int sdricoh_init_mmc(struct pci_dev *pci_dev,
 			    struct pcmcia_device *pcmcia_dev)
 {
-	int result = 0;
-	void __iomem *iobase = NULL;
+	int result;
+	void __iomem *iobase;
 	struct mmc_host *mmc = NULL;
-	struct sdricoh_host *host = NULL;
+	struct sdricoh_host *host;
 	struct device *dev = &pcmcia_dev->dev;
 	/* map iomem */
 	if (pci_resource_len(pci_dev, SDRICOH_PCI_REGION) !-- 
2.6.3

