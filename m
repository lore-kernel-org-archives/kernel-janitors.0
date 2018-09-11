From: Colin King <colin.king@canonical.com>
Date: Tue, 11 Sep 2018 08:18:58 +0000
Subject: [PATCH] s390/tape: fix spelling mistake "partion" -> "partition"
Message-Id: <20180911081858.27297-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/s390/char/tape_3590.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/s390/char/tape_3590.c b/drivers/s390/char/tape_3590.c
index cdcde18e7220..4554cdf4d6bd 100644
--- a/drivers/s390/char/tape_3590.c
+++ b/drivers/s390/char/tape_3590.c
@@ -971,7 +971,7 @@ tape_3590_print_mim_msg_f0(struct tape_device *device, struct irb *irb)
 		snprintf(exception, BUFSIZE, "Data degraded");
 		break;
 	case 0x03:
-		snprintf(exception, BUFSIZE, "Data degraded in partion %i",
+		snprintf(exception, BUFSIZE, "Data degraded in partition %i",
 			sense->fmt.f70.mp);
 		break;
 	case 0x04:
-- 
2.17.1
