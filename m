From: Colin King <colin.king@canonical.com>
Date: Tue, 28 May 2019 06:52:17 +0000
Subject: [PATCH][next] qed: fix spelling mistake "inculde" -> "include"
Message-Id: <20190528065217.7311-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181203171331.29869-1-colin.king@canonical.com>
In-Reply-To: <20181203171331.29869-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2@marvell.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a DP_INFO message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_dev.c b/drivers/net/ethernet/qlogic/qed/qed_dev.c
index 61ca49a967df..a971418755e9 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_dev.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_dev.c
@@ -3836,7 +3836,7 @@ static int qed_hw_get_ppfid_bitmap(struct qed_hwfn *p_hwfn,
 
 	if (!(cdev->ppfid_bitmap & (0x1 << native_ppfid_idx))) {
 		DP_INFO(p_hwfn,
-			"Fix the PPFID bitmap to inculde the native PPFID [native_ppfid_idx %hhd, orig_bitmap 0x%hhx]\n",
+			"Fix the PPFID bitmap to include the native PPFID [native_ppfid_idx %hhd, orig_bitmap 0x%hhx]\n",
 			native_ppfid_idx, cdev->ppfid_bitmap);
 		cdev->ppfid_bitmap = 0x1 << native_ppfid_idx;
 	}
-- 
2.20.1
