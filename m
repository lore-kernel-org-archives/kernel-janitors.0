From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Jun 2013 07:30:49 +0000
Subject: [patch] Staging: rtl8192u: fix a reversed test
Message-Id: <20130606073048.GA12953@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sean MacLennan fixed this in the rtl8192e driver and we should fix
it here as well.

It's pretty harmless.  This information comes from the firmware, if
we were to hit this bug we would read beyond the end of the array
once or twice before returning and update our statistics with bogus
data.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8192u/r819xU_cmdpkt.c b/drivers/staging/rtl8192u/r819xU_cmdpkt.c
index 002d9b4e..6810766 100644
--- a/drivers/staging/rtl8192u/r819xU_cmdpkt.c
+++ b/drivers/staging/rtl8192u/r819xU_cmdpkt.c
@@ -727,7 +727,7 @@ cmpk_message_handle_rx(
 	      element type. Because FW may aggregate RX command packet to minimize
 	      transmit time between DRV and FW.*/
 	// Add a counter to prevent the lock in the loop from being held too long
-	while (total_length > 0 || exe_cnt++ >100)
+	while (total_length > 0 && exe_cnt++ < 100)
 	{
 		/* 2007/01/17 MH We support aggregation of different cmd in the same packet. */
 		element_id = pcmd_buff[0];
