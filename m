From: Colin King <colin.king@canonical.com>
Date: Fri, 02 Aug 2019 15:52:17 +0000
Subject: [PATCH][net-next] ice: fix potential infinite loop
Message-Id: <20190802155217.16996-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Kirsher <jeffrey.t.kirsher@intel.com>, "David S . Miller" <davem@davemloft.net>, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The loop counter of a for-loop is a u8 however this is being compared
to an int upper bound and this can lead to an infinite loop if the
upper bound is greater than 255 since the loop counter will wrap back
to zero. Fix this potential issue by making the loop counter an int.

Addresses-Coverity: ("Infinite loop")
Fixes: c7aeb4d1b9bf ("ice: Disable VFs until reset is completed")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/intel/ice/ice_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index c26e6a102dac..088543d50095 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -488,7 +488,7 @@ static void
 ice_prepare_for_reset(struct ice_pf *pf)
 {
 	struct ice_hw *hw = &pf->hw;
-	u8 i;
+	int i;
 
 	/* already prepared for reset */
 	if (test_bit(__ICE_PREPARED_FOR_RESET, pf->state))
-- 
2.20.1
