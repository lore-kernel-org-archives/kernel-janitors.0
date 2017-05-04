From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 May 2017 17:00:30 +0000
Subject: [PATCH 8/9] drm/i915: Replace a seq_puts() call by seq_putc() in two functions
Message-Id: <4e4325ec-6b37-9006-1681-dc9a937d5b72@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
In-Reply-To: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 May 2017 14:23:32 +0200

Two single characters (line breaks) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/i915/i915_gem_gtt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gem_gtt.c b/drivers/gpu/drm/i915/i915_gem_gtt.c
index 2aa6b97fd22f..9f64dc3f2d05 100644
--- a/drivers/gpu/drm/i915/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/i915_gem_gtt.c
@@ -1254,7 +1254,7 @@ static void gen8_dump_pdp(struct i915_hw_ppgtt *ppgtt,
 					else
 						seq_puts(m, "  SCRATCH ");
 				}
-				seq_puts(m, "\n");
+				seq_putc(m, '\n');
 			}
 			kunmap_atomic(pt_vaddr);
 		}
@@ -1437,7 +1437,7 @@ static void gen6_dump_ppgtt(struct i915_hw_ppgtt *ppgtt, struct seq_file *m)
 				else
 					seq_puts(m, "  SCRATCH ");
 			}
-			seq_puts(m, "\n");
+			seq_putc(m, '\n');
 		}
 		kunmap_atomic(pt_vaddr);
 	}
-- 
2.12.2

