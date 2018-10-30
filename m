From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Oct 2018 11:13:33 +0000
Subject: [PATCH] staging: vt6656: clean up few indentation issues
Message-Id: <20181030111333.3181-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up indentation issues

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/vt6656/firmware.c | 2 +-
 drivers/staging/vt6656/main_usb.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6656/firmware.c b/drivers/staging/vt6656/firmware.c
index 38521c338917..205347cff7c4 100644
--- a/drivers/staging/vt6656/firmware.c
+++ b/drivers/staging/vt6656/firmware.c
@@ -42,7 +42,7 @@ int vnt_download_firmware(struct vnt_private *priv)
 	if (rc) {
 		dev_err(dev, "firmware file %s request failed (%d)\n",
 			FIRMWARE_NAME, rc);
-			goto out;
+		goto out;
 	}
 
 	buffer = kmalloc(FIRMWARE_CHUNK_SIZE, GFP_KERNEL);
diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
index ccafcc2c87ac..b613a1d113bb 100644
--- a/drivers/staging/vt6656/main_usb.c
+++ b/drivers/staging/vt6656/main_usb.c
@@ -245,10 +245,10 @@ static int vnt_init_registers(struct vnt_private *priv)
 		} else {
 			priv->tx_antenna_mode = ANT_B;
 
-		if (priv->tx_rx_ant_inv)
-			priv->rx_antenna_mode = ANT_A;
-		else
-			priv->rx_antenna_mode = ANT_B;
+			if (priv->tx_rx_ant_inv)
+				priv->rx_antenna_mode = ANT_A;
+			else
+				priv->rx_antenna_mode = ANT_B;
 		}
 	}
 
-- 
2.19.1
