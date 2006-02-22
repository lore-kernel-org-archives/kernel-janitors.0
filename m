From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 22 Feb 2006 10:18:03 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/nfsd
Message-Id: <1140603483.14898.16.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8216808053273863=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8216808053273863==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this converts fs/nfsd to kzalloc() usage.
compile tested with make allyesconfig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/nfsd/nfs4idmap.c.orig	2006-02-22 10:53:10.000000000 +0100
+++ linux-2.6.16-rc4/fs/nfsd/nfs4idmap.c	2006-02-22 10:53:26.000000000 +0100
@@ -502,10 +502,9 @@ idmap_lookup(struct svc_rqst *rqstp,
 	struct idmap_defer_req *mdr;
 	int ret;
 
-	mdr = kmalloc(sizeof(*mdr), GFP_KERNEL);
+	mdr = kzalloc(sizeof(*mdr), GFP_KERNEL);
 	if (!mdr)
 		return -ENOMEM;
-	memset(mdr, 0, sizeof(*mdr));
 	atomic_set(&mdr->count, 1);
 	init_waitqueue_head(&mdr->waitq);
 	mdr->req.defer = idmap_defer;
--- linux-2.6.16-rc4/fs/nfsd/nfs4state.c.orig	2006-02-22 10:50:54.000000000 +0100
+++ linux-2.6.16-rc4/fs/nfsd/nfs4state.c	2006-02-22 10:51:27.000000000 +0100
@@ -298,8 +298,7 @@ alloc_client(struct xdr_netobj name)
 {
 	struct nfs4_client *clp;
 
-	if ((clp = kmalloc(sizeof(struct nfs4_client), GFP_KERNEL))!= NULL) {
-		memset(clp, 0, sizeof(*clp));
+	if ((clp = kzalloc(sizeof(struct nfs4_client), GFP_KERNEL))!= NULL) {
 		if ((clp->cl_name.data = kmalloc(name.len, GFP_KERNEL)) != NULL) {
 			memcpy(clp->cl_name.data, name.data, name.len);
 			clp->cl_name.len = name.len;
--- linux-2.6.16-rc4/fs/nfsd/vfs.c.orig	2006-02-22 10:51:37.000000000 +0100
+++ linux-2.6.16-rc4/fs/nfsd/vfs.c	2006-02-22 10:51:58.000000000 +0100
@@ -1846,12 +1846,11 @@ nfsd_racache_init(int cache_size)
 
 	if (raparm_cache)
 		return 0;
-	raparml = kmalloc(sizeof(struct raparms) * cache_size, GFP_KERNEL);
+	raparml = kzalloc(sizeof(struct raparms) * cache_size, GFP_KERNEL);
 
 	if (raparml != NULL) {
 		dprintk("nfsd: allocating %d readahead buffers.\n",
 			cache_size);
-		memset(raparml, 0, sizeof(struct raparms) * cache_size);
 		for (i = 0; i < cache_size - 1; i++) {
 			raparml[i].p_next = raparml + i + 1;
 		}



--===============8216808053273863==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8216808053273863==--
