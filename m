From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Feb 2014 13:21:53 +0000
Subject: [patch] dlm: silence a harmless use after free warning
Message-Id: <20140205132153.GD800@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We pass the freed "r" pointer back to the caller.  It's harmless but it
upsets the static checkers.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index e223a911a834..5ec4d60525d8 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -687,6 +687,7 @@ static int find_rsb_dir(struct dlm_ls *ls, char *name, int len,
 		log_error(ls, "find_rsb new from_other %d dir %d our %d %s",
 			  from_nodeid, dir_nodeid, our_nodeid, r->res_name);
 		dlm_free_rsb(r);
+		r = NULL;
 		error = -ENOTBLK;
 		goto out_unlock;
 	}
