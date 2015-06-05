From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jun 2015 09:22:57 +0000
Subject: [patch] Staging: lustre: ptlrpc: signedness bug in high_priority_ratio_store()
Message-Id: <20150605092257.GA24871@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We want to store a non-negative int here.  The original code had a check
for unsigned long less than zero which is a mistake but also casting
from a positive long to an int can result in a negative number.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c b/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c
index 1362160..0a53322 100644
--- a/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c
+++ b/drivers/staging/lustre/lustre/ptlrpc/lproc_ptlrpc.c
@@ -1035,9 +1035,9 @@ static ssize_t high_priority_ratio_store(struct kobject *kobj,
 	struct ptlrpc_service *svc = container_of(kobj, struct ptlrpc_service,
 						  srv_kobj);
 	int rc;
-	unsigned long val;
+	int val;
 
-	rc = kstrtoul(buffer, 10, &val);
+	rc = kstrtoint(buffer, 10, &val);
 	if (rc < 0)
 		return rc;
 
