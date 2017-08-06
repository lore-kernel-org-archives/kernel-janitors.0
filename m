From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 06 Aug 2017 08:25:20 +0000
Subject: [PATCH 11/12] [media] exynos4-is: constify v4l2_m2m_ops structures
Message-Id: <1502007921-22968-12-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502007921-22968-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502007921-22968-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

The v4l2_m2m_ops structures are only passed as the only
argument to v4l2_m2m_init, which is declared as const.
Thus the v4l2_m2m_ops structures themselves can be const.

Done with the help of Coccinelle.

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@
static struct v4l2_m2m_ops i@p = { ... };

@ok1@
identifier r.i;
position p;
@@
v4l2_m2m_init(&i@p)

@bad@
position p != {r.p,ok1.p};
identifier r.i;
struct v4l2_m2m_ops e;
@@
e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct v4l2_m2m_ops i = { ... };
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/platform/exynos4-is/fimc-m2m.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-m2m.c b/drivers/media/platform/exynos4-is/fimc-m2m.c
index d8724fe..9027d0b 100644
--- a/drivers/media/platform/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/exynos4-is/fimc-m2m.c
@@ -704,7 +704,7 @@ static int fimc_m2m_release(struct file *file)
 	.mmap		= v4l2_m2m_fop_mmap,
 };
 
-static struct v4l2_m2m_ops m2m_ops = {
+static const struct v4l2_m2m_ops m2m_ops = {
 	.device_run	= fimc_device_run,
 	.job_abort	= fimc_job_abort,
 };

