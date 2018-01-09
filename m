From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Jan 2018 09:29:19 +0000
Subject: [patch] ipc/mqueue: Add missing error code in init_mqueue_fs()
Message-Id: <20180109092919.ndrvscdllrmzz6jo@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Ingo Molnar <mingo@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jonathan Haws <jhaws@sdl.usu.edu>, Deepa Dinamani <deepa.kernel@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should propogate the error code here but we accidentally return
success.

Fixes: 946086abeddf ("mqueue: switch to on-demand creation of internal mount")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index 89b5c53e0203..70423581dc92 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -1610,8 +1610,10 @@ static int __init init_mqueue_fs(void)
 		goto out_filesystem;
 
 	m = kern_mount_data(&mqueue_fs_type, &init_ipc_ns);
-	if (IS_ERR(m))
+	if (IS_ERR(m)) {
+		error = PTR_ERR(m);
 		goto out_filesystem;
+	}
 	init_ipc_ns.mq_mnt = m;
 	return 0;
 
