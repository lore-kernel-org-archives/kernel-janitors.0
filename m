From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 22 Jul 2016 15:50:04 +0000
Subject: [PATCH 3/4] GPU-DRM-Etnaviv: Rename jump labels
Message-Id: <dde7270f-9bd0-4e0c-04bf-0f1de990869c@users.sourceforge.net>
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
Date: Fri, 22 Jul 2016 16:51:00 +0200

Adjust jump targets according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 851a8ba..0a5c00c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -308,17 +308,17 @@ struct etnaviv_vram_mapping *etnaviv_gem_mapping_get(
 				mapping = NULL;
 			mutex_unlock(&gpu->mmu->lock);
 			if (mapping)
-				goto out;
+				goto unlock;
 		} else {
 			mapping->use += 1;
-			goto out;
+			goto unlock;
 		}
 	}
 
 	pages = etnaviv_gem_get_pages(etnaviv_obj);
 	if (IS_ERR(pages)) {
 		ret = PTR_ERR(pages);
-		goto out;
+		goto unlock;
 	}
 
 	/*
@@ -330,7 +330,7 @@ struct etnaviv_vram_mapping *etnaviv_gem_mapping_get(
 		mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
 		if (!mapping) {
 			ret = -ENOMEM;
-			goto out;
+			goto unlock;
 		}
 
 		INIT_LIST_HEAD(&mapping->scan_node);
@@ -349,7 +349,7 @@ struct etnaviv_vram_mapping *etnaviv_gem_mapping_get(
 	else
 		list_add_tail(&mapping->obj_node, &etnaviv_obj->vram_list);
 
-out:
+unlock:
 	mutex_unlock(&etnaviv_obj->lock);
 
 	if (ret)
@@ -646,7 +646,7 @@ static struct drm_gem_object *__etnaviv_gem_new(struct drm_device *dev,
 	ret = etnaviv_gem_new_impl(dev, size, flags, NULL,
 				   &etnaviv_gem_shmem_ops, &obj);
 	if (ret)
-		goto fail;
+		goto unreference;
 
 	ret = drm_gem_object_init(dev, obj, size);
 	if (ret = 0) {
@@ -664,7 +664,7 @@ static struct drm_gem_object *__etnaviv_gem_new(struct drm_device *dev,
 		return obj;
 	}
 
-fail:
+unreference:
 	drm_gem_object_unreference_unlocked(obj);
 	return ERR_PTR(ret);
 }
-- 
2.9.2

