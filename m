From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Apr 2020 09:19:10 +0000
Subject: [PATCH net-next] drm/amd/display: Fix link_detect_sink()
Message-Id: <20200406091910.GA5405@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Melissa Wen <melissa.srw@gmail.com>
Cc: "David (ChunMing) Zhou" <David1.Zhou@amd.com>, kernel-janitors@vger.kernel.org, Chris Park <Chris.Park@amd.com>, Zhan Liu <Zhan.Liu@amd.com>, Leo Li <sunpeng.li@amd.com>, Wenjing Liu <Wenjing.Liu@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <Roman.Li@amd.com>, amd-gfx@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>, David Airlie <airlied@linux.ie>, Lucy Li <lucy.li@amd.com>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, David Galiffi <David.Galiffi@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Anthony Koo <Anthony.Koo@amd.com>

This TODO stub originally had curly braces but we deleted them as part
of a clean up.  Unfortunately that changes the behavior of the code
because now the switch statement is part of the if statement.  Smatch
complains that the indenting doesn't make sense.

    drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:425
    link_detect_sink() warn: if statement not indented

Also I changed "ZAZTODO" to just "TODO".  The ZAZ isn't used anywhere
else.

Fixes: 621514aa4140 ("drm/amd/display: codestyle cleanup on dc_link file until detect_dp func")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Another idea is we should just delete this stub.  Stub code is generally
against kernel style.  I can send a V2 if people want.

 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index a93997ff0419..188670d374a3 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -423,7 +423,7 @@ static enum signal_type link_detect_sink(struct dc_link *link,
 
 	/* PCIE detects the actual connector on add-on board */
 	if (link->link_id.id = CONNECTOR_ID_PCIE)
-		/* ZAZTODO implement PCIE add-on card detection */
+		; /* TODO implement PCIE add-on card detection */
 
 	switch (link->link_id.id) {
 	case CONNECTOR_ID_HDMI_TYPE_A: {
-- 
2.25.1
