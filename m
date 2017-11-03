From: Colin King <colin.king@canonical.com>
Date: Fri, 03 Nov 2017 06:58:27 +0000
Subject: [PATCH] media: v4l: async: fix return of unitialized variable ret
Message-Id: <20171103065827.25988-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hans.verkuil@cisco.com>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A shadow declaration of variable ret is being assigned a return error
status and this value is being lost when the error exit goto's jump
out of the local scope. This leads to an uninitalized error return value
in the outer scope being returned. Fix this by removing the inner scoped
declaration of variable ret.

Detected by CoverityScan, CID#1460380 ("Uninitialized scalar variable")

Fixes: fb45f436b818 ("media: v4l: async: Fix notifier complete callback error handling")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 49f7eccc76db..7020b2e6d158 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -550,7 +550,6 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
 		struct v4l2_device *v4l2_dev  			v4l2_async_notifier_find_v4l2_dev(notifier);
 		struct v4l2_async_subdev *asd;
-		int ret;
 
 		if (!v4l2_dev)
 			continue;
-- 
2.14.1

