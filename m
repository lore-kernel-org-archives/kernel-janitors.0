From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2018 09:09:45 +0000
Subject: [PATCH] drm/amd/display: indent an if statement
Message-Id: <20180814090944.qjm4vxyrjdqxu4d7@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171104061232.5bq5hwr2p2ca2cl7@mwanda>
In-Reply-To: <20171104061232.5bq5hwr2p2ca2cl7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, Charlene Liu <charlene.liu-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Harry Wentland <harry.wentland-5C7GfCeVMHo@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dmytro Laktyushkin <Dmytro.Laktyushkin-5C7GfCeVMHo@public.gmane.org>, Yongqiang Sun <yongqiang.sun-5C7GfCeVMHo@public.gmane.org>, Tony Cheng <tony.cheng-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

The if statement isn't indented and it makes static checkers complain.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 4ca41d6e3bcf..d82ba58c720f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -349,7 +349,7 @@ static bool is_dp_and_hdmi_sharable(
 
 	if (stream1->clamping.c_depth != COLOR_DEPTH_888 ||
 	    stream2->clamping.c_depth != COLOR_DEPTH_888)
-	return false;
+		return false;
 
 	return true;
 
