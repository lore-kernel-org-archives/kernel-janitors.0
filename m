From: Colin King <colin.king@canonical.com>
Date: Thu, 07 Nov 2019 22:40:04 +0000
Subject: [PATCH] NFSv4: fix spelling mistake "requeueing" -> "requeuing"
Message-Id: <20191107224004.417163-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a debug message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nfs/nfs4renewd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/nfs4renewd.c b/fs/nfs/nfs4renewd.c
index 6ea431b067dd..396045633077 100644
--- a/fs/nfs/nfs4renewd.c
+++ b/fs/nfs/nfs4renewd.c
@@ -120,7 +120,7 @@ nfs4_schedule_state_renewal(struct nfs_client *clp)
 		- (long)jiffies;
 	if (timeout < 5 * HZ)
 		timeout = 5 * HZ;
-	dprintk("%s: requeueing work. Lease period = %ld\n",
+	dprintk("%s: requeuing work. Lease period = %ld\n",
 			__func__, (timeout + HZ - 1) / HZ);
 	mod_delayed_work(system_wq, &clp->cl_renewd, timeout);
 	set_bit(NFS_CS_RENEWD, &clp->cl_res_state);
-- 
2.20.1
