From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jun 2017 07:59:15 +0000
Subject: [PATCH] drm/msm: fix an integer overflow test
Message-Id: <20170630075915.crhfqqmjaxq34awz@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark@gmail.com>, Kasin Li <donglil@codeaurora.org>
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We recently added an integer overflow check but it needs an additional
tweak to work properly on 32 bit systems.

The problem is that we're doing the right hand side of the assignment as
type unsigned long so the max it will have an integer overflow instead
of being larger than SIZE_MAX.  That means the "sz > SIZE_MAX" condition
is never true even on 32 bit systems.  We need to first cast it to u64
and then do the math.

Fixes: 4a630fadbb29 ("drm/msm: Fix potential buffer overflow issue")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 6bfca7470141..8095658e8cb4 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -34,8 +34,8 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		struct msm_gpu *gpu, uint32_t nr_bos, uint32_t nr_cmds)
 {
 	struct msm_gem_submit *submit;
-	uint64_t sz = sizeof(*submit) + (nr_bos * sizeof(submit->bos[0])) +
-		(nr_cmds * sizeof(submit->cmd[0]));
+	uint64_t sz = sizeof(*submit) + ((u64)nr_bos * sizeof(submit->bos[0])) +
+		((u64)nr_cmds * sizeof(submit->cmd[0]));
 
 	if (sz > SIZE_MAX)
 		return NULL;
