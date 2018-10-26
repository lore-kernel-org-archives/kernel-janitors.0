From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Oct 2018 18:10:31 +0000
Subject: [PATCH] NFS: fix spelling mistake, EACCESS -> EACCES
Message-Id: <20181026181031.5366-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to a spelling mistake of the error access name EACCESS,
rename to EACCES

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nfs/nfs4proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index db84b4adbc49..867457d6dfbe 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -3788,7 +3788,7 @@ static int nfs4_find_root_sec(struct nfs_server *server, struct nfs_fh *fhandle,
 	}
 
 	/*
-	 * -EACCESS could mean that the user doesn't have correct permissions
+	 * -EACCES could mean that the user doesn't have correct permissions
 	 * to access the mount.  It could also mean that we tried to mount
 	 * with a gss auth flavor, but rpc.gssd isn't running.  Either way,
 	 * existing mount programs don't handle -EACCES very well so it should
-- 
2.19.1
