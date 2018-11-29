From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 29 Nov 2018 05:52:13 +0000
Subject: [PATCH -next] drm/tinydrm: Use kmemdup rather than duplicating its implementation in repaper_spi_tra
Message-Id: <1543471233-159568-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: noralf@tronnes.org, airlied@linux.ie
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

use kmemdup rather than duplicating its implementation

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/tinydrm/repaper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tinydrm/repaper.c b/drivers/gpu/drm/tinydrm/repaper.c
index 07f45a0..54d6fe0 100644
--- a/drivers/gpu/drm/tinydrm/repaper.c
+++ b/drivers/gpu/drm/tinydrm/repaper.c
@@ -108,12 +108,11 @@ static int repaper_spi_transfer(struct spi_device *spi, u8 header,
 
 	/* Stack allocated tx? */
 	if (tx && len <= 32) {
-		txbuf = kmalloc(len, GFP_KERNEL);
+		txbuf = kmemdup(tx, len, GFP_KERNEL);
 		if (!txbuf) {
 			ret = -ENOMEM;
 			goto out_free;
 		}
-		memcpy(txbuf, tx, len);
 	}
 
 	if (rx) {
