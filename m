From: Colin King <colin.king@canonical.com>
Date: Fri, 10 Aug 2018 08:02:17 +0000
Subject: [PATCH] net: chelsio: cxgb2: remove unused array pci_speed
Message-Id: <20180810080217.26758-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Array pci_speed is defined but is never used hence it is redundant
and can be removed.

Cleans up clang warning:
warning: 'pci_speed' defined but not used [-Wunused-const-variable=]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/chelsio/cxgb/cxgb2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb/cxgb2.c b/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
index 8623be13bf86..0ccdde366ae1 100644
--- a/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
+++ b/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
@@ -109,10 +109,6 @@ static int disable_msi = 0;
 module_param(disable_msi, int, 0);
 MODULE_PARM_DESC(disable_msi, "Disable Message Signaled Interrupt (MSI)");
 
-static const char pci_speed[][4] = {
-	"33", "66", "100", "133"
-};
-
 /*
  * Setup MAC to receive the types of packets we want.
  */
-- 
2.17.1
