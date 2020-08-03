From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Aug 2020 14:35:19 +0000
Subject: [PATCH] drm/amd/display: Indent an if statement
Message-Id: <20200803143519.GB346925@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171104061232.5bq5hwr2p2ca2cl7@mwanda>
In-Reply-To: <20171104061232.5bq5hwr2p2ca2cl7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Mauro Rossi <issor.oruam@gmail.com>
Cc: Charlene Liu <Charlene.Liu@amd.com>, Aric Cyr <aric.cyr@amd.com>, Reza Amini <Reza.Amini@amd.com>, Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Samson Tam <Samson.Tam@amd.com>, David Airlie <airlied@linux.ie>, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>, amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Martin Leung <martin.leung@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

The if statement wasn't indented so it's confusing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index ca26714c800e..c6b737dd8425 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -71,7 +71,7 @@ enum dce_version resource_parse_asic_id(struct hw_asic_id asic_id)
 		if (ASIC_REV_IS_TAHITI_P(asic_id.hw_internal_rev) ||
 		    ASIC_REV_IS_PITCAIRN_PM(asic_id.hw_internal_rev) ||
 		    ASIC_REV_IS_CAPEVERDE_M(asic_id.hw_internal_rev))
-		dc_version = DCE_VERSION_6_0;
+			dc_version = DCE_VERSION_6_0;
 		else if (ASIC_REV_IS_OLAND_M(asic_id.hw_internal_rev))
 			dc_version = DCE_VERSION_6_4;
 		else
-- 
2.27.0
