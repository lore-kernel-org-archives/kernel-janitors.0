From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 12:30:32 +0000
Subject: [PATCH] media: rockchip/rga: constify v4l2_m2m_ops structure
Message-Id: <1540643432-25969-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

The v4l2_m2m_ops structure can be const as it is only passed to
v4l2_m2m_init whose parameter is const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/platform/rockchip/rga/rga.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 9cc9db083870..dc63c44929de 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -97,7 +97,7 @@ static irqreturn_t rga_isr(int irq, void *prv)
 	return IRQ_HANDLED;
 }
 
-static struct v4l2_m2m_ops rga_m2m_ops = {
+static const struct v4l2_m2m_ops rga_m2m_ops = {
 	.device_run = device_run,
 };
 
