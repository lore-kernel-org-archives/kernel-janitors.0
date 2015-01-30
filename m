From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jan 2015 08:27:49 +0000
Subject: [patch] drm/nouveau: indent an if statement
Message-Id: <20150130082749.GA21357@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

This if statement is correct but it wasn't indented, so it looked like
some code was missing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c
index 42cac13..f20e4ca 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mxm/nv50.c
@@ -182,7 +182,7 @@ mxm_show_unmatched(struct nvkm_mxm *mxm, u8 *data, void *info)
 {
 	u64 desc = *(u64 *)data;
 	if ((desc & 0xf0) != 0xf0)
-	nv_info(mxm, "unmatched output device 0x%016llx\n", desc);
+		nv_info(mxm, "unmatched output device 0x%016llx\n", desc);
 	return true;
 }
 
