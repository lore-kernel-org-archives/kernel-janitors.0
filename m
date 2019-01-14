From: Colin King <colin.king@canonical.com>
Date: Mon, 14 Jan 2019 15:41:25 +0000
Subject: [PATCH] net: sungem: fix indentation, remove a tab
Message-Id: <20190114154125.18455-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The declaration of variable 'found' is one level too deep, fix this by
removing a tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/sun/sungem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sun/sungem.c b/drivers/net/ethernet/sun/sungem.c
index b9221fc1674d..3e7631160384 100644
--- a/drivers/net/ethernet/sun/sungem.c
+++ b/drivers/net/ethernet/sun/sungem.c
@@ -2760,7 +2760,7 @@ static void get_gem_mac_nonobp(struct pci_dev *pdev, unsigned char *dev_addr)
 	void __iomem *p = pci_map_rom(pdev, &size);
 
 	if (p) {
-			int found;
+		int found;
 
 		found = readb(p) = 0x55 &&
 			readb(p + 1) = 0xaa &&
-- 
2.19.1
