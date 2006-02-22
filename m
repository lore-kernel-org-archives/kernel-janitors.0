From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 22 Feb 2006 10:18:09 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/nfs
Message-Id: <1140603490.14898.18.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13889319562718483=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140603483.14898.16.camel@alice>
In-Reply-To: <1140603483.14898.16.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============13889319562718483==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this converts fs/nfs to kzalloc() usage.
compile tested with make allyesconfig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/nfs/idmap.c.orig	2006-02-22 10:57:50.000000000 +0100
+++ linux-2.6.16-rc4/fs/nfs/idmap.c	2006-02-22 10:58:20.000000000 +0100
@@ -101,11 +101,9 @@ nfs_idmap_new(struct nfs4_client *clp)
 
 	if (clp->cl_idmap != NULL)
 		return;
-        if ((idmap = kmalloc(sizeof(*idmap), GFP_KERNEL)) == NULL)
+        if ((idmap = kzalloc(sizeof(*idmap), GFP_KERNEL)) == NULL)
                 return;
 
-	memset(idmap, 0, sizeof(*idmap));
-
 	snprintf(idmap->idmap_path, sizeof(idmap->idmap_path),
 	    "%s/idmap", clp->cl_rpcclient->cl_pathname);
 
--- linux-2.6.16-rc4/fs/nfs/inode.c.orig	2006-02-22 10:58:29.000000000 +0100
+++ linux-2.6.16-rc4/fs/nfs/inode.c	2006-02-22 10:59:09.000000000 +0100
@@ -1637,10 +1637,9 @@ static struct super_block *nfs_get_sb(st
 #endif /* CONFIG_NFS_V3 */
 
 	s = ERR_PTR(-ENOMEM);
-	server = kmalloc(sizeof(struct nfs_server), GFP_KERNEL);
+	server = kzalloc(sizeof(struct nfs_server), GFP_KERNEL);
 	if (!server)
 		goto out_err;
-	memset(server, 0, sizeof(struct nfs_server));
 	/* Zero out the NFS state stuff */
 	init_nfsv4_state(server);
 	server->client = server->client_sys = server->client_acl = ERR_PTR(-EINVAL);
@@ -1941,10 +1940,9 @@ static struct super_block *nfs4_get_sb(s
 		return ERR_PTR(-EINVAL);
 	}
 
-	server = kmalloc(sizeof(struct nfs_server), GFP_KERNEL);
+	server = kzalloc(sizeof(struct nfs_server), GFP_KERNEL);
 	if (!server)
 		return ERR_PTR(-ENOMEM);
-	memset(server, 0, sizeof(struct nfs_server));
 	/* Zero out the NFS state stuff */
 	init_nfsv4_state(server);
 	server->client = server->client_sys = server->client_acl = ERR_PTR(-EINVAL);
--- linux-2.6.16-rc4/fs/nfs/unlink.c.orig	2006-02-22 10:59:21.000000000 +0100
+++ linux-2.6.16-rc4/fs/nfs/unlink.c	2006-02-22 10:59:36.000000000 +0100
@@ -163,10 +163,9 @@ nfs_async_unlink(struct dentry *dentry)
 	struct rpc_clnt	*clnt = NFS_CLIENT(dir->d_inode);
 	int		status = -ENOMEM;
 
-	data = kmalloc(sizeof(*data), GFP_KERNEL);
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
 		goto out;
-	memset(data, 0, sizeof(*data));
 
 	data->cred = rpcauth_lookupcred(clnt->cl_auth, 0);
 	if (IS_ERR(data->cred)) {
--- linux-2.6.16-rc4/fs/nfs/write.c.orig	2006-02-22 10:57:05.000000000 +0100
+++ linux-2.6.16-rc4/fs/nfs/write.c	2006-02-22 10:57:38.000000000 +0100
@@ -100,10 +100,8 @@ static inline struct nfs_write_data *nfs
 			p->pagevec = &p->page_array[0];
 		else {
 			size_t size = ++pagecount * sizeof(struct page *);
-			p->pagevec = kmalloc(size, GFP_NOFS);
-			if (p->pagevec) {
-				memset(p->pagevec, 0, size);
-			} else {
+			p->pagevec = kzalloc(size, GFP_NOFS);
+			if (!p->pagevec) {
 				mempool_free(p, nfs_commit_mempool);
 				p = NULL;
 			}



--===============13889319562718483==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13889319562718483==--
