From: Colin King <colin.king@canonical.com>
Date: Tue, 20 Oct 2020 14:46:55 +0000
Subject: [PATCH] media: staging: rkisp1: rsz: make const array static, makes object smaller
Message-Id: <20201020144655.53251-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Helen Koike <helen.koike@collabora.com>, Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array dev_names on the stack but instead it
static. Makes the object code smaller by 15 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  17091	   2648	     64	  19803	   4d5b	media/rkisp1/rkisp1-resizer.o

After:
   text	   data	    bss	    dec	    hex	filename
  17012	   2712	     64	  19788	   4d4c	media/rkisp1/rkisp1-resizer.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index 1687d82e6c68..7ca5b47c5bf5 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -763,8 +763,10 @@ static void rkisp1_rsz_unregister(struct rkisp1_resizer *rsz)
 
 static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
 {
-	const char * const dev_names[] = {RKISP1_RSZ_MP_DEV_NAME,
-					  RKISP1_RSZ_SP_DEV_NAME};
+	static const char * const dev_names[] = {
+		RKISP1_RSZ_MP_DEV_NAME,
+		RKISP1_RSZ_SP_DEV_NAME
+	};
 	struct media_pad *pads = rsz->pads;
 	struct v4l2_subdev *sd = &rsz->sd;
 	int ret;
-- 
2.27.0
