From: Joe Perches <joe@perches.com>
Date: Fri, 02 Aug 2013 20:10:54 +0000
Subject: [PATCH] pktcdvd: Fix defective misuses of pkt_<level>
Message-Id: <1375474254.2034.134.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130801154452.GB5198@elgon.mountain>
In-Reply-To: <20130801154452.GB5198@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

Fix thinkos where pkt_<level> needs a valid
pktcdvd_device * and the pointer is known to
be NULL.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com> (go smatch!)
Signed-off-by: Joe Perches <joe@perches.com>
---

Andrew, I believe Jiri picked up this series and
you can drop them from mm.  Thanks.

 drivers/block/pktcdvd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 29a5194..5618847 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -2360,8 +2360,8 @@ static void pkt_make_request(struct request_queue *q, struct bio *bio)
 
 	pd = q->queuedata;
 	if (!pd) {
-		pkt_err(pd, "%s incorrect request queue\n",
-			bdevname(bio->bi_bdev, b));
+		pr_err("%s incorrect request queue\n",
+		       bdevname(bio->bi_bdev, b));
 		goto end_io;
 	}
 
@@ -2841,7 +2841,7 @@ static int pkt_remove_dev(dev_t pkt_dev)
 			break;
 	}
 	if (idx = MAX_WRITERS) {
-		pkt_dbg(1, pd, "dev not setup\n");
+		pr_debug("dev not setup\n");
 		ret = -ENXIO;
 		goto out;
 	}


