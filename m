From: Dan Carpenter <error27@gmail.com>
Date: Thu, 22 Apr 2010 09:28:39 +0000
Subject: [patch] nfs: fix some issues in nfs41_proc_reclaim_complete()
Message-Id: <20100422092839.GI29647@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: Benny Halevy <bhalevy@panasas.com>, Andy Adamson <andros@netapp.com>, Alexandros Batsakis <batsakis@netapp.com>, Ricardo Labiaga <Ricardo.Labiaga@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

The original code passed an ERR_PTR() to rpc_put_task() and instead of
returning zero on success it returned -ENOMEM.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This was found by smatch and I've only compile tested it.  Sorry.  :/

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index 6380670..071fced 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -5218,9 +5218,12 @@ static int nfs41_proc_reclaim_complete(struct nfs_client *clp)
 	msg.rpc_resp = &calldata->res;
 	task_setup_data.callback_data = calldata;
 	task = rpc_run_task(&task_setup_data);
-	if (IS_ERR(task))
+	if (IS_ERR(task)) {
 		status = PTR_ERR(task);
+		goto out;
+	}
 	rpc_put_task(task);
+	return 0;
 out:
 	dprintk("<-- %s status=%d\n", __func__, status);
 	return status;
