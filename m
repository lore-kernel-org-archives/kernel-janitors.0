From: Lionel Debroux <lionel_debroux@yahoo.fr>
Date: Sat, 26 Apr 2014 16:06:15 +0000
Subject: [PATCH] drm: make variable named "refcount" atomic, like most refcounts in the kernel.
Message-Id: <248367.21250.bm@smtp144.mail.ir2.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

Based on PaX.

---

From 7c712cadd97d43d03ff3d7ca04fd85bd8c6eb34a Mon Sep 17 00:00:00 2001
From: Lionel Debroux <lionel_debroux@yahoo.fr>
Date: Sat, 26 Apr 2014 15:53:55 +0200
Subject: drm: make variable named "refcount" atomic, like most refcounts in
 the kernel.

Extracted from the PaX patch.

Signed-off-by: Lionel Debroux <lionel_debroux@yahoo.fr>
Cc: PaX Team <pageexec@freemail.hu>
---
 drivers/gpu/drm/drm_global.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_global.c b/drivers/gpu/drm/drm_global.c
index 3d2e91c..d31c4c9 100644
--- a/drivers/gpu/drm/drm_global.c
+++ b/drivers/gpu/drm/drm_global.c
@@ -36,7 +36,7 @@
 struct drm_global_item {
 	struct mutex mutex;
 	void *object;
-	int refcount;
+	atomic_t refcount;
 };
 
 static struct drm_global_item glob[DRM_GLOBAL_NUM];
@@ -49,7 +49,7 @@ void drm_global_init(void)
 		struct drm_global_item *item = &glob[i];
 		mutex_init(&item->mutex);
 		item->object = NULL;
-		item->refcount = 0;
+		atomic_set(&item->refcount, 0);
 	}
 }
 
@@ -59,7 +59,7 @@ void drm_global_release(void)
 	for (i = 0; i < DRM_GLOBAL_NUM; ++i) {
 		struct drm_global_item *item = &glob[i];
 		BUG_ON(item->object != NULL);
-		BUG_ON(item->refcount != 0);
+		BUG_ON(atomic_read(&item->refcount) != 0);
 	}
 }
 
@@ -69,7 +69,7 @@ int drm_global_item_ref(struct drm_global_reference *ref)
 	struct drm_global_item *item = &glob[ref->global_type];
 
 	mutex_lock(&item->mutex);
-	if (item->refcount = 0) {
+	if (atomic_read(&item->refcount) = 0) {
 		item->object = kzalloc(ref->size, GFP_KERNEL);
 		if (unlikely(item->object = NULL)) {
 			ret = -ENOMEM;
@@ -82,7 +82,7 @@ int drm_global_item_ref(struct drm_global_reference *ref)
 			goto out_err;
 
 	}
-	++item->refcount;
+	atomic_inc(&item->refcount);
 	ref->object = item->object;
 	mutex_unlock(&item->mutex);
 	return 0;
@@ -98,9 +98,9 @@ void drm_global_item_unref(struct drm_global_reference *ref)
 	struct drm_global_item *item = &glob[ref->global_type];
 
 	mutex_lock(&item->mutex);
-	BUG_ON(item->refcount = 0);
+	BUG_ON(atomic_read(&item->refcount) = 0);
 	BUG_ON(ref->object != item->object);
-	if (--item->refcount = 0) {
+	if (atomic_dec_and_test(&item->refcount)) {
 		ref->release(ref);
 		item->object = NULL;
 	}
-- 
1.9.1.506.g7bf272c

