From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 11 Jun 2018 17:20:49 +0000
Subject: [PATCH] fpga: altera-cvp: Fix an error handling path in 'altera_cvp_probe()'
Message-Id: <20180611172049.26630-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: atull@kernel.org, mdf@kernel.org
Cc: linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'fpga_mgr_create()' fails, we should release some resources, as done
in the other error handling path of the function.

Fixes: 7085e2a94f7d ("fpga: manager: change api, don't use drvdata")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/fpga/altera-cvp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/fpga/altera-cvp.c b/drivers/fpga/altera-cvp.c
index dd4edd8f22ce..7fa793672a7a 100644
--- a/drivers/fpga/altera-cvp.c
+++ b/drivers/fpga/altera-cvp.c
@@ -455,8 +455,10 @@ static int altera_cvp_probe(struct pci_dev *pdev,
 
 	mgr = fpga_mgr_create(&pdev->dev, conf->mgr_name,
 			      &altera_cvp_ops, conf);
-	if (!mgr)
-		return -ENOMEM;
+	if (!mgr) {
+		ret = -ENOMEM;
+		goto err_unmap;
+	}
 
 	pci_set_drvdata(pdev, mgr);
 
-- 
2.17.0

