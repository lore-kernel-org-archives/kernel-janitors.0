From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 05 Jul 2018 08:51:14 +0000
Subject: [PATCH net-next] net: aquantia: Make some functions static
Message-Id: <1530781210-54589-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Igor Russkikh <igor.russkikh@aquantia.com>, Pavel Belous <pavel.belous@aquantia.com>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c:525:5: warning:
 symbol 'hw_atl_utils_mpi_set_speed' was not declared. Should it be static?
drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c:536:5: warning:
 symbol 'hw_atl_utils_mpi_set_state' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c b/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c
index e1feba5..c965e65 100644
--- a/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c
+++ b/drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c
@@ -522,7 +522,7 @@ void hw_atl_utils_mpi_read_stats(struct aq_hw_s *self,
 err_exit:;
 }
 
-int hw_atl_utils_mpi_set_speed(struct aq_hw_s *self, u32 speed)
+static int hw_atl_utils_mpi_set_speed(struct aq_hw_s *self, u32 speed)
 {
 	u32 val = aq_hw_read_reg(self, HW_ATL_MPI_CONTROL_ADR);
 
@@ -533,8 +533,8 @@ int hw_atl_utils_mpi_set_speed(struct aq_hw_s *self, u32 speed)
 	return 0;
 }
 
-int hw_atl_utils_mpi_set_state(struct aq_hw_s *self,
-			       enum hal_atl_utils_fw_state_e state)
+static int hw_atl_utils_mpi_set_state(struct aq_hw_s *self,
+				      enum hal_atl_utils_fw_state_e state)
 {
 	int err = 0;
 	u32 transaction_id = 0;

