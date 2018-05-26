From: Colin King <colin.king@canonical.com>
Date: Sat, 26 May 2018 13:45:07 +0000
Subject: [PATCH] media: mtk-vpu:  fix spelling mistake: "Prosessor" -> "Processor"
Message-Id: <20180526134507.28919-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in module description text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 1ff6a93262b7..f8d35e3ac1dc 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -960,4 +960,4 @@ static struct platform_driver mtk_vpu_driver = {
 module_platform_driver(mtk_vpu_driver);
 
 MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Mediatek Video Prosessor Unit driver");
+MODULE_DESCRIPTION("Mediatek Video Processor Unit driver");
-- 
2.17.0

