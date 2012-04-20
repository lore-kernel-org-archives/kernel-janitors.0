From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Apr 2012 11:46:27 +0000
Subject: [patch] comedi vmk80xx: lock held on error path
Message-Id: <20120420114627.GK27101@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If the user passes an invalid command, then we don't drop the lock
before returning.  The check for invalid commands doesn't need to be
done under lock so I moved it forward a couple lines.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/comedi/drivers/vmk80xx.c b/drivers/staging/comedi/drivers/vmk80xx.c
index 10ac58d..856d0ea 100644
--- a/drivers/staging/comedi/drivers/vmk80xx.c
+++ b/drivers/staging/comedi/drivers/vmk80xx.c
@@ -1020,12 +1020,12 @@ static int vmk80xx_cnt_cinsn(struct comedi_device *cdev,
 	if (n)
 		return n;
 
-	down(&dev->limit_sem);
-
 	insn_cmd = data[0];
 	if (insn_cmd != INSN_CONFIG_RESET && insn_cmd != GPCT_RESET)
 		return -EINVAL;
 
+	down(&dev->limit_sem);
+
 	chan = CR_CHAN(insn->chanspec);
 
 	if (dev->board.model = VMK8055_MODEL) {
