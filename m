From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 03 Feb 2020 15:27:24 +0000
Subject: [PATCH -next] drm/panfrost: Remove set but not used variable 'bo'
Message-Id: <20200203152724.42611-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: YueHaibing <yuehaibing@huawei.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Hulk Robot <hulkci@huawei.com>, linux-media@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/panfrost/panfrost_job.c: In function 'panfrost_job_cleanup':
drivers/gpu/drm/panfrost/panfrost_job.c:278:31: warning:
 variable 'bo' set but not used [-Wunused-but-set-variable]

commit bdefca2d8dc0 ("drm/panfrost: Add the panfrost_gem_mapping concept")
involved this unused variable.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 7c36ec675b73..ccb8546a9342 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -275,12 +275,8 @@ static void panfrost_job_cleanup(struct kref *ref)
 	}
 
 	if (job->bos) {
-		struct panfrost_gem_object *bo;
-
-		for (i = 0; i < job->bo_count; i++) {
-			bo = to_panfrost_bo(job->bos[i]);
+		for (i = 0; i < job->bo_count; i++)
 			drm_gem_object_put_unlocked(job->bos[i]);
-		}
 
 		kvfree(job->bos);
 	}
