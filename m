From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 01 Oct 2016 14:52:05 +0000
Subject: [PATCH 07/15] md-cluster: Improve another size determination in process_suspend_info()
Message-Id: <92dc2027-6169-dd50-e9a2-cab763da94dd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3a03df66-92ce-20fb-17f3-fb79b9d43c8e@users.sourceforge.net>
In-Reply-To: <3a03df66-92ce-20fb-17f3-fb79b9d43c8e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-raid@vger.kernel.org, Guoqing Jiang <gqjiang@suse.com>, Shaohua Li <shli@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 1 Oct 2016 12:42:50 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/md-cluster.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/md-cluster.c b/drivers/md/md-cluster.c
index 94835b5..e965e78 100644
--- a/drivers/md/md-cluster.c
+++ b/drivers/md/md-cluster.c
@@ -482,8 +482,7 @@ static void process_suspend_info(struct mddev *mddev,
 					lo, hi);
 	cinfo->sync_low = lo;
 	cinfo->sync_hi = hi;
-
-	s = kzalloc(sizeof(struct suspend_info), GFP_KERNEL);
+	s = kzalloc(sizeof(*s), GFP_KERNEL);
 	if (!s)
 		return;
 	s->slot = slot;
-- 
2.10.0

