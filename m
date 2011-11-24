From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2011 11:47:02 +0000
Subject: [patch] mtip32xx: uninitialized variable in mtip_quiesce_io()
Message-Id: <20111124114702.GA32522@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Asai Thambi S P <asamymuthupa@micron.com>, Sam Bradshaw <sbradshaw@micron.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently introduce new continue in the loop which make gcc complain.
In theory if MTIP_FLAG_SVC_THD_ACTIVE_BIT is set, we could hit continue
over and over until eventually we time out of the loop.  In that case
"active" should be set as true, but right now it's uninitialized.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/mtip32xx/mtip32xx.c b/drivers/block/mtip32xx/mtip32xx.c
index b5d843a..9bc10e3 100644
--- a/drivers/block/mtip32xx/mtip32xx.c
+++ b/drivers/block/mtip32xx/mtip32xx.c
@@ -1026,7 +1026,8 @@ static void mtip_issue_non_ncq_command(struct mtip_port *port, int tag)
 static int mtip_quiesce_io(struct mtip_port *port, unsigned long timeout)
 {
 	unsigned long to;
-	unsigned int n, active;
+	unsigned int n;
+	unsigned int active = 1;
 
 	to = jiffies + msecs_to_jiffies(timeout);
 	do {
