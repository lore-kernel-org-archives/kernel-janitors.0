From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 02 Aug 2018 05:42:04 +0000
Subject: [PATCH -next] NFSv4: Fix error handling in nfs4_sp4_select_mode()
Message-Id: <1533188524-152221-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

Error code is set in the error handling cases but never used. Fix it.

Fixes: 937e3133cd0b ("NFSv4.1: Ensure we clear the SP4_MACH_CRED flags in nfs4_sp4_select_mode()")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 fs/nfs/nfs4proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index c571ee4..8ae1b8d 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -7785,7 +7785,7 @@ static int nfs4_sp4_select_mode(struct nfs_client *clp,
 	}
 out:
 	clp->cl_sp4_flags = flags;
-	return 0;
+	return ret;
 }
 
 struct nfs41_exchange_id_data {

