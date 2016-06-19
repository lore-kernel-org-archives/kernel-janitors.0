From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 19 Jun 2016 06:44:23 +0000
Subject: [PATCH] drm/nouveau/gr/gk20a: delete unneeded second newline
Message-Id: <1466318663-2670-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs@redhat.com>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c
index 4ca8ed1..de8b806 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gk20a.c
@@ -361,6 +361,5 @@ gk20a_gr_new(struct nvkm_device *device, int index, struct nvkm_gr **pgr)
 	if (ret)
 		return ret;
 
-
 	return 0;
 }

