From: Colin King <colin.king@canonical.com>
Date: Wed, 13 Feb 2019 13:25:59 +0000
Subject: [PATCH] media: exynos4-is: remove redundant check on type
Message-Id: <20190213132559.30900-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check to see if type is V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE is redundant
as this has been already checked at the start of the function and if
it's not that value then -ENOSYS is returned. Hence the sprintf can be
replaced by a simpler string copy.

Detected by CoverityScan, CID#1309450 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/exynos4-is/fimc-isp-video.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-isp-video.c b/drivers/media/platform/exynos4-is/fimc-isp-video.c
index de6bd28f7e31..bb35a2017f21 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp-video.c
@@ -606,9 +606,7 @@ int fimc_isp_video_device_register(struct fimc_isp *isp,
 
 	vdev = &iv->ve.vdev;
 	memset(vdev, 0, sizeof(*vdev));
-	snprintf(vdev->name, sizeof(vdev->name), "fimc-is-isp.%s",
-			type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE ?
-			"capture" : "output");
+	strscpy(vdev->name, "fimc-is-isp.capture", sizeof(vdev->name));
 	vdev->queue = q;
 	vdev->fops = &isp_video_fops;
 	vdev->ioctl_ops = &isp_video_ioctl_ops;
-- 
2.20.1
