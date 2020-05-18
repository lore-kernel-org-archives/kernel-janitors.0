From: Colin King <colin.king@canonical.com>
Date: Mon, 18 May 2020 17:09:10 +0000
Subject: [PATCH][next] drm/i915: fix incorrect return of an error status
Message-Id: <20200518170910.58292-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when a call to intel_atomic_get_dbuf_state fails the
error value being returns is a potentially uninitialized value
in variable ret.  Fix this by returning the error value of
new_dbuf_state.

Addresses-Coverity: ("Uninitialized scalar value")
Fixes: 3cf43cdc63fb ("drm/i915: Introduce proper dbuf state")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/i915/intel_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index a21e36ed1a77..762a5184fc69 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -5917,7 +5917,7 @@ skl_ddb_add_affected_pipes(struct intel_atomic_state *state)
 
 		new_dbuf_state = intel_atomic_get_dbuf_state(state);
 		if (IS_ERR(new_dbuf_state))
-			return ret;
+			return PTR_ERR(new_dbuf_state);
 
 		old_dbuf_state = intel_atomic_get_old_dbuf_state(state);
 
-- 
2.25.1
