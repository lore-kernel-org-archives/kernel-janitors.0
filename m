From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 May 2017 16:58:15 +0000
Subject: [PATCH 6/9] drm/i915: Add spaces for better code readability
Message-Id: <e173a260-d05b-2102-24e0-f2acab147749@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
In-Reply-To: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 May 2017 14:04:38 +0200

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index d9c699d7245e..6f3119d40c50 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -2358,7 +2358,7 @@ static int i915_llc(struct seq_file *m, void *data)
 
 	seq_printf(m, "LLC: %s\n", yesno(HAS_LLC(dev_priv)));
 	seq_printf(m, "%s: %lluMB\n", edram ? "eDRAM" : "eLLC",
-		   intel_uncore_edram_size(dev_priv)/1024/1024);
+		   intel_uncore_edram_size(dev_priv) / 1024 / 1024);
 
 	return 0;
 }
@@ -4502,7 +4502,7 @@ static void gen9_sseu_device_status(struct drm_i915_private *dev_priv,
 {
 	int s_max = 3, ss_max = 4;
 	int s, ss;
-	u32 s_reg[s_max], eu_reg[2*s_max], eu_mask[2];
+	u32 s_reg[s_max], eu_reg[2 * s_max], eu_mask[2];
 
 	/* BXT has a single slice and at most 3 subslices. */
 	if (IS_GEN9_LP(dev_priv)) {
@@ -4512,8 +4512,8 @@ static void gen9_sseu_device_status(struct drm_i915_private *dev_priv,
 
 	for (s = 0; s < s_max; s++) {
 		s_reg[s] = I915_READ(GEN9_SLICE_PGCTL_ACK(s));
-		eu_reg[2*s] = I915_READ(GEN9_SS01_EU_PGCTL_ACK(s));
-		eu_reg[2*s + 1] = I915_READ(GEN9_SS23_EU_PGCTL_ACK(s));
+		eu_reg[2 * s] = I915_READ(GEN9_SS01_EU_PGCTL_ACK(s));
+		eu_reg[2 * s + 1] = I915_READ(GEN9_SS23_EU_PGCTL_ACK(s));
 	}
 
 	eu_mask[0] = GEN9_PGCTL_SSA_EU08_ACK |
@@ -4547,8 +4547,8 @@ static void gen9_sseu_device_status(struct drm_i915_private *dev_priv,
 				sseu->subslice_mask |= BIT(ss);
 			}
 
-			eu_cnt = 2 * hweight32(eu_reg[2*s + ss/2] &
-					       eu_mask[ss%2]);
+			eu_cnt = 2 * hweight32(eu_reg[2 * s + ss / 2] &
+					       eu_mask[ss % 2]);
 			sseu->eu_total += eu_cnt;
 			sseu->eu_per_subslice = max_t(unsigned int,
 						      sseu->eu_per_subslice,
-- 
2.12.2

