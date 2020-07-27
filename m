From: Colin King <colin.king@canonical.com>
Date: Mon, 27 Jul 2020 14:06:00 +0000
Subject: [PATCH][next] counter: microchip-tcb-capture: remove ATMEL_TC_ETRGEDG_NONE bit check
Message-Id: <20200727140600.112562-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The macro ATMEL_TC_ETRGEDG_NONE is defined as 0 << 8 which is zero and
hence the check cmr & ATMEL_TC_ETRGEDG_NONE can never be true. Since
*action is already assigned MCHP_TC_SYNAPSE_ACTION_NONE then this check
and set is redundant dead code and can be removed.

Addresses-Coverity: ("Logically dead code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/counter/microchip-tcb-capture.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index f7b7743ddb94..119640d6d6ab 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -185,9 +185,7 @@ static int mchp_tc_count_action_get(struct counter_device *counter,
 
 	*action = MCHP_TC_SYNAPSE_ACTION_NONE;
 
-	if (cmr & ATMEL_TC_ETRGEDG_NONE)
-		*action = MCHP_TC_SYNAPSE_ACTION_NONE;
-	else if (cmr & ATMEL_TC_ETRGEDG_RISING)
+	if (cmr & ATMEL_TC_ETRGEDG_RISING)
 		*action = MCHP_TC_SYNAPSE_ACTION_RISING_EDGE;
 	else if (cmr & ATMEL_TC_ETRGEDG_FALLING)
 		*action = MCHP_TC_SYNAPSE_ACTION_FALLING_EDGE;
-- 
2.27.0
