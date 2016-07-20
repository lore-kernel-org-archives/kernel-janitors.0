From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Jul 2016 16:02:42 +0000
Subject: [PATCH] drm/atomic: Delete an unnecessary check before drm_property_unreference_blob()
Message-Id: <aa4cd508-38c3-78d7-a9f2-70e3b06a8fb5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <55998CD5.3080204@users.sourceforge.net>
 <CAEG8a3KgYtd4b6Dk0+TjcX_-gHXWMc5xv367LPvChivjM-uzRg@mail.gmail.com>
 <20150706065346.GA2156@phenom.ffwll.local>
 <563C8B3E.405@users.sourceforge.net>
 <20151116140425.GS16848@phenom.ffwll.local>
In-Reply-To: <20151116140425.GS16848@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Jul 2016 17:54:32 +0200

The drm_property_unreference_blob() function tests whether its argument
is NULL and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/drm_atomic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 3cee084..8d2f111 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -404,8 +404,7 @@ drm_atomic_replace_property_blob(struct drm_property_blob **blob,
 	if (old_blob = new_blob)
 		return;
 
-	if (old_blob)
-		drm_property_unreference_blob(old_blob);
+	drm_property_unreference_blob(old_blob);
 	if (new_blob)
 		drm_property_reference_blob(new_blob);
 	*blob = new_blob;
-- 
2.9.2

