From: Julia Lawall <julia@diku.dk>
Date: Sat, 19 Dec 2009 07:16:33 +0000
Subject: [PATCH 2/7] drivers/gpu: Use kzalloc for allocating only one thing
Message-Id: <Pine.LNX.4.64.0912190816140.30546@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kzalloc rather than kcalloc(1,...)

The use of the allocated memory that looks like an array is &p->relocs[0],
but this should be the same as p->relocs.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
@@

- kcalloc(1,
+ kzalloc(
          ...)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/gpu/drm/radeon/r600_cs.c    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
index 0d82076..44060b9 100644
--- a/drivers/gpu/drm/radeon/r600_cs.c
+++ b/drivers/gpu/drm/radeon/r600_cs.c
@@ -170,7 +170,7 @@ static int r600_cs_packet_next_reloc_nomm(struct radeon_cs_parser *p,
 			  idx, relocs_chunk->length_dw);
 		return -EINVAL;
 	}
-	*cs_reloc = &p->relocs[0];
+	*cs_reloc = p->relocs;
 	(*cs_reloc)->lobj.gpu_offset = (u64)relocs_chunk->kdata[idx + 3] << 32;
 	(*cs_reloc)->lobj.gpu_offset |= relocs_chunk->kdata[idx + 0];
 	return 0;
@@ -717,7 +717,7 @@ static int r600_cs_parser_relocs_legacy(struct radeon_cs_parser *p)
 	if (p->chunk_relocs_idx = -1) {
 		return 0;
 	}
-	p->relocs = kcalloc(1, sizeof(struct radeon_cs_reloc), GFP_KERNEL);
+	p->relocs = kzalloc(sizeof(struct radeon_cs_reloc), GFP_KERNEL);
 	if (p->relocs = NULL) {
 		return -ENOMEM;
 	}
