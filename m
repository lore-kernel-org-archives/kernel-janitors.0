From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 07:24:52 +0000
Subject: [PATCH 1/5] GPU-DRM-nouveau: Use kmalloc_array() in nvbios_iccsense_parse()
Message-Id: <77983748-8b67-5ee1-e94b-5f3b8c221ad0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
In-Reply-To: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Martin Peres <martin.peres@free.fr>, Roy Spliet <rspliet@eclipso.eu>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 22:22:14 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c
index 0843280..91cf1ee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c
@@ -72,7 +72,9 @@ nvbios_iccsense_parse(struct nvkm_bios *bios, struct nvbios_iccsense *iccsense)
 	}
 
 	iccsense->nr_entry = cnt;
-	iccsense->rail = kmalloc(sizeof(struct pwr_rail_t) * cnt, GFP_KERNEL);
+	iccsense->rail = kmalloc_array(cnt,
+				       sizeof(*iccsense->rail),
+				       GFP_KERNEL);
 	if (!iccsense->rail)
 		return -ENOMEM;
 
-- 
2.10.0

