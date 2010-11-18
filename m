From: Vasiliy Kulikov <segoon@openwall.com>
Date: Thu, 18 Nov 2010 18:17:05 +0000
Subject: [PATCH 4/4] net: caif: spi: fix potential NULL dereference
Message-Id: <1290104226-31428-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Sjur Braendeland <sjur.brandeland@stericsson.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

alloc_netdev() is not checked here for NULL return value.  dev is
check instead.  It might lead to NULL dereference of ndev.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested.
 Maybe dev is also must be checked here, but it looks like a trivial typo.

 drivers/net/caif/caif_spi.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/caif/caif_spi.c b/drivers/net/caif/caif_spi.c
index 8b4cea5..20da199 100644
--- a/drivers/net/caif/caif_spi.c
+++ b/drivers/net/caif/caif_spi.c
@@ -635,8 +635,8 @@ int cfspi_spi_probe(struct platform_device *pdev)
 
 	ndev = alloc_netdev(sizeof(struct cfspi),
 			"cfspi%d", cfspi_setup);
-	if (!dev)
-		return -ENODEV;
+	if (!ndev)
+		return -ENOMEM;
 
 	cfspi = netdev_priv(ndev);
 	netif_stop_queue(ndev);
-- 
1.7.0.4

