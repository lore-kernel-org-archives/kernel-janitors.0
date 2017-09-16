From: Colin King <colin.king@canonical.com>
Date: Sat, 16 Sep 2017 16:46:28 +0000
Subject: [PATCH] staging: fbtft: remove redundant initialization of txbuf16
Message-Id: <20170916164628.30034-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

txbuf16 is being initialized at declaration time and then later
set to another value without it being read inbetween, hence making
the initialization redundant.  Fix this by setting txbuf16 just
the once. Also clean up some incorrect indentations. Cleans up
clang build warning:

warning: Value stored to 'txbuf16' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/fbtft/fb_ra8875.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index a899614ce829..6d1cad85957b 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -253,7 +253,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 {
 	u16 *vmem16;
-	__be16 *txbuf16 = par->txbuf.buf;
+	__be16 *txbuf16;
 	size_t remain;
 	size_t to_copy;
 	size_t tx_array_size;
@@ -267,10 +267,10 @@ static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
 	remain = len / 2;
 	vmem16 = (u16 *)(par->info->screen_buffer + offset);
 	tx_array_size = par->txbuf.len / 2;
-		txbuf16 = par->txbuf.buf + 1;
-		tx_array_size -= 2;
-		*(u8 *)(par->txbuf.buf) = 0x00;
-		startbyte_size = 1;
+	txbuf16 = par->txbuf.buf + 1;
+	tx_array_size -= 2;
+	*(u8 *)(par->txbuf.buf) = 0x00;
+	startbyte_size = 1;
 
 	while (remain) {
 		to_copy = min(tx_array_size, remain);
-- 
2.14.1

