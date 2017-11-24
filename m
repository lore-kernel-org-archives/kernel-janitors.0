From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Nov 2017 13:52:36 +0000
Subject: [PATCH] scsi: sym53c8xx_2: use setup_timer instead of init_timer
Message-Id: <20171124135236.492-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Use setup_timer function instead of initializing timer with the
function and data fields.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/sym53c8xx_2/sym_glue.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/scsi/sym53c8xx_2/sym_glue.c b/drivers/scsi/sym53c8xx_2/sym_glue.c
index d32e3ba8863e..285397d42558 100644
--- a/drivers/scsi/sym53c8xx_2/sym_glue.c
+++ b/drivers/scsi/sym53c8xx_2/sym_glue.c
@@ -1351,9 +1351,7 @@ static struct Scsi_Host *sym_attach(struct scsi_host_template *tpnt, int unit,
 	/*
 	 *  Start the timer daemon
 	 */
-	init_timer(&np->s.timer);
-	np->s.timer.data     = (unsigned long) np;
-	np->s.timer.function = sym53c8xx_timer;
+	setup_timer(&np->s.timer, sym53c8xx_timer, (unsigned long)np);
 	np->s.lasttime=0;
 	sym_timer (np);
 
-- 
2.14.1

