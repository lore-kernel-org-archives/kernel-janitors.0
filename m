From: Julia Lawall <julia@diku.dk>
Date: Sun, 27 Dec 2009 21:27:28 +0000
Subject: [PATCH 3/5] drivers/gpu: Correct NULL test
Message-Id: <Pine.LNX.4.64.0912272227130.20548@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie, dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Test the just-allocated value for NULL rather than some other value.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,y;
statement S;
@@

x = \(kmalloc\|kcalloc\|kzalloc\)(...);
(
if ((x) = NULL) S
|
if (
-   y
+   x
       = NULL)
 S
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/gpu/drm/nouveau/nouveau_grctx.c        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_grctx.c b/drivers/gpu/drm/nouveau/nouveau_grctx.c
index 419f4c2..c7ebec6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_grctx.c
+++ b/drivers/gpu/drm/nouveau/nouveau_grctx.c
@@ -97,8 +97,8 @@ nouveau_grctx_prog_load(struct drm_device *dev)
 		}
 
 		pgraph->ctxvals = kmalloc(fw->size, GFP_KERNEL);
-		if (!pgraph->ctxprog) {
-			NV_ERROR(dev, "OOM copying ctxprog\n");
+		if (!pgraph->ctxvals) {
+			NV_ERROR(dev, "OOM copying ctxvals\n");
 			release_firmware(fw);
 			nouveau_grctx_fini(dev);
 			return -ENOMEM;
