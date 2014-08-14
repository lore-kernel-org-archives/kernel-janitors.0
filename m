From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Aug 2014 08:03:18 +0000
Subject: [patch] drm/nouveau: indent an else statement
Message-Id: <20140814080318.GA4757@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org

This else statement wasn't indented so it was confusing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nouveau_usif.c b/drivers/gpu/drm/nouveau/nouveau_usif.c
index cb1182d..41c9b404 100644
--- a/drivers/gpu/drm/nouveau/nouveau_usif.c
+++ b/drivers/gpu/drm/nouveau/nouveau_usif.c
@@ -83,9 +83,10 @@ usif_notify(const void *header, u32 length, const void *data, u32 size)
 		if (WARN_ON(!(ntfy = (void *)(unsigned long)rep->v0.token)))
 			return NVIF_NOTIFY_DROP;
 		BUG_ON(rep->v0.route != NVDRM_NOTIFY_USIF);
-	} else
-	if (WARN_ON(1))
-		return NVIF_NOTIFY_DROP;
+	} else {
+		if (WARN_ON(1))
+			return NVIF_NOTIFY_DROP;
+	}
 
 	if (WARN_ON(!ntfy->p || ntfy->reply != (length + size)))
 		return NVIF_NOTIFY_DROP;
