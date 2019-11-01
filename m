From: Mao Wenan <maowenan@huawei.com>
Date: Fri, 01 Nov 2019 11:40:54 +0000
Subject: [PATCH -next] nfsd: Drop LIST_HEAD where the variable it declares is never used.
Message-Id: <20191101114054.50225-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bfields@redhat.com, chuck.lever@oracle.com, trond.myklebust@primarydata.com, dros@primarydata.com, jeff.layton@primarydata.com, richard.sharpe@primarydata.com
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

The declarations were introduced with the file, but the declared
variables were not used.

Fixes: 65294c1f2c5e ("nfsd: add a new struct file caching facility to nfsd")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 fs/nfsd/filecache.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/nfsd/filecache.c b/fs/nfsd/filecache.c
index ef55e9b..32a9bf2 100644
--- a/fs/nfsd/filecache.c
+++ b/fs/nfsd/filecache.c
@@ -685,8 +685,6 @@ nfsd_file_cache_purge(struct net *net)
 void
 nfsd_file_cache_shutdown(void)
 {
-	LIST_HEAD(dispose);
-
 	set_bit(NFSD_FILE_SHUTDOWN, &nfsd_file_lru_flags);
 
 	lease_unregister_notifier(&nfsd_file_lease_notifier);
-- 
2.7.4
