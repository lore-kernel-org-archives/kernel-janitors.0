From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 05 Aug 2017 10:47:08 +0000
Subject: [PATCH 1/6] [media] v4l2-pci-skeleton: constify vb2_ops structures
Message-Id: <1501930033-18249-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501930033-18249-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501930033-18249-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org

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
There doesn't seem to be a maintainer for this file.

 samples/v4l/v4l2-pci-skeleton.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/v4l/v4l2-pci-skeleton.c b/samples/v4l/v4l2-pci-skeleton.c
index 93b76c3..483e9bca 100644
--- a/samples/v4l/v4l2-pci-skeleton.c
+++ b/samples/v4l/v4l2-pci-skeleton.c
@@ -282,7 +282,7 @@ static void stop_streaming(struct vb2_queue *vq)
  * vb2_ops_wait_prepare/finish helper functions. If q->lock would be NULL,
  * then this driver would have to provide these ops.
  */
-static struct vb2_ops skel_qops = {
+static const struct vb2_ops skel_qops = {
 	.queue_setup		= queue_setup,
 	.buf_prepare		= buffer_prepare,
 	.buf_queue		= buffer_queue,

