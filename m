From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 May 2017 16:59:23 +0000
Subject: [PATCH 7/9] drm/i915: Combine substrings for a message in gen6_drpc_info()
Message-Id: <da7e1514-a1d0-289d-e697-10df1bc7ed0b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
In-Reply-To: <39c8a155-cf89-1aa5-9ca6-4e9ccf3aa602@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 May 2017 14:15:00 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: quoted string split across lines

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/i915/i915_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 6f3119d40c50..dbd52ea89fb4 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -1529,8 +1529,8 @@ static int gen6_drpc_info(struct seq_file *m)
 
 	forcewake_count = READ_ONCE(dev_priv->uncore.fw_domain[FW_DOMAIN_ID_RENDER].wake_count);
 	if (forcewake_count) {
-		seq_puts(m, "RC information inaccurate because somebody "
-			    "holds a forcewake reference \n");
+		seq_puts(m,
+			 "RC information inaccurate because somebody holds a forcewake reference.\n");
 	} else {
 		/* NB: we cannot use forcewake, else we read the wrong values */
 		while (count++ < 50 && (I915_READ_NOTRACE(FORCEWAKE_ACK) & 1))
-- 
2.12.2

