From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 26 Sep 2018 12:20:00 +0000
Subject: [PATCH net-next] net: aquantia: Make function aq_fw1x_set_power() static
Message-Id: <1537964400-179255-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522074747-22610-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522074747-22610-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Igor Russkikh <igor.russkikh@aquantia.com>, Nikita Danilov <nikita.danilov@aquantia.com>, Yana Esina <yana.esina@aquantia.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c:873:5: warning:
 symbol 'aq_fw1x_set_power' was not declared. Should it be static?

Fixes: a0da96c08cfa ("net: aquantia: implement WOL support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c b/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c
index 0dd59b09..7def1cb 100644
--- a/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c
+++ b/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c
@@ -870,8 +870,8 @@ static int aq_fw1x_set_wol(struct aq_hw_s *self, bool wol_enabled, u8 *mac)
 	return err;
 }
 
-int aq_fw1x_set_power(struct aq_hw_s *self, unsigned int power_state,
-		      u8 *mac)
+static int aq_fw1x_set_power(struct aq_hw_s *self, unsigned int power_state,
+			     u8 *mac)
 {
 	struct hw_atl_utils_fw_rpc *prpc = NULL;
 	unsigned int rpc_size = 0U;
