From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 07 Aug 2017 13:05:45 +0000
Subject: [PATCH 5/5] block-skd: Use ARRAY_SIZE() in skd_check_status()
Message-Id: <4b9886f6-105e-c981-88af-ce7dfcc97e7a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56b55301-2db3-9c0b-297f-c2115fd92c6c@users.sourceforge.net>
In-Reply-To: <56b55301-2db3-9c0b-297f-c2115fd92c6c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Geliang Tang <geliangtang@gmail.com>, Jens Axboe <axboe@kernel.dk>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 7 Aug 2017 14:34:33 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: Prefer ARRAY_SIZE(skd_chkstat_table)

Thus use this macro.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/skd_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
index e53b40341834..555cf4810409 100644
--- a/drivers/block/skd_main.c
+++ b/drivers/block/skd_main.c
@@ -2272,7 +2272,7 @@ skd_check_status(struct skd_device *skdev,
 		 skerr->key, skerr->code, skerr->qual, skerr->fruc);
 
 	/* Does the info match an entry in the good category? */
-	n = sizeof(skd_chkstat_table) / sizeof(skd_chkstat_table[0]);
+	n = ARRAY_SIZE(skd_chkstat_table);
 	for (i = 0; i < n; i++) {
 		struct sns_info *sns = &skd_chkstat_table[i];
 
-- 
2.13.4

