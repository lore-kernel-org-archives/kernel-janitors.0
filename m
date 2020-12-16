From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Dec 2020 12:00:20 +0000
Subject: [PATCH] net: nixge: fix spelling mistake in Kconfig: "Instuments" -> "Instruments"
Message-Id: <20201216120020.13149-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/ni/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ni/Kconfig b/drivers/net/ethernet/ni/Kconfig
index 01229190132d..dcfbfa516e67 100644
--- a/drivers/net/ethernet/ni/Kconfig
+++ b/drivers/net/ethernet/ni/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
-# National Instuments network device configuration
+# National Instruments network device configuration
 #
 
 config NET_VENDOR_NI
-- 
2.29.2
