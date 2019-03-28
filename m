From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Mar 2019 14:41:38 +0000
Subject: [PATCH] media: wl128x: Fix some error handling in fmc_prepare()
Message-Id: <20190328144137.GS32590@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The st_register() returns have changed over time, but these days it
never returns -1.  We should just be checking for any negative error
codes.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/radio/wl128x/fmdrv_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/radio/wl128x/fmdrv_common.c b/drivers/media/radio/wl128x/fmdrv_common.c
index 1614809f7d35..c3b90f2ac93f 100644
--- a/drivers/media/radio/wl128x/fmdrv_common.c
+++ b/drivers/media/radio/wl128x/fmdrv_common.c
@@ -1521,7 +1521,7 @@ int fmc_prepare(struct fmdev *fmdev)
 		}
 
 		ret = 0;
-	} else if (ret = -1) {
+	} else if (ret < 0) {
 		fmerr("st_register failed %d\n", ret);
 		return -EAGAIN;
 	}
-- 
2.17.1
