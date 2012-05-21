From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 21 May 2012 14:35:26 +0000
Subject: [patch] dlm: remove stray unlock
Message-Id: <20120521143526.GB25114@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains that we unlock this twice.  It looks like an accidental
to me.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This was added in 525f31c1f3 ("dlm: fix race between remove and lookup")
Untested.

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 06063a3..1c10bf4 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1570,7 +1570,6 @@ static void wait_pending_remove(struct dlm_rsb *r_new)
 			continue;
 		if (rsb_cmp(r_new, r->res_name, r->res_length))
 			continue;
-		spin_unlock(&ls->ls_send_remove_spin);
 
 		log_debug(ls, "delay lookup %p for remove %p dir %d %s",
 		  	  r_new, r, r_new->res_dir_nodeid, r_new->res_name);
