From: Colin King <colin.king@canonical.com>
Date: Sat, 14 Nov 2020 12:05:18 +0000
Subject: [PATCH] phy: mediatek: fix spelling mistake in Kconfig "veriosn" -> "version"
Message-Id: <20201114120518.416120-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 50c5e9306e19..c8126bde9d7c 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -12,7 +12,7 @@ config PHY_MTK_TPHY
 	  it supports multiple usb2.0, usb3.0 ports, PCIe and
 	  SATA, and meanwhile supports two version T-PHY which have
 	  different banks layout, the T-PHY with shared banks between
-	  multi-ports is first version, otherwise is second veriosn,
+	  multi-ports is first version, otherwise is second version,
 	  so you can easily distinguish them by banks layout.
 
 config PHY_MTK_UFS
-- 
2.28.0
