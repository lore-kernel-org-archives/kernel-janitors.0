From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 02:41:59 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - security.h - compiler cleanups
Message-Id: <200402122141.59608.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_3lDLA7+UfDoYCb4"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_3lDLA7+UfDoYCb4
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Well, it's probably useless, but I like clean compiles.

This "large" patch eliminates a bunch of "parameter defined but not used" 
warnings in the kernel.  The problems surround the stub functions in 
security.h that haven't been coded yet.

Enjoy...


-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_3lDLA7+UfDoYCb4
Content-Type: text/x-diff;
  charset="us-ascii";
  name="security.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="security.h.diff"

--- linux-2.6.2.orig/include/linux/security.h	2004-02-03 22:44:05.000000000 -0500
+++ linux-2.6.2/include/linux/security.h	2004-02-12 21:06:12.000000000 -0500
@@ -1908,22 +1908,30 @@
 
 static inline int security_acct (struct file *file)
 {
+	file = file;
 	return 0;
 }
 
 static inline int security_sysctl(ctl_table * table, int op)
 {
+	table = table;
+	op = op;
 	return 0;
 }
 
 static inline int security_quotactl (int cmds, int type, int id,
 				     struct super_block * sb)
 {
+	cmds = cmds;
+	type = type;
+	id = id;
+	sb = sb;
 	return 0;
 }
 
 static inline int security_quota_on (struct file * file)
 {
+	file = file;
 	return 0;
 }
 
@@ -1939,11 +1947,12 @@
 
 static inline int security_bprm_alloc (struct linux_binprm *bprm)
 {
+	bprm = bprm;
 	return 0;
 }
 
 static inline void security_bprm_free (struct linux_binprm *bprm)
-{ }
+{ bprm = bprm; }
 
 static inline void security_bprm_compute_creds (struct linux_binprm *bprm)
 { 
@@ -1957,6 +1966,7 @@
 
 static inline int security_bprm_check (struct linux_binprm *bprm)
 {
+	bprm = bprm;
 	return 0;
 }
 
@@ -1967,19 +1977,22 @@
 
 static inline int security_sb_alloc (struct super_block *sb)
 {
+	sb = sb;
 	return 0;
 }
 
 static inline void security_sb_free (struct super_block *sb)
-{ }
+{ sb = sb; }
 
 static inline int security_sb_kern_mount (struct super_block *sb)
 {
+	sb = sb;
 	return 0;
 }
 
 static inline int security_sb_statfs (struct super_block *sb)
 {
+	sb = sb;
 	return 0;
 }
 
@@ -1987,82 +2000,102 @@
 				    char *type, unsigned long flags,
 				    void *data)
 {
+	dev_name = dev_name;
+	type = type;
+	flags = flags;
+	nd = nd;
+	data = data;
 	return 0;
 }
 
 static inline int security_sb_check_sb (struct vfsmount *mnt,
 					struct nameidata *nd)
 {
+	mnt = mnt;
+	nd = nd;
 	return 0;
 }
 
 static inline int security_sb_umount (struct vfsmount *mnt, int flags)
 {
+	mnt = mnt;
+	flags = flags;
 	return 0;
 }
 
 static inline void security_sb_umount_close (struct vfsmount *mnt)
-{ }
+{ mnt = mnt; }
 
 static inline void security_sb_umount_busy (struct vfsmount *mnt)
-{ }
+{ mnt = mnt; }
 
 static inline void security_sb_post_remount (struct vfsmount *mnt,
 					     unsigned long flags, void *data)
-{ }
+{ mnt = mnt; flags = flags; data = data; }
 
 static inline void security_sb_post_mountroot (void)
 { }
 
 static inline void security_sb_post_addmount (struct vfsmount *mnt,
 					      struct nameidata *mountpoint_nd)
-{ }
+{ mnt = mnt; mountpoint_nd = mountpoint_nd; }
 
 static inline int security_sb_pivotroot (struct nameidata *old_nd,
 					 struct nameidata *new_nd)
 {
+	old_nd = old_nd;
+	new_nd = new_nd;
 	return 0;
 }
 
 static inline void security_sb_post_pivotroot (struct nameidata *old_nd,
 					       struct nameidata *new_nd)
-{ }
+{ old_nd = old_nd; new_nd = new_nd; }
 
 static inline int security_inode_alloc (struct inode *inode)
 {
+	inode = inode;
 	return 0;
 }
 
 static inline void security_inode_free (struct inode *inode)
