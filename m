From: Colin King <colin.king@canonical.com>
Date: Sun, 06 Oct 2019 15:04:29 +0000
Subject: [PATCH] media: vpx3220: make array input_vals static, makes object smaller
Message-Id: <20191006150429.24311-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array input_vals on the stack but instead make it
static. Makes the object code smaller by 106 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  11744	   3536	    128	  15408	   3c30	drivers/media/i2c/vpx3220.o

After:
   text	   data	    bss	    dec	    hex	filename
  11574	   3600	    128	  15302	   3bc6	drivers/media/i2c/vpx3220.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/vpx3220.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/vpx3220.c b/drivers/media/i2c/vpx3220.c
index 39f66e7a0e42..8be03fe5928c 100644
--- a/drivers/media/i2c/vpx3220.c
+++ b/drivers/media/i2c/vpx3220.c
@@ -375,7 +375,7 @@ static int vpx3220_s_routing(struct v4l2_subdev *sd,
 		 input = 1: COMPOSITE  input
 		 input = 2: SVHS       input  */
 
-	const int input_vals[3][2] = {
+	static const int input_vals[3][2] = {
 		{0x0c, 0},
 		{0x0d, 0},
 		{0x0e, 1}
-- 
2.20.1
