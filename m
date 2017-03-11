From: Colin King <colin.king@canonical.com>
Date: Sat, 11 Mar 2017 19:48:19 +0000
Subject: [PATCH] staging: atomisp: remove redundant check for client being null
Message-Id: <20170311194819.6772-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Cox <alan@linux.intel.com>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The previous statement checks if client is null, so the null check
when assigning dev is redundant and can be removed.

Detected by CoverityScan, CID#1416555 ("Logically Dead Code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
index 65513ca..2929492 100644
--- a/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/platform/intel-mid/atomisp_gmin_platform.c
@@ -354,7 +354,7 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 	if (!client)
 		return NULL;
 
-	dev = client ? &client->dev : NULL;
+	dev = &client->dev;
 
 	for (i=0; i < MAX_SUBDEVS && gmin_subdevs[i].subdev; i++)
 		;
-- 
2.10.2

