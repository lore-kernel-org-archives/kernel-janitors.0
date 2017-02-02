From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Feb 2017 12:12:01 +0000
Subject: [PATCH 1/2] staging: rts5208: remove redundant retval status check
Message-Id: <20170202121202.29659-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wayne Porter <wporter82@gmail.com>, Amitoj Kaur Chawla <amitoj1606@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Bhaktipriya Shridhar <bhaktipriya96@gmail.com>, Quentin Lambert <lambert.quentin@gmail.com>, Dilek Uzulmez <dilekuzulmez@gmail.com>, Jonas Rickert <jrickertkc@gmail.com>, MingChia Chung <quexint@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The retval status checks in the proceeding do loop return out
of function ms_read_attritbute_info if there is an error
condition,  thus we never reach the end of the loop with
retval failed status.  Therefore, the retval status check
at end of the do loop is redundant and can be removed.

Detected with CoverityScan, CID#143000 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rts5208/ms.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
index 28d56c5..806c121 100644
--- a/drivers/staging/rts5208/ms.c
+++ b/drivers/staging/rts5208/ms.c
@@ -1108,12 +1108,6 @@ static int ms_read_attribute_info(struct rtsx_chip *chip)
 		i++;
 	} while (i < 1024);
 
-	if (retval != STATUS_SUCCESS) {
-		kfree(buf);
-		rtsx_trace(chip);
-		return STATUS_FAIL;
-	}
-
 	if ((buf[0] != 0xa5) && (buf[1] != 0xc3)) {
 		/* Signature code is wrong */
 		kfree(buf);
-- 
2.10.2

