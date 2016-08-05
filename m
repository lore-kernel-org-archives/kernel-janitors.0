From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 05 Aug 2016 08:56:46 +0000
Subject: [PATCH 06/11] mmc: sdhci-of-esdhc: use of_property_read_bool
Message-Id: <1470387411-15879-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: kernel-janitors@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org

Use of_property_read_bool to check for the existence of a property.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2;
statement S2,S1;
@@
-       if (of_get_property(e1,e2,NULL))
+       if (of_property_read_bool(e1,e2))
        S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mmc/host/sdhci-of-esdhc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-esdhc.c b/drivers/mmc/host/sdhci-of-esdhc.c
index 239be2f..fb71c86 100644
--- a/drivers/mmc/host/sdhci-of-esdhc.c
+++ b/drivers/mmc/host/sdhci-of-esdhc.c
@@ -583,7 +583,7 @@ static int sdhci_esdhc_probe(struct platform_device *pdev)
 
 	np = pdev->dev.of_node;
 
-	if (of_get_property(np, "little-endian", NULL))
+	if (of_property_read_bool(np, "little-endian"))
 		host = sdhci_pltfm_init(pdev, &sdhci_esdhc_le_pdata,
 					sizeof(struct sdhci_esdhc));
 	else

