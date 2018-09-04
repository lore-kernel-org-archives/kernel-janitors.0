From: Colin King <colin.king@canonical.com>
Date: Tue, 04 Sep 2018 14:44:22 +0000
Subject: [PATCH] afs: remove unused variable afs_zero_fid
Message-Id: <20180904144422.6647-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable afs_zero_fid is defined but not used, hence it is
redundant and can be removed.

Cleans up clang warning:
'afs_zero_fid' defined but not used [-Wunused-const-variable=]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/afs/fsclient.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 50929cb91732..1310ffe8da48 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -18,8 +18,6 @@
 #include "afs_fs.h"
 #include "xdr_fs.h"
 
-static const struct afs_fid afs_zero_fid;
-
 /*
  * We need somewhere to discard into in case the server helpfully returns more
  * than we asked for in FS.FetchData{,64}.
-- 
2.17.1
