From: Colin King <colin.king@canonical.com>
Date: Thu, 14 Dec 2017 11:40:21 +0000
Subject: [PATCH] net: alteon: acenic: clean up indentation issue
Message-Id: <20171214114021.5300-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jes Sorensen <jes@trained-monkey.org>, linux-acenic@sunsite.dk, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a hunk of code that is incorrectly indented with spaces
and rather than a tab.  Clean this up.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/alteon/acenic.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/alteon/acenic.c b/drivers/net/ethernet/alteon/acenic.c
index a1a52eb53b14..8f71b79b4949 100644
--- a/drivers/net/ethernet/alteon/acenic.c
+++ b/drivers/net/ethernet/alteon/acenic.c
@@ -1436,13 +1436,13 @@ static int ace_init(struct net_device *dev)
 	ace_set_txprd(regs, ap, 0);
 	writel(0, &regs->RxRetCsm);
 
-       /*
-	* Enable DMA engine now.
-	* If we do this sooner, Mckinley box pukes.
-	* I assume it's because Tigon II DMA engine wants to check
-	* *something* even before the CPU is started.
-	*/
-       writel(1, &regs->AssistState);  /* enable DMA */
+	/*
+	 * Enable DMA engine now.
+	 * If we do this sooner, Mckinley box pukes.
+	 * I assume it's because Tigon II DMA engine wants to check
+	 * *something* even before the CPU is started.
+	 */
+	writel(1, &regs->AssistState);  /* enable DMA */
 
 	/*
 	 * Start the NIC CPU
-- 
2.14.1

