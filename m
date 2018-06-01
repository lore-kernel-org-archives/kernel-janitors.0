From: Colin King <colin.king@canonical.com>
Date: Fri, 01 Jun 2018 15:28:34 +0000
Subject: [PATCH] net: aquantia: make function aq_fw2x_get_mac_permanent static
Message-Id: <20180601152834.17958-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Igor Russkikh <igor.russkikh@aquantia.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function aq_fw2x_get_mac_permanent is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
warning: symbol 'aq_fw2x_get_mac_permanent' was not declared. Should it
be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils_fw2x.c   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils_fw2x.c b/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils_fw2x.c
index 8cfce95c82fc..39cd3a27fe77 100644
--- a/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils_fw2x.c
+++ b/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils_fw2x.c
@@ -107,7 +107,7 @@ static int aq_fw2x_update_link_status(struct aq_hw_s *self)
 	return 0;
 }
 
-int aq_fw2x_get_mac_permanent(struct aq_hw_s *self, u8 *mac)
+static int aq_fw2x_get_mac_permanent(struct aq_hw_s *self, u8 *mac)
 {
 	int err = 0;
 	u32 h = 0U;
-- 
2.17.0

