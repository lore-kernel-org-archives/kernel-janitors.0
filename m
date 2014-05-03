From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 03 May 2014 20:23:29 +0000
Subject: [patch] staging: lustre: info leak in lnet_ping()
Message-Id: <20140503202329.GE32753@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 64 bit systems there is a 4 byte hole after the last member of the
struct.  We should clear it to avoid disclosing stack information.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/lustre/lnet/lnet/api-ni.c b/drivers/staging/lustre/lnet/lnet/api-ni.c
index 85b8d81..d4cacb90 100644
--- a/drivers/staging/lustre/lnet/lnet/api-ni.c
+++ b/drivers/staging/lustre/lnet/lnet/api-ni.c
@@ -1927,6 +1927,7 @@ lnet_ping (lnet_process_id_t id, int timeout_ms, lnet_process_id_t *ids, int n_i
 
 	rc = -EFAULT;			   /* If I SEGV... */
 
+	memset(&tmpid, 0, sizeof(tmpid));
 	for (i = 0; i < n_ids; i++) {
 		tmpid.pid = info->pi_pid;
 		tmpid.nid = info->pi_ni[i].ns_nid;
