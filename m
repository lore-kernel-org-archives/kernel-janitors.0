From: Colin King <colin.king@canonical.com>
Date: Fri, 18 Sep 2020 15:24:28 +0000
Subject: [PATCH] remoteproc/mediatek: fix null pointer dereference on null scp pointer
Message-Id: <20200918152428.27258-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Pi-Hsun Shih <pihsun@chromium.org>, Erin Lo <erin.lo@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when pointer scp is null a dev_err is being called that
references the pointer which is the very thing we are trying to
avoid doing. Remove the extraneous error message to avoid this
issue.

Addresses-Coverity: ("Dereference after null check")
Fixes: 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/remoteproc/mtk_scp_ipi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 3d3d87210ef2..58d1d7e571d6 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -30,10 +30,8 @@ int scp_ipi_register(struct mtk_scp *scp,
 		     scp_ipi_handler_t handler,
 		     void *priv)
 {
-	if (!scp) {
-		dev_err(scp->dev, "scp device is not ready\n");
+	if (!scp)
 		return -EPROBE_DEFER;
-	}
 
 	if (WARN_ON(id >= SCP_IPI_MAX) || WARN_ON(handler = NULL))
 		return -EINVAL;
-- 
2.27.0
