From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 26 Mar 2018 14:32:27 +0000
Subject: [PATCH net-next] net: aquantia: Make function hw_atl_utils_mpi_set_speed() static
Message-Id: <1522074747-22610-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Igor Russkikh <igor.russkikh@aquantia.com>, Pavel Belous <pavel.belous@aquantia.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c:508:5: warning:
 symbol 'hw_atl_utils_mpi_set_speed' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c b/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c
index d3b847e..84d7f4d 100644
--- a/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c
+++ b/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c
@@ -505,7 +505,7 @@ void hw_atl_utils_mpi_read_stats(struct aq_hw_s *self,
 err_exit:;
 }
 
-int hw_atl_utils_mpi_set_speed(struct aq_hw_s *self, u32 speed)
+static int hw_atl_utils_mpi_set_speed(struct aq_hw_s *self, u32 speed)
 {
 	u32 val = aq_hw_read_reg(self, HW_ATL_MPI_CONTROL_ADR);

