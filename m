From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 May 2016 08:09:20 +0000
Subject: [patch v2] qed: Remove a stray tab
Message-Id: <20160517080920.GD11011@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CO2PR11MB00880C22B76A203A30BCDF8297480@CO2PR11MB0088.namprd11.prod.outlook.com>
In-Reply-To: <CO2PR11MB00880C22B76A203A30BCDF8297480@CO2PR11MB0088.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuval Mintz <Yuval.Mintz@qlogic.com>
Cc: Ariel Elior <Ariel.Elior@qlogic.com>, everest-linux-l2@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This line was indented more than it should be.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Yuval Mintz <Yuval.Mintz@qlogic.com>
---
v2: fix a typo

diff --git a/drivers/net/ethernet/qlogic/qed/qed_main.c b/drivers/net/ethernet/qlogic/qed/qed_main.c
index 6ffc21d..05fcb25 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_main.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_main.c
@@ -177,7 +177,7 @@ static int qed_init_pci(struct qed_dev *cdev,
 	}
 
 	if (IS_PF(cdev)) {
-			cdev->db_phys_addr = pci_resource_start(cdev->pdev, 2);
+		cdev->db_phys_addr = pci_resource_start(cdev->pdev, 2);
 		cdev->db_size = pci_resource_len(cdev->pdev, 2);
 		cdev->doorbells = ioremap_wc(cdev->db_phys_addr, cdev->db_size);
 		if (!cdev->doorbells) {