-{ }
+{ inode = inode; }
 	
 static inline int security_inode_create (struct inode *dir,
 					 struct dentry *dentry,
 					 int mode)
 {
+	dir = dir;
+	dentry = dentry;
+	mode = mode;
 	return 0;
 }
 
 static inline void security_inode_post_create (struct inode *dir,
 					       struct dentry *dentry,
 					       int mode)
-{ }
+{ dir = dir; dentry = dentry; mode = mode; }
 
 static inline int security_inode_link (struct dentry *old_dentry,
 				       struct inode *dir,
 				       struct dentry *new_dentry)
 {
+	old_dentry = old_dentry;
+	dir = dir;
+	new_dentry = new_dentry;
 	return 0;
 }
 
 static inline void security_inode_post_link (struct dentry *old_dentry,
 					     struct inode *dir,
 					     struct dentry *new_dentry)
-{ }
+{ old_dentry = old_dentry; dir = dir; new_dentry = new_dentry; }
 
 static inline int security_inode_unlink (struct inode *dir,
 					 struct dentry *dentry)
 {
+	dir = dir;
+	dentry = dentry;
 	return 0;
 }
 
@@ -2070,29 +2103,37 @@
 					  struct dentry *dentry,
 					  const char *old_name)
 {
+	dir = dir;
+	dentry = dentry;
+	old_name = old_name;
 	return 0;
 }
 
 static inline void security_inode_post_symlink (struct inode *dir,
 						struct dentry *dentry,
 						const char *old_name)
-{ }
+{ dir = dir; dentry = dentry; old_name = old_name; }
 
 static inline int security_inode_mkdir (struct inode *dir,
 					struct dentry *dentry,
 					int mode)
 {
+	dir = dir;
+	dentry = dentry;
+	mode = mode;
 	return 0;
 }
 
 static inline void security_inode_post_mkdir (struct inode *dir,
 					      struct dentry *dentry,
 					      int mode)
-{ }
+{ dir = dir; dentry = dentry; mode = mode; }
 
 static inline int security_inode_rmdir (struct inode *dir,
 					struct dentry *dentry)
 {
+	dir = dir;
+	dentry = dentry;
 	return 0;
 }
 
@@ -2100,19 +2141,27 @@
 					struct dentry *dentry,
 					int mode, dev_t dev)
 {
+	dir = dir;
+	dentry = dentry;
+	mode = mode;
+	dev = dev;
 	return 0;
 }
 
 static inline void security_inode_post_mknod (struct inode *dir,
 					      struct dentry *dentry,
 					      int mode, dev_t dev)
-{ }
+{ dir = dir; dentry = dentry; mode = mode; dev = dev; }
 
 static inline int security_inode_rename (struct inode *old_dir,
 					 struct dentry *old_dentry,
 					 struct inode *new_dir,
 					 struct dentry *new_dentry)
 {
+	old_dir = old_dir;
+	old_dentry = old_dentry;
+	new_dir = new_dir;
+	new_dentry = new_dentry;
 	return 0;
 }
 
@@ -2120,39 +2169,54 @@
 					       struct dentry *old_dentry,
 					       struct inode *new_dir,
 					       struct dentry *new_dentry)
-{ }
+{ 
+	old_dir = old_dir; 
+	old_dentry = old_dentry; 
+	new_dir = new_dir; 
+	new_dentry = new_dentry; 
+}
 
 static inline int security_inode_readlink (struct dentry *dentry)
 {
+	dentry = dentry;
 	return 0;
 }
 
 static inline int security_inode_follow_link (struct dentry *dentry,
 					      struct nameidata *nd)
 {
+	dentry = dentry;
+	nd = nd;
 	return 0;
 }
 
 static inline int security_inode_permission (struct inode *inode, int mask,
 					     struct nameidata *nd)
 {
+	inode = inode;
+	mask = mask;
+	nd = nd;
 	return 0;
 }
 
 static inline int security_inode_setattr (struct dentry *dentry,
 					  struct iattr *attr)
 {
+	dentry = dentry;
+	attr = attr;
 	return 0;
 }
 
 static inline int security_inode_getattr (struct vfsmount *mnt,
 					  struct dentry *dentry)
 {
+	mnt = mnt;
+	dentry = dentry;
 	return 0;
 }
 
 static inline void security_inode_delete (struct inode *inode)
-{ }
+{ inode = inode; }
 
 static inline int security_inode_setxattr (struct dentry *dentry, char *name,
 					   void *value, size_t size, int flags)
