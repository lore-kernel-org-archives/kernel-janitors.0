From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 05:30:33 +0000
Subject: [PATCH] drm/tegra: Delete an unnecessary check before the function call "vunmap"
Message-Id: <b3fbdcaf-1bda-7ce9-935b-2d716727ec39@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <54D335FA.6020101@users.sourceforge.net>
 <559D6E90.1040005@users.sourceforge.net>
 <CAAVeFu+7cF-b0zneA7BTmNcanH9tnbzV32XOFiCbxnK4kz8buw@mail.gmail.com>
In-Reply-To: <CAAVeFu+7cF-b0zneA7BTmNcanH9tnbzV32XOFiCbxnK4kz8buw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, =?UTF-8?Q?Terje_Bergstr=c3=b6m?= <tbergstrom@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, David Airlie <airlied@linux.ie>, Alexandre Courbot <gnurou@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 07:23:42 +0200

The vunmap() function performs also input parameter validation.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/tegra/fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 1b12aa7..e6d71fa 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -68,7 +68,7 @@ static void tegra_fb_destroy(struct drm_framebuffer *framebuffer)
 		struct tegra_bo *bo = fb->planes[i];
 
 		if (bo) {
-			if (bo->pages && bo->vaddr)
+			if (bo->pages)
 				vunmap(bo->vaddr);
 
 			drm_gem_object_unreference_unlocked(&bo->gem);
-- 
2.9.1

