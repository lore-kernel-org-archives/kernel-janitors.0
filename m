From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Sep 2019 09:24:00 +0000
Subject: [PATCH] staging: vt6656: clean up an indentation issue
Message-Id: <20190927092400.20213-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Quentin Deslandes <quentin.deslandes@itdev.co.uk>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a block of code that is indented incorrectly, add in the
missing tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/vt6656/main_usb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6656/main_usb.c b/drivers/staging/vt6656/main_usb.c
index 856ba97aec4f..3478a10f8025 100644
--- a/drivers/staging/vt6656/main_usb.c
+++ b/drivers/staging/vt6656/main_usb.c
@@ -249,10 +249,10 @@ static int vnt_init_registers(struct vnt_private *priv)
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
2.20.1
