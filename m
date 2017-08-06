From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 06 Aug 2017 08:25:16 +0000
Subject: [PATCH 07/12] [media] bdisp: constify v4l2_m2m_ops structures
Message-Id: <1502007921-22968-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502007921-22968-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502007921-22968-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
index 7918b92..939da6d 100644
--- a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
@@ -360,7 +360,7 @@ static void bdisp_device_run(void *priv)
 		bdisp_job_finish(ctx, VB2_BUF_STATE_ERROR);
 }
 
-static struct v4l2_m2m_ops bdisp_m2m_ops = {
+static const struct v4l2_m2m_ops bdisp_m2m_ops = {
 	.device_run     = bdisp_device_run,
 	.job_abort      = bdisp_job_abort,
 };

