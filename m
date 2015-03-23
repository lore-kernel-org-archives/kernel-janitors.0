From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Mar 2015 09:37:12 +0000
Subject: [patch] drm/nouveau/fb: remove unneeded an condition
Message-Id: <20150323093712.GD558@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>

We checked "ver" and "ramcfg.size" before and they haven't changed so
static checkers complain when we test them again here.  "rammap.data"
isn't be NULL so "ramcfg.data" is also not NULL so there is no need to
check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
index de9f395..e465635 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgf100.c
@@ -157,10 +157,6 @@ gf100_ram_calc(struct nvkm_fb *pfb, u32 freq)
 	}
 
 	ramcfg.data = rammap.data + rammap.size + (strap * ramcfg.size);
-	if (!ramcfg.data || ver != 0x10 || ramcfg.size < 0x0e) {
-		nv_error(pfb, "invalid/missing ramcfg entry\n");
-		return -EINVAL;
-	}
 
 	/* lookup memory timings, if bios says they're present */
 	strap = nv_ro08(bios, ramcfg.data + 0x01);
