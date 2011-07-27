From: Dan Carpenter <error27@gmail.com>
Date: Wed, 27 Jul 2011 09:53:40 +0000
Subject: [patch] drm/radeon: off by one in check_reg() functions
Message-Id: <20110727095340.GK3824@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>

This off by one range check was copy and pasted a couple places.
It's not really harmful, but we should fix it anyway.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/radeon/r600_cs.c b/drivers/gpu/drm/radeon/r600_cs.c
index db8ef19..cf83aa0 100644
--- a/drivers/gpu/drm/radeon/r600_cs.c
+++ b/drivers/gpu/drm/radeon/r600_cs.c
@@ -915,12 +915,11 @@ static inline int r600_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u32 idx
 {
 	struct r600_cs_track *track = (struct r600_cs_track *)p->track;
 	struct radeon_cs_reloc *reloc;
-	u32 last_reg = ARRAY_SIZE(r600_reg_safe_bm);
 	u32 m, i, tmp, *ib;
 	int r;
 
 	i = (reg >> 7);
-	if (i > last_reg) {
+	if (i >= ARRAY_SIZE(r600_reg_safe_bm)) {
 		dev_warn(p->dev, "forbidden register 0x%08x at %d\n", reg, idx);
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/radeon/evergreen_cs.c
index 189e865..a134790 100644
--- a/drivers/gpu/drm/radeon/evergreen_cs.c
+++ b/drivers/gpu/drm/radeon/evergreen_cs.c
@@ -428,7 +428,7 @@ static inline int evergreen_cs_check_reg(struct radeon_cs_parser *p, u32 reg, u3
 		last_reg = ARRAY_SIZE(evergreen_reg_safe_bm);
 
 	i = (reg >> 7);
-	if (i > last_reg) {
+	if (i >= last_reg) {
 		dev_warn(p->dev, "forbidden register 0x%08x at %d\n", reg, idx);
 		return -EINVAL;
 	}
