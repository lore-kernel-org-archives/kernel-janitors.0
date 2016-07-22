From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 22 Jul 2016 15:51:22 +0000
Subject: [PATCH 4/4] GPU-DRM-Etnaviv: Optimize error handling in etnaviv_gem_new_userptr()
Message-Id: <4af34ce6-62c6-7966-1ae3-0877d5ac909d@users.sourceforge.net>
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
 <5317A59D.4@users.sourceforge.net>
 <00ca5af9-674a-73ce-b423-1ce41d426942@users.sourceforge.net>
In-Reply-To: <00ca5af9-674a-73ce-b423-1ce41d426942@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 22 Jul 2016 17:17:48 +0200

Refactor this function implementation so that the
drm_gem_object_unreference_unlocked() function will only be called once
in case of a failure according to the Linux coding style recommendation
for centralized exiting of functions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 0a5c00c..007577c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -909,15 +909,12 @@ int etnaviv_gem_new_userptr(struct drm_device *dev, struct drm_file *file,
 	get_task_struct(current);
 
 	ret = etnaviv_gem_obj_add(dev, &etnaviv_obj->base);
-	if (ret) {
-		drm_gem_object_unreference_unlocked(&etnaviv_obj->base);
-		return ret;
-	}
+	if (ret)
+		goto unreference;
 
 	ret = drm_gem_handle_create(file, &etnaviv_obj->base, handle);
-
+unreference:
 	/* drop reference from allocate - handle holds it now */
 	drm_gem_object_unreference_unlocked(&etnaviv_obj->base);
-
 	return ret;
 }
-- 
2.9.2

