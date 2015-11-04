From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Nov 2015 13:25:09 +0000
Subject: [patch] drm/amdgpu: cleanup on error in amdgpu_cs_ioctl()
Message-Id: <20151104132509.GB20966@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Chunming Zhou <david1.zhou@amd.com>
Cc: Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "monk.liu" <monk.liu@amd.com>

We recently changed the locking in this function and now there is a
missing unlock on error.  Also there are some other resources that we
should probably release as well...

Fixes: f48b2659f521 ('drm/amdgpu: fix the broken vm->mutex V2')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I'm not terribly familiar with this code.  Please review this one a bit
carefully.

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 27ef528..dfc4d02 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -876,8 +876,10 @@ int amdgpu_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		struct amdgpu_job *job;
 		struct amdgpu_ring * ring =  parser->ibs->ring;
 		job = kzalloc(sizeof(struct amdgpu_job), GFP_KERNEL);
-		if (!job)
-			return -ENOMEM;
+		if (!job) {
+			r = -ENOMEM;
+			goto out;
+		}
 		job->base.sched = &ring->sched;
 		job->base.s_entity = &parser->ctx->rings[ring->idx].entity;
 		job->adev = parser->adev;
