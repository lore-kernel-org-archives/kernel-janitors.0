From: Colin King <colin.king@canonical.com>
Date: Wed, 05 Aug 2020 10:20:15 +0000
Subject: [PATCH] drm/omap: fix spelling mistake "propert" -> "property"
Message-Id: <20200805102015.14891-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/omapdrm/dss/venc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index e0817934ee16..0fa8f677b647 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -781,7 +781,7 @@ static int venc_probe_of(struct venc_device *venc)
 		venc->type = OMAP_DSS_VENC_TYPE_SVIDEO;
 		break;
 	default:
-		dev_err(&venc->pdev->dev, "bad channel propert '%d'\n",
+		dev_err(&venc->pdev->dev, "bad channel property '%d'\n",
 			channels);
 		r = -EINVAL;
 		goto err;
-- 
2.27.0
