From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Tue, 24 Jan 2006 21:50:15 +0000
Subject: [KJ] [PATCH] fs: Use ARRAY_SIZE macro
Message-Id: <20060124215015.GC1178@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55987136014717875=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============55987136014717875==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]) and remove a
duplicate of ARRAY_SIZE. Some trailing whitespaces are also deleted.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 fs/afs/cmservice.c           |    2 +-
 fs/compat_ioctl.c            |    5 ++---
 fs/jfs/jfs_debug.c           |    2 +-
 fs/lockd/mon.c               |    6 +++---
 fs/lockd/svc.c               |    2 +-
 fs/lockd/xdr.c               |    2 +-
 fs/nfs/inode.c               |    4 ++--
 fs/nfs/mount_clnt.c          |    2 +-
 fs/nfs/nfs2xdr.c             |    2 +-
 fs/nfs/nfs3xdr.c             |    2 +-
 fs/nfs/nfs4xdr.c             |    2 +-
 fs/nfsctl.c                  |    2 +-
 fs/nfsd/nfs4acl.c            |    4 ++--
 fs/nfsd/nfs4callback.c       |    4 ++--
 fs/nfsd/nfs4xdr.c            |    2 +-
 fs/nfsd/nfsctl.c             |    2 +-
 fs/nfsd/nfssvc.c             |    4 ++--
 fs/nls/nls_euc-jp.c          |    6 ++----
 fs/reiserfs/prints.c         |    9 +++------
 fs/sysv/super.c              |    4 ++--
 fs/udf/super.c               |   19 +++++++------------
 fs/xfs/linux-2.6/xfs_stats.c |    2 +-
 fs/xfs/xfs_vnodeops.c        |    2 +-
 23 files changed, 40 insertions(+), 51 deletions(-)

diff -X dontdiff -urpN linux-2.6.16-rc1/fs/afs/cmservice.c linux-2.6.16-rc1~array_size/fs/afs/cmservice.c
--- linux-2.6.16-rc1/fs/afs/cmservice.c	2006-01-24 08:04:12.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/afs/cmservice.c	2006-01-24 08:07:42.000000000 +0100
@@ -94,7 +94,7 @@ static struct rxrpc_service AFSCM_servic
 	.error_func	= afscm_error,
 	.aemap_func	= afscm_aemap,
 	.ops_begin	= &AFSCM_ops[0],
-	.ops_end	= &AFSCM_ops[sizeof(AFSCM_ops) / sizeof(AFSCM_ops[0])],
+	.ops_end	= &AFSCM_ops[ARRAY_SIZE(AFSCM_ops)],
 };
 
 static DECLARE_COMPLETION(kafscmd_alive);
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/compat_ioctl.c linux-2.6.16-rc1~array_size/fs/compat_ioctl.c
--- linux-2.6.16-rc1/fs/compat_ioctl.c	2006-01-24 08:04:12.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/compat_ioctl.c	2006-01-24 08:07:42.000000000 +0100
@@ -1521,8 +1521,7 @@ static struct {
 	{ ATM_QUERYLOOP32,   ATM_QUERYLOOP }
 };
 
