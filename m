From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Nov 2013 22:18:47 +0000
Subject: [patch] drm/nv50/disp: min/max are reversed in nv50_crtc_gamma_set()
Message-Id: <20131127221847.GB20822@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1940853357.8722109.1385508166826.JavaMail.root@redhat.com>
In-Reply-To: <1940853357.8722109.1385508166826.JavaMail.root@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org

We should be taking the minimum here instead of the max.  It could lead
to a buffer overflow.

Fixes: 438d99e3b175 ('drm/nvd0/disp: initial crtc object implementation')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
index f8e66c08b11a..4e384a2f99c3 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.c
+++ b/drivers/gpu/drm/nouveau/nv50_display.c
@@ -1265,7 +1265,7 @@ nv50_crtc_gamma_set(struct drm_crtc *crtc, u16 *r, u16 *g, u16 *b,
 		    uint32_t start, uint32_t size)
 {
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-	u32 end = max(start + size, (u32)256);
+	u32 end = min_t(u32, start + size, 256);
 	u32 i;
 
 	for (i = start; i < end; i++) {
