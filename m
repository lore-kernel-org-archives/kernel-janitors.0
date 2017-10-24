From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Oct 2017 09:44:18 +0000
Subject: [PATCH] drm/amd/powerplay: fix amd_powerplay_reset()
Message-Id: <20171024094418.za4qacxapyrud2m4@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Rex Zhu <Rex.Zhu-5C7GfCeVMHo@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Huang Rui <ray.huang-5C7GfCeVMHo@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Eric Huang <JinHuiEric.Huang-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

We accidentally inverted an if statement and turned amd_powerplay_reset()
into a no-op.

Fixes: ae97988fc89e ("drm/amd/powerplay: tidy up ret checks in amd_powerplay.c (v3)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
IMHO, tidying unreadable double negatives is tricky and error prone but
still worth it in the long run.

diff --git a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
index 3c8ef4bfc205..0f8b6dc853a5 100644
--- a/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
+++ b/drivers/gpu/drm/amd/powerplay/amd_powerplay.c
@@ -1184,7 +1184,7 @@ int amd_powerplay_reset(void *handle)
 	int ret;
 
 	ret = pp_check(instance);
-	if (!ret)
+	if (ret)
 		return ret;
 
 	ret = pp_hw_fini(instance);
