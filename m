From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Apr 2016 11:03:30 +0000
Subject: [patch] drm/nouveau/gem: silence uninitialized variable warning
Message-Id: <20160401110330.GB6048@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Pekka Enberg <penberg@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>

The static checker checker is warning that we could hit the first
continue; on every iteration through the loop and never initialize
"ret".  It seems unlikely but we may as well silence the warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index a0865c4..fd36b24 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -370,7 +370,8 @@ validate_init(struct nouveau_channel *chan, struct drm_file *file_priv,
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct drm_device *dev = chan->drm->dev;
 	int trycnt = 0;
-	int ret, i;
+	int ret = -ENOENT;
+	int i;
 	struct nouveau_bo *res_bo = NULL;
 	LIST_HEAD(gart_list);
 	LIST_HEAD(vram_list);
