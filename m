From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 20:03:51 +0000
Subject: [PATCH 3/3] sata_mv: Use devm_kcalloc() in mv_platform_probe()
Message-Id: <139a8a18-37ae-a87f-9fec-a05670325f66@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <df754c7a-2100-7169-0d40-b981ccd952a1@users.sourceforge.net>
In-Reply-To: <df754c7a-2100-7169-0d40-b981ccd952a1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ide@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Tejun Heo <tj@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 21:36:43 +0200

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "devm_kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data types by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/ata/sata_mv.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
index b66bcda88320..49abe386c7f6 100644
--- a/drivers/ata/sata_mv.c
+++ b/drivers/ata/sata_mv.c
@@ -4118,13 +4118,15 @@ static int mv_platform_probe(struct platform_device *pdev)
 
 	if (!host || !hpriv)
 		return -ENOMEM;
-	hpriv->port_clks = devm_kzalloc(&pdev->dev,
-					sizeof(struct clk *) * n_ports,
+	hpriv->port_clks = devm_kcalloc(&pdev->dev,
+					n_ports,
+					sizeof(*hpriv->port_clks),
 					GFP_KERNEL);
 	if (!hpriv->port_clks)
 		return -ENOMEM;
-	hpriv->port_phys = devm_kzalloc(&pdev->dev,
-					sizeof(struct phy *) * n_ports,
+	hpriv->port_phys = devm_kcalloc(&pdev->dev,
+					n_ports,
+					sizeof(*hpriv->port_phys),
 					GFP_KERNEL);
 	if (!hpriv->port_phys)
 		return -ENOMEM;
-- 
2.12.2

