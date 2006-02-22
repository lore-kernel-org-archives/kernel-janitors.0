From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 22 Feb 2006 10:17:54 +0000
Subject: [KJ] [Patch] kzalloc conversion in fs/lockd
Message-Id: <1140603474.14898.15.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73815854369876566=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============73815854369876566==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this converts fs/lockd to kzalloc() usage.
compile tested with make allyesconfig

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc4/fs/lockd/clntproc.c.orig	2006-02-22 10:49:02.000000000 +0100
+++ linux-2.6.16-rc4/fs/lockd/clntproc.c	2006-02-22 10:49:42.000000000 +0100
@@ -292,9 +292,8 @@ nlmclnt_alloc_call(void)
 	struct nlm_rqst	*call;
 
 	while (!signalled()) {
-		call = (struct nlm_rqst *) kmalloc(sizeof(struct nlm_rqst), GFP_KERNEL);
+		call = (struct nlm_rqst *) kzalloc(sizeof(struct nlm_rqst), GFP_KERNEL);
 		if (call) {
-			memset(call, 0, sizeof(*call));
 			locks_init_lock(&call->a_args.lock.fl);
 			locks_init_lock(&call->a_res.lock.fl);
 			return call;
--- linux-2.6.16-rc4/fs/lockd/host.c.orig	2006-02-22 10:49:52.000000000 +0100
+++ linux-2.6.16-rc4/fs/lockd/host.c	2006-02-22 10:50:04.000000000 +0100
@@ -99,9 +99,8 @@ nlm_lookup_host(int server, struct socka
 	/* Ooops, no host found, create it */
 	dprintk("lockd: creating host entry\n");
 
-	if (!(host = (struct nlm_host *) kmalloc(sizeof(*host), GFP_KERNEL)))
+	if (!(host = (struct nlm_host *) kzalloc(sizeof(*host), GFP_KERNEL)))
 		goto nohost;
-	memset(host, 0, sizeof(*host));
 
 	addr = sin->sin_addr.s_addr;
 	sprintf(host->h_name, "%u.%u.%u.%u", NIPQUAD(addr));
--- linux-2.6.16-rc4/fs/lockd/svclock.c.orig	2006-02-22 10:48:31.000000000 +0100
+++ linux-2.6.16-rc4/fs/lockd/svclock.c	2006-02-22 10:48:47.000000000 +0100
@@ -183,9 +183,8 @@ nlmsvc_create_block(struct svc_rqst *rqs
 		return NULL;
 
 	/* Allocate memory for block, and initialize arguments */
-	if (!(block = (struct nlm_block *) kmalloc(sizeof(*block), GFP_KERNEL)))
+	if (!(block = (struct nlm_block *) kzalloc(sizeof(*block), GFP_KERNEL)))
 		goto failed;
-	memset(block, 0, sizeof(*block));
 	locks_init_lock(&block->b_call.a_args.lock.fl);
 	locks_init_lock(&block->b_call.a_res.lock.fl);
 
--- linux-2.6.16-rc4/fs/lockd/svcsubs.c.orig	2006-02-22 10:48:02.000000000 +0100
+++ linux-2.6.16-rc4/fs/lockd/svcsubs.c	2006-02-22 10:48:18.000000000 +0100
@@ -100,11 +100,10 @@ nlm_lookup_file(struct svc_rqst *rqstp, 
 	nlm_debug_print_fh("creating file for", f);
 
 	nfserr = nlm_lck_denied_nolocks;
-	file = (struct nlm_file *) kmalloc(sizeof(*file), GFP_KERNEL);
+	file = (struct nlm_file *) kzalloc(sizeof(*file), GFP_KERNEL);
 	if (!file)
 		goto out_unlock;
 
-	memset(file, 0, sizeof(*file));
 	memcpy(&file->f_handle, f, sizeof(struct nfs_fh));
 	file->f_hash = hash;
 	init_MUTEX(&file->f_sema);



--===============73815854369876566==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73815854369876566==--
