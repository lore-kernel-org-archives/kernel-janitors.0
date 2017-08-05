From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 05 Aug 2017 10:47:12 +0000
Subject: [PATCH 5/6] staging: bcm2835-camera: constify vb2_ops structures
Message-Id: <1501930033-18249-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501930033-18249-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501930033-18249-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

These vb2_ops structures are only stored in the ops field of a
vb2_queue structure, which is declared as const.  Thus the vb2_ops
structures themselves can be const.

Done with the help of Coccinelle.

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@
static struct vb2_ops i@p = { ... };

@ok@
identifier r.i;
struct vb2_queue e;
position p;
@@
e.ops = &i@p;

@bad@
position p != {r.p,ok.p};
identifier r.i;
struct vb2_ops e;
@@
e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct vb2_ops i = { ... };
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index a11e047..5af758a 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -642,7 +642,7 @@ static void bm2835_mmal_unlock(struct vb2_queue *vq)
 	mutex_unlock(&dev->mutex);
 }
 
-static struct vb2_ops bm2835_mmal_video_qops = {
+static const struct vb2_ops bm2835_mmal_video_qops = {
 	.queue_setup = queue_setup,
 	.buf_prepare = buffer_prepare,
 	.buf_queue = buffer_queue,