@@ -2162,15 +2226,24 @@
 
 static inline void security_inode_post_setxattr (struct dentry *dentry, char *name,
 						 void *value, size_t size, int flags)
-{ }
+{ 
+	dentry = dentry;
+	name = name;
+	value = value;
+	size = size;
+	flags = flags;
+}
 
 static inline int security_inode_getxattr (struct dentry *dentry, char *name)
 {
+	dentry = dentry;
+	name = name;
 	return 0;
 }
 
 static inline int security_inode_listxattr (struct dentry *dentry)
 {
+	dentry = dentry;
 	return 0;
 }
 
@@ -2181,63 +2254,91 @@
 
 static inline int security_inode_getsecurity(struct dentry *dentry, const char *name, void *buffer, size_t size)
 {
+	dentry = dentry;
+	name = name;
+	buffer = buffer;
+	size = size;
 	return -EOPNOTSUPP;
 }
 
 static inline int security_inode_setsecurity(struct dentry *dentry, const char *name, const void *value, size_t size, int flags) 
 {
+	dentry = dentry;
+	name = name;
+	value = value;
+	size = size;
+	flags = flags;
 	return -EOPNOTSUPP;
 }
 
 static inline int security_inode_listsecurity(struct dentry *dentry, char *buffer)
 {
+	dentry = dentry;
+	buffer = buffer;
 	return 0;
 }
 
 static inline int security_file_permission (struct file *file, int mask)
 {
+	file = file;
+	mask = mask;
 	return 0;
 }
 
 static inline int security_file_alloc (struct file *file)
 {
+	file = file;
 	return 0;
 }
 
 static inline void security_file_free (struct file *file)
-{ }
+{ file = file; }
 
 static inline int security_file_ioctl (struct file *file, unsigned int cmd,
 				       unsigned long arg)
 {
+	file = file;
+	cmd = cmd;
+	arg = arg;
 	return 0;
 }
 
 static inline int security_file_mmap (struct file *file, unsigned long prot,
 				      unsigned long flags)
 {
+	file = file;
+	prot = prot;
+	flags = flags;
 	return 0;
 }
 
 static inline int security_file_mprotect (struct vm_area_struct *vma,
 					  unsigned long prot)
 {
+	vma = vma;
+	prot = prot;
 	return 0;
 }
 
 static inline int security_file_lock (struct file *file, unsigned int cmd)
 {
+	file = file;
+	cmd = cmd;
 	return 0;
 }
 
 static inline int security_file_fcntl (struct file *file, unsigned int cmd,
 				       unsigned long arg)
 {
+	file = file;
+	cmd = cmd;
+	arg = arg;
 	return 0;
 }
 
 static inline int security_file_set_fowner (struct file *file)
 {
+	file = file;
 	return 0;
 }
 
@@ -2245,30 +2346,41 @@
 						struct fown_struct *fown,
 						int fd, int reason)
 {
+	tsk = tsk;
+	fown = fown;
+	fd = fd;
+	reason = reason;
 	return 0;
 }
 
 static inline int security_file_receive (struct file *file)
 {
+	file = file;
 	return 0;
 }
 
 static inline int security_task_create (unsigned long clone_flags)
 {
+	clone_flags = clone_flags;
 	return 0;
 }
 
 static inline int security_task_alloc (struct task_struct *p)
 {
+	p = p;
 	return 0;
 }
 
 static inline void security_task_free (struct task_struct *p)
-{ }
+{ p = p; }
 
 static inline int security_task_setuid (uid_t id0, uid_t id1, uid_t id2,
 					int flags)
 {
+	id0 = id0;
+	id1 = id1;
+	id2 = id2;
+	flags = flags;
 	return 0;
 }
 
@@ -2281,37 +2393,51 @@
 static inline int security_task_setgid (gid_t id0, gid_t id1, gid_t id2,
 					int flags)
 {
+	id0 = id0;
+	id1 = id1;
+	id2 = id2;
+	flags = flags;
 	return 0;
 }
 
 static inline int security_task_setpgid (struct task_struct *p, pid_t pgid)
 {
+	p = p;
+	pgid = pgid;
 	return 0;
 }
 
 static inline int security_task_getpgid (struct task_struct *p)
 {
+	p = p;
 	return 0;
 }
 
 static inline int security_task_getsid (struct task_struct *p)
 {
+	p = p;
 	return 0;
 }
 
 static inline int security_task_setgroups (int gidsetsize, gid_t *grouplist)
 {
+	gidsetsize = gidsetsize;
+	grouplist = grouplist;
 	return 0;
 }
 
 static inline int security_task_setnice (struct task_struct *p, int nice)
 {
+	p = p;
+	nice = nice;
 	return 0;
 }
 
 static inline int security_task_setrlimit (unsigned int resource,
 					   struct rlimit *new_rlim)
 {
+	resource = resource;
+	new_rlim = new_rlim;
 	return 0;
 }
 
