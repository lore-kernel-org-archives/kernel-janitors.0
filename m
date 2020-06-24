From: Colin King <colin.king@canonical.com>
Date: Wed, 24 Jun 2020 10:13:02 +0000
Subject: [PATCH] qed: add missing error test for DBG_STATUS_NO_MATCHING_FRAMING_MODE
Message-Id: <20200624101302.8316-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2@marvell.com, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Michal Kalderon <michal.kalderon@marvell.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/net/ethernet/qlogic/qed/qed_debug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_debug.c b/drivers/net/ethernet/qlogic/qed/qed_debug.c
index 57a0dab88431..81e8fbe4a05b 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_debug.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_debug.c
@@ -5568,7 +5568,8 @@ static const char * const s_status_str[] = {
 
 	/* DBG_STATUS_INVALID_FILTER_TRIGGER_DWORDS */
 	"The filter/trigger constraint dword offsets are not enabled for recording",
-
+	/* DBG_STATUS_NO_MATCHING_FRAMING_MODE */
+	"No matching framing mode",
 
 	/* DBG_STATUS_VFC_READ_ERROR */
 	"Error reading from VFC",
-- 
2.27.0
