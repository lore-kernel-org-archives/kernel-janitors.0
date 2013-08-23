From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Aug 2013 20:46:02 +0000
Subject: [patch -next] drm/prime: double lock typo
Message-Id: <20130823204602.GA10229@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org

There is a typo so deadlocks on error instead of unlocking.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 7ae2bfc..276d470 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -552,7 +552,7 @@ fail:
 	 */
 	drm_gem_handle_delete(file_priv, *handle);
 out_unlock:
-	mutex_lock(&dev->object_name_lock);
+	mutex_unlock(&dev->object_name_lock);
 out_put:
 	dma_buf_put(dma_buf);
 	mutex_unlock(&file_priv->prime.lock);
