From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 22 Jul 2016 15:47:10 +0000
Subject: [PATCH 1/4] GPU-DRM-Etnaviv: Delete unnecessary checks before two function calls
Message-Id: <9638cd74-ffc5-d9ee-a40c-9b60e860ad8b@users.sourceforge.net>
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
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 22 Jul 2016 15:56:15 +0200

The functions drm_gem_object_unreference_unlocked() and vunmap() perform
also input parameter validation.
Thus the tests around their calls are not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 8c6f750..8eee742 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -535,8 +535,7 @@ void etnaviv_gem_describe_objects(struct etnaviv_drm_private *priv,
 
 static void etnaviv_gem_shmem_release(struct etnaviv_gem_object *etnaviv_obj)
 {
-	if (etnaviv_obj->vaddr)
-		vunmap(etnaviv_obj->vaddr);
+	vunmap(etnaviv_obj->vaddr);
 	put_pages(etnaviv_obj);
 }
 
@@ -670,9 +669,7 @@ static struct drm_gem_object *__etnaviv_gem_new(struct drm_device *dev,
 	return obj;
 
 fail:
-	if (obj)
-		drm_gem_object_unreference_unlocked(obj);
-
+	drm_gem_object_unreference_unlocked(obj);
 	return ERR_PTR(ret);
 }
 
-- 
2.9.2

