From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Oct 2018 15:30:59 +0000
Subject: [PATCH] drm/nouveau/bios/init:  fix spelling mistake "INIT_GENERIC_CONDITON" -> "INIT_GENERIC_CONDIT
Message-Id: <20181012153059.22052-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in warn message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
index 9cc10e438b3d..003dc8edf1c3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
@@ -831,7 +831,7 @@ init_generic_condition(struct nvbios_init *init)
 			init_exec_set(init, false);
 		break;
 	default:
-		warn("INIT_GENERIC_CONDITON: unknown 0x%02x\n", cond);
+		warn("INIT_GENERIC_CONDITION: unknown 0x%02x\n", cond);
 		init->offset += size;
 		break;
 	}
-- 
2.17.1
