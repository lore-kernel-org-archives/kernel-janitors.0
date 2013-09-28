From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 28 Sep 2013 09:39:43 +0000
Subject: [patch] ncpfs: add a sanity check in ncp_is_nfs_extras()
Message-Id: <20130928093943.GD26611@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Vandrovec <petr@vandrovec.name>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "volnum" can come from the server and my static checker complains
that we can't trust it.  In theory, it could lead to an info leak but
in real life, it is unlikely.

One way this comes from the server is ncp_obtain_info() initializes
target by calling:

	ncp_extract_file_info(ncp_reply_data(server, 0), target);

It then passes target to ncp_obtain_nfs_info() and from there to
ncp_is_nfs_extras().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ncpfs/ncplib_kernel.h b/fs/ncpfs/ncplib_kernel.h
index 32c0658..ae08b9f 100644
--- a/fs/ncpfs/ncplib_kernel.h
+++ b/fs/ncpfs/ncplib_kernel.h
@@ -119,6 +119,7 @@ int ncp_create_new(struct inode *dir, struct dentry *dentry,
 static inline int ncp_is_nfs_extras(struct ncp_server* server, unsigned int volnum) {
 #ifdef CONFIG_NCPFS_NFS_NS
 	return (server->m.flags & NCP_MOUNT_NFS_EXTRAS) &&
+	       (volnum < ARRAY_SIZE(server->name_space)) &&
 	       (server->name_space[volnum] = NW_NS_NFS);
 #else
 	return 0;
