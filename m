From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 04 May 2016 05:13:48 +0000
Subject: [PATCH 3/3] staging: dgnc: clean up the dgnc_get_modem_info()
Message-Id: <20160504051348.GA21479@certreview.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

the "ch" in dgnc_get_modem_info() was already checked before calling
this function and also if "ch" is not NULL, dgnc_get_mstat() returns
valid value so it doesn't need to check an error.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 46ca01d..f67d7d4 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -2013,17 +2013,7 @@ static inline int dgnc_get_mstat(struct channel_t *ch)
 static int dgnc_get_modem_info(struct channel_t *ch,
 			       unsigned int  __user *value)
 {
-	int result;
-
-	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
-		return -ENXIO;
-
-	result = dgnc_get_mstat(ch);
-
-	if (result < 0)
-		return -ENXIO;
-
-	return put_user(result, value);
+	return put_user(dgnc_get_mstat(ch), value);
 }
 
 /*
-- 
2.8.2

