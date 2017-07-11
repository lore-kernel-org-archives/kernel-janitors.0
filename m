From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Jul 2017 19:53:29 +0000
Subject: [PATCH] drm/amdgpu: Off by one sanity checks
Message-Id: <20170711195327.dzwtcsrguzmv3y6t@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, Andres Rodriguez <andresx7@gmail.com>
Cc: Tom St Denis <tom.stdenis@amd.com>, kernel-janitors@vger.kernel.org, amd-gfx@lists.freedesktop.org, Xiangliang Yu <Xiangliang.Yu@amd.com>, dri-devel@lists.freedesktop.org, Ken Wang <Qingqing.Wang@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Monk Liu <Monk.Liu@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>

This is just future proofing code, not something that can be triggered
in real life.  We're testing to make sure we don't shift wrap when we
do "1ull << i" so "i" has to be in the 0-63 range.  If it's 64 then we
have gone too far.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 3a0b69b09ed6..e63925dffd2a 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2425,7 +2425,7 @@ static int gfx_v9_0_kiq_kcq_enable(struct amdgpu_device *adev)
 		/* This situation may be hit in the future if a new HW
 		 * generation exposes more than 64 queues. If so, the
 		 * definition of queue_mask needs updating */
-		if (WARN_ON(i > (sizeof(queue_mask)*8))) {
+		if (WARN_ON(i >= (sizeof(queue_mask)*8))) {
 			DRM_ERROR("Invalid KCQ enabled: %d\n", i);
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index aa5a50f5eac8..85a79829842e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -4564,7 +4564,7 @@ static int gfx_v8_0_kiq_kcq_enable(struct amdgpu_device *adev)
 		/* This situation may be hit in the future if a new HW
 		 * generation exposes more than 64 queues. If so, the
 		 * definition of queue_mask needs updating */
-		if (WARN_ON(i > (sizeof(queue_mask)*8))) {
+		if (WARN_ON(i >= (sizeof(queue_mask)*8))) {
 			DRM_ERROR("Invalid KCQ enabled: %d\n", i);
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 955aa304ff48..0def783889cd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -671,7 +671,7 @@ static int set_sched_resources(struct device_queue_manager *dqm)
 		/* This situation may be hit in the future if a new HW
 		 * generation exposes more than 64 queues. If so, the
 		 * definition of res.queue_mask needs updating */
-		if (WARN_ON(i > (sizeof(res.queue_mask)*8))) {
+		if (WARN_ON(i >= (sizeof(res.queue_mask)*8))) {
 			pr_err("Invalid queue enabled by amdgpu: %d\n", i);
 			break;
 		}
