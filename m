From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 01 Oct 2016 14:49:02 +0000
Subject: [PATCH 04/15] md-cluster: Improve another size determination in __sendmsg()
Message-Id: <f18ffeb2-ea34-12d7-7e6e-af17cb371ed2@users.sourceforge.net>
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
Date: Sat, 1 Oct 2016 12:21:48 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/md-cluster.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/md-cluster.c b/drivers/md/md-cluster.c
index 7af27dd..c81eed4 100644
--- a/drivers/md/md-cluster.c
+++ b/drivers/md/md-cluster.c
@@ -706,7 +706,7 @@ static int __sendmsg(struct md_cluster_info *cinfo, struct cluster_msg *cmsg)
 	}
 
 	memcpy(cinfo->message_lockres->lksb.sb_lvbptr, (void *)cmsg,
-			sizeof(struct cluster_msg));
+	       sizeof(*cmsg));
 	/*down-convert EX to CW on Message*/
 	error = dlm_lock_sync(cinfo->message_lockres, DLM_LOCK_CW);
 	if (error) {
-- 
2.10.0

