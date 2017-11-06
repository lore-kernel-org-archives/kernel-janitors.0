From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Nov 2017 11:43:41 +0000
Subject: [PATCH] drm/amd/display: checking for NULL instead of IS_ERR()
Message-Id: <20171106114340.w6li3f4iltg24bdp@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Cc: Tom St Denis <tom.stdenis-5C7GfCeVMHo@public.gmane.org>, Andrey Grodzovsky <Andrey.Grodzovsky-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "Leo (Sunpeng) Li" <sunpeng.li-5C7GfCeVMHo@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Tony Cheng <Tony.Cheng-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

backlight_device_register() never returns NULL, it returns error
pointers on error so the check here is wrong.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 33a15a1d818c..75f9383f5b9b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1296,7 +1296,7 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
 			&amdgpu_dm_backlight_ops,
 			&props);
 
-	if (NULL = dm->backlight_dev)
+	if (IS_ERR(dm->backlight_dev))
 		DRM_ERROR("DM: Backlight registration failed!\n");
 	else
 		DRM_DEBUG_DRIVER("DM: Registered Backlight device: %s\n", bl_name);
