From: Colin King <colin.king@canonical.com>
Date: Mon, 06 Jan 2020 13:17:34 +0000
Subject: [PATCH][next] NFS: Add missing null check for failed allocation
Message-Id: <20200106131734.51759-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <Anna.Schumaker@Netapp.com>, Scott Mayhew <smayhew@redhat.com>, David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-nfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the allocation of buf is not being null checked and
a null pointer dereference can occur when the memory allocation fails.
Fix this by adding a check and returning -ENOMEM.

Addresses-Coverity: ("Dereference null return")
Fixes: 6d972518b821 ("NFS: Add fs_context support.")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nfs/nfs4namespace.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/nfs/nfs4namespace.c b/fs/nfs/nfs4namespace.c
index 10e9e1887841..de6875a9b391 100644
--- a/fs/nfs/nfs4namespace.c
+++ b/fs/nfs/nfs4namespace.c
@@ -137,6 +137,9 @@ static int nfs4_validate_fspath(struct dentry *dentry,
 	int n;
 
 	buf = kmalloc(4096, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
 	path = nfs4_path(dentry, buf, 4096);
 	if (IS_ERR(path)) {
 		kfree(buf);
-- 
2.24.0
