From: Sidong Yang <realwakka@gmail.com>
Date: Thu, 28 Mar 2019 09:49:14 +0000
Subject: [PATCH v2] staging: pi433: Fix rf69_set_tx_cfg() logic
Message-Id: <20190328094914.GA13981@sidong>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>, Rico Schrage <rico.schrage@gmail.com>, Sophie Matter <sophie.matter@web.de>, Hugo Lefeuvre <hle@owl.eu.com>, Dan Carpenter <dan.carpenter@oracle.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Moved code to configure sync to where check enable_sync option before.
There is no need to check enable_sync twice. Configuring sync should be
executed immediately after enabling sync.

Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
v2: remove obvious comment. reordered size/value/enable sync functions.

 drivers/staging/pi433/pi433_if.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 53928af696a6..8fa7b3346170 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -319,6 +319,12 @@ rf69_set_tx_cfg(struct pi433_device *dev, struct pi433_tx_cfg *tx_cfg)
 	}
 
 	if (tx_cfg->enable_sync = OPTION_ON) {
+		ret = rf69_set_sync_size(dev->spi, tx_cfg->sync_length);
+		if (ret < 0)
+			return ret;
+		ret = rf69_set_sync_values(dev->spi, tx_cfg->sync_pattern);
+		if (ret < 0)
+			return ret;
 		ret = rf69_enable_sync(dev->spi);
 		if (ret < 0)
 			return ret;
@@ -348,16 +354,6 @@ rf69_set_tx_cfg(struct pi433_device *dev, struct pi433_tx_cfg *tx_cfg)
 			return ret;
 	}
 
-	/* configure sync, if enabled */
-	if (tx_cfg->enable_sync = OPTION_ON) {
-		ret = rf69_set_sync_size(dev->spi, tx_cfg->sync_length);
-		if (ret < 0)
-			return ret;
-		ret = rf69_set_sync_values(dev->spi, tx_cfg->sync_pattern);
-		if (ret < 0)
-			return ret;
-	}
-
 	return 0;
 }
 
-- 
2.17.1
