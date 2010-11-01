From: Christoph Fritz <chf.fritz@googlemail.com>
Date: Mon, 01 Nov 2010 10:32:22 +0000
Subject: [PATCH] drm/i915: opregion_setup: iounmap correct address
Message-Id: <1288607542.3425.4.camel@lovely>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c6d829$pdch63@fmsmga001.fm.intel.com>
In-Reply-To: <c6d829$pdch63@fmsmga001.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In case of an opregion signature mismatch in intel_opregion_setup(),
iounmap the correct address.

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/gpu/drm/i915/intel_opregion.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_opregion.c b/drivers/gpu/drm/i915/intel_opregion.c
index 917c7dc..9b0d9a8 100644
--- a/drivers/gpu/drm/i915/intel_opregion.c
+++ b/drivers/gpu/drm/i915/intel_opregion.c
@@ -512,6 +512,6 @@ int intel_opregion_setup(struct drm_device *dev)
 	return 0;
 
 err_out:
-	iounmap(opregion->header);
+	iounmap(base);
 	return err;
 }
-- 
1.7.1



