From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 06:07:51 +0000
Subject: [patch] drm/nouveau: testing the wrong variable
Message-Id: <20111018060751.GB27732@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Emil Velikov <emil.l.velikov@gmail.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Martin Peres <martin.peres@ensi-bourges.fr>, Roy Spliet <r.spliet@student.tudelft.nl>

memtimings is a valid pointer here, the intent was to test for
kcalloc() failure.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nouveau_perf.c b/drivers/gpu/drm/nouveau/nouveau_perf.c
index 9f178aa..33d03fb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_perf.c
+++ b/drivers/gpu/drm/nouveau/nouveau_perf.c
@@ -239,7 +239,7 @@ nouveau_perf_init(struct drm_device *dev)
 	if(version = 0x15) {
 		memtimings->timing  				kcalloc(entries, sizeof(*memtimings->timing), GFP_KERNEL);
-		if(!memtimings) {
+		if (!memtimings->timing) {
 			NV_WARN(dev,"Could not allocate memtiming table\n");
 			return;
 		}
