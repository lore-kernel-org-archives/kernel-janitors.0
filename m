From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2018 12:29:29 +0000
Subject: [PATCH] NFS: silence a harmless uninitialized variable warning
Message-Id: <20180712122929.dshlwi3obipq6vfm@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

kstrtoul() can return -ERANGE so Smatch complains that "num" can be
uninitialized.  We check that it's within bounds so it's not a huge
deal.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index b5f27d6999e5..d81a33461bee 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -2901,7 +2901,7 @@ static int param_set_portnr(const char *val, const struct kernel_param *kp)
 	if (!val)
 		return -EINVAL;
 	ret = kstrtoul(val, 0, &num);
-	if (ret = -EINVAL || num > NFS_CALLBACK_MAXPORTNR)
+	if (ret || num > NFS_CALLBACK_MAXPORTNR)
 		return -EINVAL;
 	*((unsigned int *)kp->arg) = num;
 	return 0;
