From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Jul 2016 08:46:33 +0000
Subject: [patch 1/2] qxl: check for kmap failures
Message-Id: <20160711084633.GA31411@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@redhat.com>, Alon Levy <alevy@redhat.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If kmap fails, it leads to memory corruption.

Fixes: f64122c1f6ad ('drm: add new QXL driver. (v1.4)')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/qxl/qxl_draw.c b/drivers/gpu/drm/qxl/qxl_draw.c
index 56e1d63..6e6c760 100644
--- a/drivers/gpu/drm/qxl/qxl_draw.c
+++ b/drivers/gpu/drm/qxl/qxl_draw.c
@@ -136,6 +136,8 @@ static int qxl_palette_create_1bit(struct qxl_bo *palette_bo,
 				 * correctly globaly, since that would require
 				 * tracking all of our palettes. */
 	ret = qxl_bo_kmap(palette_bo, (void **)&pal);
+	if (ret)
+		return ret;
 	pal->num_ents = 2;
 	pal->unique = unique++;
 	if (visual = FB_VISUAL_TRUECOLOR || visual = FB_VISUAL_DIRECTCOLOR) {
