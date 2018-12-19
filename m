From: Colin King <colin.king@canonical.com>
Date: Wed, 19 Dec 2018 16:30:07 +0000
Subject: [PATCH] staging: wilc1000: fix missing read_write setting when reading data
Message-Id: <20181219163007.5329-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adham Abozaeid <adham.abozaeid@microchip.com>, Ajay Singh <ajay.kathat@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the cmd.read_write setting is not initialized so it contains
garbage from the stack.  Fix this by setting it to 0 to indicate a
read is required.

Detected by CoverityScan, CID#1357925 ("Uninitialized scalar variable")

Fixes: c5c77ba18ea6 ("staging: wilc1000: Add SDIO/SPI 802.11 driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wilc1000/wilc_sdio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/wilc1000/wilc_sdio.c b/drivers/staging/wilc1000/wilc_sdio.c
index 27fdfbdda5c0..e2f739fef21c 100644
--- a/drivers/staging/wilc1000/wilc_sdio.c
+++ b/drivers/staging/wilc1000/wilc_sdio.c
@@ -861,6 +861,7 @@ static int sdio_read_int(struct wilc *wilc, u32 *int_status)
 	if (!sdio_priv->irq_gpio) {
 		int i;
 
+		cmd.read_write = 0;
 		cmd.function = 1;
 		cmd.address = 0x04;
 		cmd.data = 0;
-- 
2.19.1
