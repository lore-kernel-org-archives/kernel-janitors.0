From: Colin King <colin.king@canonical.com>
Date: Thu, 25 Jun 2020 16:45:05 +0000
Subject: [PATCH][V2] qed: add missing error test for DBG_STATUS_NO_MATCHING_FRAMING_MODE
Message-Id: <20200625164505.115425-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2@marvell.com, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Michal Kalderon <michal.kalderon@marvell.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Igor Russkikh <irusskikh@marvell.com>

From: Colin Ian King <colin.king@canonical.com>

The error DBG_STATUS_NO_MATCHING_FRAMING_MODE was added to the enum
enum dbg_status however there is a missing corresponding entry for
this in the array s_status_str. This causes an out-of-bounds read when
indexing into the last entry of s_status_str.  Fix this by adding in
the missing entry.

Addresses-Coverity: ("Out-of-bounds read").
Fixes: 2d22bc8354b1 ("qed: FW 8.42.2.0 debug features")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: use the error message as suggested by Igor Russkikh

---
 drivers/net/ethernet/qlogic/qed/qed_debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_debug.c b/drivers/net/ethernet/qlogic/qed/qed_debug.c
index 57a0dab88431..d9dfaf214f6b 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_debug.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_debug.c
@@ -5569,6 +5569,8 @@ static const char * const s_status_str[] = {
 	/* DBG_STATUS_INVALID_FILTER_TRIGGER_DWORDS */
 	"The filter/trigger constraint dword offsets are not enabled for recording",
 
+	/* DBG_STATUS_NO_MATCHING_FRAMING_MODE */
+	"No matching framing mode found for the enabled blocks/Storms - use less dwords for blocks data",
 
 	/* DBG_STATUS_VFC_READ_ERROR */
 	"Error reading from VFC",
-- 
2.27.0