@@ -2319,22 +2445,30 @@
 					      int policy,
 					      struct sched_param *lp)
 {
+	p = p;
+	policy = policy;
+	lp = lp;
 	return 0;
 }
 
 static inline int security_task_getscheduler (struct task_struct *p)
 {
+	p = p;
 	return 0;
 }
 
 static inline int security_task_kill (struct task_struct *p,
 				      struct siginfo *info, int sig)
 {
+	p = p;
+	info = info;
+	sig = sig;
 	return 0;
 }
 
 static inline int security_task_wait (struct task_struct *p)
 {
+	p = p;
 	return 0;
 }
 
@@ -2343,6 +2477,11 @@
 				       unsigned long arg4,
 				       unsigned long arg5)
 {
+	option = option;
+	arg2 = arg2;
+	arg3 = arg3;
+	arg4 = arg4;
+	arg5 = arg5;
 	return 0;
 }
 
@@ -2352,44 +2491,55 @@
 }
 
 static inline void security_task_to_inode(struct task_struct *p, struct inode *inode)
-{ }
+{ p = p; inode = inode; }
 
 static inline int security_ipc_permission (struct kern_ipc_perm *ipcp,
 					   short flag)
 {
+	ipcp = ipcp;
+	flag = flag;
 	return 0;
 }
 
 static inline int security_msg_msg_alloc (struct msg_msg * msg)
 {
+	msg = msg;
 	return 0;
 }
 
 static inline void security_msg_msg_free (struct msg_msg * msg)
-{ }
+{ msg = msg; }
 
 static inline int security_msg_queue_alloc (struct msg_queue *msq)
 {
+	msq = msq;
 	return 0;
 }
 
 static inline void security_msg_queue_free (struct msg_queue *msq)
-{ }
+{ msq = msq; }
 
 static inline int security_msg_queue_associate (struct msg_queue * msq, 
 						int msqflg)
 {
+	msq = msq;
+	msqflg = msqflg;
 	return 0;
 }
 
 static inline int security_msg_queue_msgctl (struct msg_queue * msq, int cmd)
 {
+	msq = msq;
+	cmd = cmd;
 	return 0;
 }
 
 static inline int security_msg_queue_msgsnd (struct msg_queue * msq,
 					     struct msg_msg * msg, int msqflg)
 {
+	msq = msq;
+	msg = msg;
+	msqflg = msqflg;
 	return 0;
 }
 
@@ -2398,49 +2548,68 @@
 					     struct task_struct * target,
 					     long type, int mode)
 {
+	msq = msq;
+	msg = msg;
+	target = target;
+	type = type;
+	mode = mode;
 	return 0;
 }
 
 static inline int security_shm_alloc (struct shmid_kernel *shp)
 {
+	shp = shp;
 	return 0;
 }
 
 static inline void security_shm_free (struct shmid_kernel *shp)
-{ }
+{ shp = shp; }
+
 
 static inline int security_shm_associate (struct shmid_kernel * shp, 
 					  int shmflg)
 {
+	shp = shp;
+	shmflg = shmflg;
 	return 0;
 }
 
 static inline int security_shm_shmctl (struct shmid_kernel * shp, int cmd)
 {
+	shp = shp;
+	cmd = cmd;
 	return 0;
 }
 
 static inline int security_shm_shmat (struct shmid_kernel * shp, 
 				      char __user *shmaddr, int shmflg)
 {
+	shp = shp;
+	shmaddr = shmaddr;
+	shmflg = shmflg;
 	return 0;
 }
 
 static inline int security_sem_alloc (struct sem_array *sma)
 {
+	sma = sma;
 	return 0;
 }
 
 static inline void security_sem_free (struct sem_array *sma)
-{ }
+{ sma = sma; }
 
 static inline int security_sem_associate (struct sem_array * sma, int semflg)
 {
+	sma = sma;
+	semflg = semflg; 
 	return 0;
 }
 
 static inline int security_sem_semctl (struct sem_array * sma, int cmd)
 {
+	sma = sma;
+	cmd = cmd;
 	return 0;
 }
 
