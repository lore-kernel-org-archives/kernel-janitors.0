From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Sep 2016 13:06:07 +0000
Subject: [PATCH 25/26] pch_gbe: constify local structures
Message-Id: <1473599168-30561-26-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

For structure types defined in the same file or local header files, find
top-level static structure declarations that have the following
properties:
1. Never reassigned.
2. Address never taken
3. Not passed to a top-level macro call
4. No pointer or array-typed field passed to a function or stored in a
variable.
Declare structures having all of these properties as const.

Done using Coccinelle.
Based on a suggestion by Joe Perches <joe@perches.com>.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The semantic patch seems too long for a commit log, but is in the cover
letter.

 drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index 3cd87a4..6f33258 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -2729,7 +2729,7 @@ static int pch_gbe_minnow_platform_init(struct pci_dev *pdev)
 	return ret;
 }
 
-static struct pch_gbe_privdata pch_gbe_minnow_privdata = {
+static const struct pch_gbe_privdata pch_gbe_minnow_privdata = {
 	.phy_tx_clk_delay = true,
 	.phy_disable_hibernate = true,
 	.platform_init = pch_gbe_minnow_platform_init,

