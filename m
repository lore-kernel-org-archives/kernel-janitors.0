From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 26 Jan 2012 06:13:31 +0000
Subject: [patch] nfc: NULL vs zero in nci_activate_target()
Message-Id: <20120126061330.GA15856@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lauro Ramos Venancio <lauro.venancio@openbossa.org>
Cc: Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, "John W. Linville" <linville@tuxdriver.com>, Ilan Elias <ilane@ti.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a pointer so it should be NULL instead of zero.  Sparse
complains about this stuff:
net/nfc/nci/core.c:447:37: warning: Using plain integer as NULL pointer

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index 12d1d4d..a47e90c 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -444,7 +444,7 @@ static int nci_activate_target(struct nfc_dev *nfc_dev, __u32 target_idx,
 {
 	struct nci_dev *ndev = nfc_get_drvdata(nfc_dev);
 	struct nci_rf_discover_select_param param;
-	struct nfc_target *target = 0;
+	struct nfc_target *target = NULL;
 	int i;
 	int rc = 0;
 