-#define NR_ATM_IOCTL (sizeof(atm_ioctl_map)/sizeof(atm_ioctl_map[0]))
-
+#define NR_ATM_IOCTL ARRAY_SIZE(atm_ioctl_map)
 
 static int do_atm_iobuf(unsigned int fd, unsigned int cmd, unsigned long arg)
 {
@@ -1823,7 +1822,7 @@ static struct {
 	{ FDWERRORGET32, FDWERRORGET }
 };
 
-#define NR_FD_IOCTL_TRANS (sizeof(fd_ioctl_trans_table)/sizeof(fd_ioctl_trans_table[0]))
+#define NR_FD_IOCTL_TRANS ARRAY_SIZE(fd_ioctl_trans_table)
 
 static int fd_ioctl_trans(unsigned int fd, unsigned int cmd, unsigned long arg)
 {
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/jfs/jfs_debug.c linux-2.6.16-rc1~array_size/fs/jfs/jfs_debug.c
--- linux-2.6.16-rc1/fs/jfs/jfs_debug.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.16-rc1~array_size/fs/jfs/jfs_debug.c	2006-01-24 08:07:42.000000000 +0100
@@ -111,7 +111,7 @@ static struct {
 	{ "loglevel",	loglevel_read, loglevel_write }
 #endif
 };
-#define NPROCENT	(sizeof(Entries)/sizeof(Entries[0]))
+#define NPROCENT	ARRAY_SIZE(Entries)
 
 void jfs_proc_init(void)
 {
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/lockd/mon.c linux-2.6.16-rc1~array_size/fs/lockd/mon.c
--- linux-2.6.16-rc1/fs/lockd/mon.c	2006-01-24 08:04:12.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/lockd/mon.c	2006-01-24 08:07:42.000000000 +0100
@@ -224,8 +224,8 @@ static struct rpc_procinfo	nsm_procedure
 };
 
 static struct rpc_version	nsm_version1 = {
-		.number		= 1, 
-		.nrprocs	= sizeof(nsm_procedures)/sizeof(nsm_procedures[0]),
+		.number		= 1,
+		.nrprocs	= ARRAY_SIZE(nsm_procedures),
 		.procs		= nsm_procedures
 };
 
@@ -238,7 +238,7 @@ static struct rpc_stat		nsm_stats;
 static struct rpc_program	nsm_program = {
 		.name		= "statd",
 		.number		= SM_PROGRAM,
-		.nrvers		= sizeof(nsm_version)/sizeof(nsm_version[0]),
+		.nrvers		= ARRAY_SIZE(nsm_version),
 		.version	= nsm_version,
 		.stats		= &nsm_stats
 };
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/lockd/svc.c linux-2.6.16-rc1~array_size/fs/lockd/svc.c
--- linux-2.6.16-rc1/fs/lockd/svc.c	2006-01-24 08:04:12.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/lockd/svc.c	2006-01-24 08:07:42.000000000 +0100
@@ -509,7 +509,7 @@ static struct svc_version *	nlmsvc_versi
 
 static struct svc_stat		nlmsvc_stats;
 
-#define NLM_NRVERS	(sizeof(nlmsvc_version)/sizeof(nlmsvc_version[0]))
+#define NLM_NRVERS	ARRAY_SIZE(nlmsvc_version)
 static struct svc_program	nlmsvc_program = {
 	.pg_prog		= NLM_PROGRAM,		/* program number */
 	.pg_nvers		= NLM_NRVERS,		/* number of entries in nlmsvc_version */
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/lockd/xdr.c linux-2.6.16-rc1~array_size/fs/lockd/xdr.c
--- linux-2.6.16-rc1/fs/lockd/xdr.c	2006-01-24 08:04:12.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/lockd/xdr.c	2006-01-24 08:07:42.000000000 +0100
@@ -599,7 +599,7 @@ static struct rpc_stat		nlm_stats;
 struct rpc_program		nlm_program = {
 		.name		= "lockd",
 		.number		= NLM_PROGRAM,
-		.nrvers		= sizeof(nlm_versions) / sizeof(nlm_versions[0]),
+		.nrvers		= ARRAY_SIZE(nlm_versions),
 		.version	= nlm_versions,
 		.stats		= &nlm_stats,
 };
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/nfs/inode.c linux-2.6.16-rc1~array_size/fs/nfs/inode.c
--- linux-2.6.16-rc1/fs/nfs/inode.c	2006-01-24 08:04:12.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/nfs/inode.c	2006-01-24 08:07:42.000000000 +0100
@@ -103,7 +103,7 @@ static struct rpc_version *	nfs_version[
 static struct rpc_program	nfs_program = {
 	.name			= "nfs",
 	.number			= NFS_PROGRAM,
-	.nrvers			= sizeof(nfs_version) / sizeof(nfs_version[0]),
+	.nrvers			= ARRAY_SIZE(nfs_version),
 	.version		= nfs_version,
 	.stats			= &nfs_rpcstat,
 	.pipe_dir_name		= "/nfs",
@@ -118,7 +118,7 @@ static struct rpc_version *	nfsacl_versi
 struct rpc_program		nfsacl_program = {
 	.name =			"nfsacl",
 	.number =		NFS_ACL_PROGRAM,
-	.nrvers =		sizeof(nfsacl_version) / sizeof(nfsacl_version[0]),
+	.nrvers =		ARRAY_SIZE(nfsacl_version),
 	.version =		nfsacl_version,
 	.stats =		&nfsacl_rpcstat,
 };
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/nfs/mount_clnt.c linux-2.6.16-rc1~array_size/fs/nfs/mount_clnt.c
--- linux-2.6.16-rc1/fs/nfs/mount_clnt.c	2006-01-24 08:04:12.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/nfs/mount_clnt.c	2006-01-24 08:07:42.000000000 +0100
@@ -174,7 +174,7 @@ static struct rpc_stat		mnt_stats;
 static struct rpc_program	mnt_program = {
 	.name		= "mount",
 	.number		= NFS_MNT_PROGRAM,
-	.nrvers		= sizeof(mnt_version)/sizeof(mnt_version[0]),
+	.nrvers		= ARRAY_SIZE(mnt_version),
 	.version	= mnt_version,
 	.stats		= &mnt_stats,
 };
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/nfs/nfs2xdr.c linux-2.6.16-rc1~array_size/fs/nfs/nfs2xdr.c
--- linux-2.6.16-rc1/fs/nfs/nfs2xdr.c	2006-01-24 08:04:12.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/nfs/nfs2xdr.c	2006-01-24 08:07:42.000000000 +0100
@@ -704,6 +704,6 @@ struct rpc_procinfo	nfs_procedures[] = {
 
 struct rpc_version		nfs_version2 = {
 	.number			= 2,
-	.nrprocs		= sizeof(nfs_procedures)/sizeof(nfs_procedures[0]),
+	.nrprocs		= ARRAY_SIZE(nfs_procedures),
 	.procs			= nfs_procedures
 };
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/nfs/nfs3xdr.c linux-2.6.16-rc1~array_size/fs/nfs/nfs3xdr.c
--- linux-2.6.16-rc1/fs/nfs/nfs3xdr.c	2006-01-24 08:04:12.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/nfs/nfs3xdr.c	2006-01-24 08:07:42.000000000 +0100
@@ -1138,7 +1138,7 @@ struct rpc_procinfo	nfs3_procedures[] = 
 
 struct rpc_version		nfs_version3 = {
 	.number			= 3,
-	.nrprocs		= sizeof(nfs3_procedures)/sizeof(nfs3_procedures[0]),
+	.nrprocs		= ARRAY_SIZE(nfs3_procedures),
 	.procs			= nfs3_procedures
 };
 
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/nfs/nfs4xdr.c linux-2.6.16-rc1~array_size/fs/nfs/nfs4xdr.c
--- linux-2.6.16-rc1/fs/nfs/nfs4xdr.c	2006-01-24 08:04:12.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/nfs/nfs4xdr.c	2006-01-24 08:07:42.000000000 +0100
@@ -4384,7 +4384,7 @@ struct rpc_procinfo	nfs4_procedures[] = 
 
 struct rpc_version		nfs_version4 = {
 	.number			= 4,
-	.nrprocs		= sizeof(nfs4_procedures)/sizeof(nfs4_procedures[0]),
+	.nrprocs		= ARRAY_SIZE(nfs4_procedures),
 	.procs			= nfs4_procedures
 };
 
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/nfsctl.c linux-2.6.16-rc1~array_size/fs/nfsctl.c
--- linux-2.6.16-rc1/fs/nfsctl.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.16-rc1~array_size/fs/nfsctl.c	2006-01-24 08:07:42.000000000 +0100
@@ -102,7 +102,7 @@ asmlinkage sys_nfsservctl(int cmd, struc
 		return -EINVAL;
 	}
 
-	if (cmd < 0 || cmd >= sizeof(map)/sizeof(map[0]) || !map[cmd].name)
+	if (cmd < 0 || cmd >= ARRAY_SIZE(map) || !map[cmd].name)
 		return -EINVAL;
 
 	file = do_open(map[cmd].name, map[cmd].rsize ? O_RDWR : O_WRONLY);	
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/nfsd/nfs4acl.c linux-2.6.16-rc1~array_size/fs/nfsd/nfs4acl.c
--- linux-2.6.16-rc1/fs/nfsd/nfs4acl.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.16-rc1~array_size/fs/nfsd/nfs4acl.c	2006-01-24 14:40:07.000000000 +0100
@@ -907,7 +907,7 @@ nfs4_acl_get_whotype(char *p, u32 len)
 {
 	int i;
 
-	for (i=0; i < sizeof(s2t_map) / sizeof(*s2t_map); i++) {
+	for (i = 0; i < ARRAY_SIZE(s2t_map); i++) {
 		if (s2t_map[i].stringlen == len &&
 				0 == memcmp(s2t_map[i].string, p, len))
 			return s2t_map[i].type;
@@ -920,7 +920,7 @@ nfs4_acl_write_who(int who, char *p)
 {
 	int i;
 
-	for (i=0; i < sizeof(s2t_map) / sizeof(*s2t_map); i++) {
+	for (i = 0; i < ARRAY_SIZE(s2t_map); i++) {
 		if (s2t_map[i].type == who) {
 			memcpy(p, s2t_map[i].string, s2t_map[i].stringlen);
 			return s2t_map[i].stringlen;
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/nfsd/nfs4callback.c linux-2.6.16-rc1~array_size/fs/nfsd/nfs4callback.c
--- linux-2.6.16-rc1/fs/nfsd/nfs4callback.c	2006-01-24 08:04:12.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/nfsd/nfs4callback.c	2006-01-24 14:40:30.000000000 +0100
@@ -335,7 +335,7 @@ static struct rpc_procinfo     nfs4_cb_p
 
 static struct rpc_version       nfs_cb_version4 = {
         .number                 = 1,
-        .nrprocs                = sizeof(nfs4_cb_procedures)/sizeof(nfs4_cb_procedures[0]),
+        .nrprocs                = ARRAY_SIZE(nfs4_cb_procedures),
         .procs                  = nfs4_cb_procedures
 };
 
@@ -411,7 +411,7 @@ nfsd4_probe_callback(struct nfs4_client 
 	/* Initialize rpc_program */
 	program->name = "nfs4_cb";
 	program->number = cb->cb_prog;
-	program->nrvers = sizeof(nfs_cb_version)/sizeof(nfs_cb_version[0]);
+	program->nrvers = ARRAY_SIZE(nfs_cb_version);
 	program->version = nfs_cb_version;
 	program->stats = stat;
 
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/nfsd/nfs4xdr.c linux-2.6.16-rc1~array_size/fs/nfsd/nfs4xdr.c
--- linux-2.6.16-rc1/fs/nfsd/nfs4xdr.c	2006-01-03 14:41:57.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/nfsd/nfs4xdr.c	2006-01-24 08:07:42.000000000 +0100
@@ -992,7 +992,7 @@ nfsd4_decode_compound(struct nfsd4_compo
 	if (argp->opcnt > 100)
 		goto xdr_error;
 
-	if (argp->opcnt > sizeof(argp->iops)/sizeof(argp->iops[0])) {
+	if (argp->opcnt > ARRAY_SIZE(argp->iops)) {
 		argp->ops = kmalloc(argp->opcnt * sizeof(*argp->ops), GFP_KERNEL);
 		if (!argp->ops) {
 			argp->ops = argp->iops;
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/nfsd/nfsctl.c linux-2.6.16-rc1~array_size/fs/nfsd/nfsctl.c
--- linux-2.6.16-rc1/fs/nfsd/nfsctl.c	2006-01-03 14:41:57.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/nfsd/nfsctl.c	2006-01-24 08:07:42.000000000 +0100
@@ -105,7 +105,7 @@ static ssize_t nfsctl_transaction_write(
 	char *data;
 	ssize_t rv;
 
-	if (ino >= sizeof(write_op)/sizeof(write_op[0]) || !write_op[ino])
+	if (ino >= ARRAY_SIZE(write_op) || !write_op[ino])
 		return -EINVAL;
 
 	data = simple_transaction_get(file, buf, size);
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/nfsd/nfssvc.c linux-2.6.16-rc1~array_size/fs/nfsd/nfssvc.c
--- linux-2.6.16-rc1/fs/nfsd/nfssvc.c	2006-01-03 14:41:57.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/nfsd/nfssvc.c	2006-01-24 14:41:06.000000000 +0100
@@ -75,7 +75,7 @@ static struct svc_version *	nfsd_version
 };
 
 #define NFSD_MINVERS    	2
-#define NFSD_NRVERS		(sizeof(nfsd_version)/sizeof(nfsd_version[0]))
+#define NFSD_NRVERS		ARRAY_SIZE(nfsd_version)
 static struct svc_version *nfsd_versions[NFSD_NRVERS];
 
 struct svc_program		nfsd_program = {
@@ -419,7 +419,7 @@ static struct svc_version *	nfsd_acl_ver
 	[3] = &nfsd_acl_version3,
 };
 
-#define NFSD_ACL_NRVERS		(sizeof(nfsd_acl_version)/sizeof(nfsd_acl_version[0]))
+#define NFSD_ACL_NRVERS		ARRAY_SIZE(nfsd_acl_version)
 static struct svc_program	nfsd_acl_program = {
 	.pg_prog		= NFS_ACL_PROGRAM,
 	.pg_nvers		= NFSD_ACL_NRVERS,
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/nls/nls_euc-jp.c linux-2.6.16-rc1~array_size/fs/nls/nls_euc-jp.c
--- linux-2.6.16-rc1/fs/nls/nls_euc-jp.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.16-rc1~array_size/fs/nls/nls_euc-jp.c	2006-01-24 08:07:42.000000000 +0100
@@ -268,8 +268,6 @@ static unsigned char euc2sjisibm_g3upper
 	{0xFC, 0x4B},
 };
 
-#define MAP_ELEMENT_OF(map)	(sizeof(map) / sizeof(map[0]))
-
 static inline int sjisibm2euc(unsigned char *euc, const unsigned char sjis_hi,
 			      const unsigned char sjis_lo);
 static inline int euc2sjisibm_jisx0212(unsigned char *sjis, const unsigned char euc_hi,
@@ -310,7 +308,7 @@ static inline int euc2sjisibm_jisx0212(u
 	unsigned short euc;
 
 	min_index = 0;
-	max_index = MAP_ELEMENT_OF(euc2sjisibm_jisx0212_map) - 1;
+	max_index = ARRAY_SIZE(euc2sjisibm_jisx0212_map) - 1;
 	euc = (euc_hi << 8) | euc_lo;
 
 	while (min_index <= max_index) {
@@ -339,7 +337,7 @@ static inline int euc2sjisibm_g3upper(un
 	else
 		index = ((euc_hi << 8) | euc_lo) - 0xF4A1 + 12;
 
-	if ((index < 0) || (index >= MAP_ELEMENT_OF(euc2sjisibm_g3upper_map)))
+	if ((index < 0) || (index >= ARRAY_SIZE(euc2sjisibm_g3upper_map)))
 		return 0;
 
 	sjis[0] = euc2sjisibm_g3upper_map[index][0];
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/reiserfs/prints.c linux-2.6.16-rc1~array_size/fs/reiserfs/prints.c
--- linux-2.6.16-rc1/fs/reiserfs/prints.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.16-rc1~array_size/fs/reiserfs/prints.c	2006-01-24 14:53:05.000000000 +0100
@@ -601,8 +601,7 @@ void store_print_tb(struct tree_balance 
 		tb->tb_mode, PATH_LAST_POSITION(tb->tb_path),
 		tb->tb_path->pos_in_item);
 
-	for (h = 0; h < sizeof(tb->insert_size) / sizeof(tb->insert_size[0]);
-	     h++) {
+	for (h = 0; h < ARRAY_SIZE(tb->insert_size); h++) {
 		if (PATH_H_PATH_OFFSET(tb->tb_path, h) <=
 		    tb->tb_path->path_length
 		    && PATH_H_PATH_OFFSET(tb->tb_path,
@@ -658,15 +657,13 @@ void store_print_tb(struct tree_balance 
 
 	/* print FEB list (list of buffers in form (bh (b_blocknr, b_count), that will be used for new nodes) */
 	h = 0;
-	for (i = 0; i < sizeof(tb->FEB) / sizeof(tb->FEB[0]); i++)
+	for (i = 0; i < ARRAY_SIZE(tb->FEB); i++)
 		sprintf(print_tb_buf + strlen(print_tb_buf),
 			"%p (%llu %d)%s", tb->FEB[i],
 			tb->FEB[i] ? (unsigned long long)tb->FEB[i]->
 			b_blocknr : 0ULL,
 			tb->FEB[i] ? atomic_read(&(tb->FEB[i]->b_count)) : 0,
-			(i ==
-			 sizeof(tb->FEB) / sizeof(tb->FEB[0]) -
-			 1) ? "\n" : ", ");
+			(i == ARRAY_SIZE(tb->FEB) - 1) ? "\n" : ", ");
 
 	sprintf(print_tb_buf + strlen(print_tb_buf),
 		"======================== the end ====================================\n");
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/sysv/super.c linux-2.6.16-rc1~array_size/fs/sysv/super.c
--- linux-2.6.16-rc1/fs/sysv/super.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.16-rc1~array_size/fs/sysv/super.c	2006-01-24 08:07:42.000000000 +0100
@@ -377,10 +377,10 @@ static int sysv_fill_super(struct super_
 	sbi->s_sb = sb;
 	sbi->s_block_base = 0;
 	sb->s_fs_info = sbi;
-	
+
 	sb_set_blocksize(sb, BLOCK_SIZE);
 
-	for (i = 0; i < sizeof(flavours)/sizeof(flavours[0]) && !size; i++) {
+	for (i = 0; i < ARRAY_SIZE(flavours) && !size; i++) {
 		brelse(bh);
 		bh = sb_bread(sb, flavours[i].block);
 		if (!bh)
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/udf/super.c linux-2.6.16-rc1~array_size/fs/udf/super.c
--- linux-2.6.16-rc1/fs/udf/super.c	2006-01-24 08:04:13.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/udf/super.c	2006-01-24 14:51:21.000000000 +0100
@@ -644,8 +644,7 @@ udf_find_anchor(struct super_block *sb)
 		 *     lastblock
 		 *  however, if the disc isn't closed, it could be 512 */
 
-		for (i=0; (!lastblock && i<sizeof(last)/sizeof(int)); i++)
-		{
+		for (i = 0; !lastblock && i < ARRAY_SIZE(last); i++) {
 			if (last[i] < 0 || !(bh = sb_bread(sb, last[i])))
 			{
 				ident = location = 0;
@@ -656,7 +655,7 @@ udf_find_anchor(struct super_block *sb)
 				location = le32_to_cpu(((tag *)bh->b_data)->tagLocation);
 				udf_release_data(bh);
 			}
-	
+
 			if (ident == TAG_IDENT_AVDP)
 			{
 				if (location == last[i] - UDF_SB_SESSION(sb))
@@ -737,8 +736,7 @@ udf_find_anchor(struct super_block *sb)
 		}
 	}
 
-	for (i=0; i<sizeof(UDF_SB_ANCHOR(sb))/sizeof(int); i++)
-	{
+	for (i = 0; i < ARRAY_SIZE(UDF_SB_ANCHOR(sb)); i++) {
 		if (UDF_SB_ANCHOR(sb)[i])
 		{
 			if (!(bh = udf_read_tagged(sb,
@@ -1297,8 +1295,7 @@ udf_load_partition(struct super_block *s
 	if (!sb)
 		return 1;
 
-	for (i=0; i<sizeof(UDF_SB_ANCHOR(sb))/sizeof(int); i++)
-	{
+	for (i = 0; i < ARRAY_SIZE(UDF_SB_ANCHOR(sb)); i++) {
 		if (UDF_SB_ANCHOR(sb)[i] && (bh = udf_read_tagged(sb,
 			UDF_SB_ANCHOR(sb)[i], UDF_SB_ANCHOR(sb)[i], &ident)))
 		{
@@ -1309,7 +1306,7 @@ udf_load_partition(struct super_block *s
 			main_e = le32_to_cpu( anchor->mainVolDescSeqExt.extLength );
 			main_e = main_e >> sb->s_blocksize_bits;
 			main_e += main_s;
-	
+
 			/* Locate the reserve sequence */
 			reserve_s = le32_to_cpu(anchor->reserveVolDescSeqExt.extLocation);
 			reserve_e = le32_to_cpu(anchor->reserveVolDescSeqExt.extLength);
@@ -1328,12 +1325,10 @@ udf_load_partition(struct super_block *s
 		}
 	}
 
-	if (i == sizeof(UDF_SB_ANCHOR(sb))/sizeof(int))
-	{
+	if (i == ARRAY_SIZE(UDF_SB_ANCHOR(sb))) {
 		udf_debug("No Anchor block found\n");
 		return 1;
-	}
-	else
+	} else
 		udf_debug("Using anchor in block %d\n", UDF_SB_ANCHOR(sb)[i]);
 
 	for (i=0; i<UDF_SB_NUMPARTS(sb); i++)
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/xfs/linux-2.6/xfs_stats.c linux-2.6.16-rc1~array_size/fs/xfs/linux-2.6/xfs_stats.c
--- linux-2.6.16-rc1/fs/xfs/linux-2.6/xfs_stats.c	2006-01-24 08:04:13.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/xfs/linux-2.6/xfs_stats.c	2006-01-24 08:07:42.000000000 +0100
@@ -56,7 +56,7 @@ xfs_read_xfsstats(
 	};
 
 	/* Loop over all stats groups */
-	for (i=j=len = 0; i < sizeof(xstats)/sizeof(struct xstats_entry); i++) {
+	for (i=j=len = 0; i < ARRAY_SIZE(xstats); i++) {
 		len += sprintf(buffer + len, xstats[i].desc);
 		/* inner loop does each group */
 		while (j < xstats[i].endpoint) {
diff -X dontdiff -urpN linux-2.6.16-rc1/fs/xfs/xfs_vnodeops.c linux-2.6.16-rc1~array_size/fs/xfs/xfs_vnodeops.c
--- linux-2.6.16-rc1/fs/xfs/xfs_vnodeops.c	2006-01-24 08:04:13.000000000 +0100
+++ linux-2.6.16-rc1~array_size/fs/xfs/xfs_vnodeops.c	2006-01-24 08:07:42.000000000 +0100
@@ -1334,7 +1334,7 @@ xfs_inactive_symlink_rmt(
 	 */
 	done = 0;
 	XFS_BMAP_INIT(&free_list, &first_block);
-	nmaps = sizeof(mval) / sizeof(mval[0]);
+	nmaps = ARRAY_SIZE(mval);
 	if ((error = xfs_bmapi(tp, ip, 0, XFS_B_TO_FSB(mp, size),
 			XFS_BMAPI_METADATA, &first_block, 0, mval, &nmaps,
 			&free_list)))

--===============55987136014717875==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55987136014717875==--
