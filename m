From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Nov 2017 13:17:51 +0000
Subject: [PATCH] staging: fbtft: remove redundant initialization of buf
Message-Id: <20171103131751.7833-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer buf is being set on each iteration of a for-loop and
so the initialization of buf at declaration time is redundant and
can be removed.  Cleans up clang warning:

drivers/staging/fbtft/fb_uc1701.c:130:6: warning: Value stored
to 'buf' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/fbtft/fb_uc1701.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_uc1701.c b/drivers/staging/fbtft/fb_uc1701.c
index b78045fe5393..78899a172c7e 100644
--- a/drivers/staging/fbtft/fb_uc1701.c
+++ b/drivers/staging/fbtft/fb_uc1701.c
@@ -127,7 +127,7 @@ static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, int ye)
 static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
 {
 	u16 *vmem16 = (u16 *)par->info->screen_buffer;
-	u8 *buf = par->txbuf.buf;
+	u8 *buf;
 	int x, y, i;
 	int ret = 0;
 
-- 
2.14.1

