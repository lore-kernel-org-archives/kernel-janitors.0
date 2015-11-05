From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 05 Nov 2015 17:00:46 +0000
Subject: [PATCH] IPC-mqueue: Delete unnecessary checks before two function calls
Message-Id: <563B8B3E.8050004@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 5 Nov 2015 17:55:25 +0100

The functions iput() and unregister_sysctl_table() test whether their
argument is NULL and then return immediately.
Thus the tests around their calls are not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 ipc/mqueue.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index 161a180..ade9dd8 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -885,8 +885,7 @@ SYSCALL_DEFINE1(mq_unlink, const char __user *, u_name)
 
 out_unlock:
 	mutex_unlock(&d_inode(mnt->mnt_root)->i_mutex);
-	if (inode)
-		iput(inode);
+	iput(inode);
 	mnt_drop_write(mnt);
 out_name:
 	putname(name);
@@ -1460,8 +1459,7 @@ static int __init init_mqueue_fs(void)
 out_filesystem:
 	unregister_filesystem(&mqueue_fs_type);
 out_sysctl:
-	if (mq_sysctl_table)
-		unregister_sysctl_table(mq_sysctl_table);
+	unregister_sysctl_table(mq_sysctl_table);
 	kmem_cache_destroy(mqueue_inode_cachep);
 	return error;
 }
-- 
2.6.2

