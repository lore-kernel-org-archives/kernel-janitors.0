From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 May 2019 09:22:44 +0000
Subject: [PATCH] drm/i915/gvt: Fix an error code in ppgtt_populate_spt_by_guest_entry()
Message-Id: <20190513092244.GA12077@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Aleksei Gimbitskii <aleksei.gimbitskii@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org

"ret" is uninitialized on this path but it should be -EINVAL.

Fixes: 930c8dfea4b8 ("drm/i915/gvt: Check if get_next_pt_type() always returns a valid value")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 08c74e65836b..244ad1729764 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1076,8 +1076,10 @@ static struct intel_vgpu_ppgtt_spt *ppgtt_populate_spt_by_guest_entry(
 	} else {
 		int type = get_next_pt_type(we->type);
 
-		if (!gtt_type_is_pt(type))
+		if (!gtt_type_is_pt(type)) {
+			ret = -EINVAL;
 			goto err;
+		}
 
 		spt = ppgtt_alloc_spt_gfn(vgpu, type, ops->get_pfn(we), ips);
 		if (IS_ERR(spt)) {
-- 
2.18.0
