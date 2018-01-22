From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Jan 2018 10:23:32 +0000
Subject: [PATCH] staging: rts5208: Fix "seg_no" calculation in reset_ms_card()
Message-Id: <20180122102332.GB23912@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I get some static checker warnings like this:

    drivers/staging/rts5208/ms.c:2607 ms_build_l2p_tbl()
    error: buffer underflow 'ms_card->segment' (-1)-16

The problem is that we memset "ms_card" to zero at the start of the
reset_ms_card() function.  That means that when we try to calculate
"ms_card->total_block / 512 - 1" then it's just always -1.  The fix is
to calculate "seg_no" before doing the memset().

This is a static checker fix, and I am not able to test it.  My theory
is that reset_ms_card() gets very little testing which is why this bug
exists.

Fixes: fa590c222fba ("staging: rts5208: add support for rts5208 and rts5288")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
index 7cdce87f3051..821256b95e22 100644
--- a/drivers/staging/rts5208/ms.c
+++ b/drivers/staging/rts5208/ms.c
@@ -2821,6 +2821,7 @@ static int ms_build_l2p_tbl(struct rtsx_chip *chip, int seg_no)
 int reset_ms_card(struct rtsx_chip *chip)
 {
 	struct ms_info *ms_card = &chip->ms_card;
+	int seg_no = ms_card->total_block / 512 - 1;
 	int retval;
 
 	memset(ms_card, 0, sizeof(struct ms_info));
@@ -2863,7 +2864,7 @@ int reset_ms_card(struct rtsx_chip *chip)
 		/* Build table for the last segment,
 		 * to check if L2P table block exists, erasing it
 		 */
-		retval = ms_build_l2p_tbl(chip, ms_card->total_block / 512 - 1);
+		retval = ms_build_l2p_tbl(chip, seg_no);
 		if (retval != STATUS_SUCCESS) {
 			rtsx_trace(chip);
 			return STATUS_FAIL;