@@ -2448,19 +2617,31 @@
 				      struct sembuf * sops, unsigned nsops, 
 				      int alter)
 {
+	sma = sma;
+	sops = sops;
+	nsops = nsops;
+	alter = alter;
 	return 0;
 }
 
 static inline void security_d_instantiate (struct dentry *dentry, struct inode *inode)
-{ }
+{ dentry = dentry; inode = inode; }
 
 static inline int security_getprocattr(struct task_struct *p, char *name, void *value, size_t size)
 {
+	p = p;
+	name = name;
+	value = value;
+	size = size;
 	return -EINVAL;
 }
 
 static inline int security_setprocattr(struct task_struct *p, char *name, void *value, size_t size)
 {
+	p = p;
+	name = name;
+	value = value;
+	size = size;
 	return -EINVAL;
 }
 
@@ -2606,17 +2787,25 @@
 					       struct socket * other, 
 					       struct sock * newsk)
 {
+	sock = sock;
+	other = other;
+	newsk = newsk;
 	return 0;
 }
 
 static inline int security_unix_may_send(struct socket * sock, 
 					 struct socket * other)
 {
+	sock = sock;
+	other = other;
 	return 0;
 }
 
 static inline int security_socket_create (int family, int type, int protocol)
 {
+	family = family;
+	type = type;
+	protocol = protocol;
 	return 0;
 }
 
@@ -2625,12 +2814,19 @@
 					       int type, 
 					       int protocol)
 {
+	sock = sock;
+	family = family;
+	type = type;
+	protocol = protocol;
 }
 
 static inline int security_socket_bind(struct socket * sock, 
 				       struct sockaddr * address, 
 				       int addrlen)
 {
+	sock = sock;
+	address = address;
+	addrlen = addrlen;
 	return 0;
 }
 
@@ -2638,28 +2834,40 @@
 					  struct sockaddr * address, 
 					  int addrlen)
 {
+	sock = sock;
+	address = address;
+	addrlen = addrlen;
 	return 0;
 }
 
 static inline int security_socket_listen(struct socket * sock, int backlog)
 {
+	sock = sock;
+	backlog = backlog;
 	return 0;
 }
 
 static inline int security_socket_accept(struct socket * sock, 
 					 struct socket * newsock)
 {
+	sock = sock;
+	newsock = newsock;
 	return 0;
 }
 
 static inline void security_socket_post_accept(struct socket * sock, 
 					       struct socket * newsock)
 {
+	sock = sock;
+	newsock = newsock;
 }
 
 static inline int security_socket_sendmsg(struct socket * sock, 
 					  struct msghdr * msg, int size)
 {
+	sock = sock;
+	msg = msg;
+	size = size;
 	return 0;
 }
 
@@ -2667,54 +2875,78 @@
 					  struct msghdr * msg, int size, 
 					  int flags)
 {
+	sock = sock;
+	msg = msg;
+	size = size;
+	flags = flags;
 	return 0;
 }
 
 static inline int security_socket_getsockname(struct socket * sock)
 {
+	sock = sock;
 	return 0;
 }
 
 static inline int security_socket_getpeername(struct socket * sock)
 {
+	sock = sock;
 	return 0;
 }
 
 static inline int security_socket_getsockopt(struct socket * sock, 
 					     int level, int optname)
 {
+	sock = sock;
+	level = level;
+	optname = optname;
 	return 0;
 }
 
 static inline int security_socket_setsockopt(struct socket * sock, 
 					     int level, int optname)
 {
+	sock = sock;
+	level = level;
+	optname = optname;
 	return 0;
 }
 
 static inline int security_socket_shutdown(struct socket * sock, int how)
 {
+	sock = sock;
+	how = how;
 	return 0;
 }
 static inline int security_sock_rcv_skb (struct sock * sk, 
 					 struct sk_buff * skb)
 {
+	sk = sk;
+	skb = skb;
 	return 0;
 }
 
 static inline int security_socket_getpeersec(struct socket *sock, char __user *optval,
 					     int __user *optlen, unsigned len)
 {
+	sock = sock;
+	optval = optval;
+	optlen = optlen;
+	len = len;
 	return -ENOPROTOOPT;
 }
 
 static inline int security_sk_alloc(struct sock *sk, int family, int priority)
 {
+	sk = sk;
+	family = family;
+	priority = priority;
 	return 0;
 }
 
 static inline void security_sk_free(struct sock *sk)
 {
+	sk = sk;
 }
 #endif	/* CONFIG_SECURITY_NETWORK */
 

--Boundary-00=_3lDLA7+UfDoYCb4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_3lDLA7+UfDoYCb4--
