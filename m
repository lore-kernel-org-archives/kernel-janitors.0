From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Sep 2012 23:26:36 +0000
Subject: [cr:crtools-3.6-rc5 8/34] ipc/compat.c:399:13: error: 'compat_do_msg_fill' undeclared
Message-Id: <20120919232636.GA5607@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Stanislav,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gorcunov/linux-cr.git crtools-3.6-rc5
head:   0f5ec8960cb3fa3f7d5bf30be7cccd30bfad507a
commit: b3d0fbd8ecdbe74dfee640ec3a06706ad1278a90 [8/34] IPC: message queue receive cleanup
config: tile-tilegx_defconfig

All related error/warning messages:

ipc/compat.c: In function 'compat_sys_msgrcv':
ipc/compat.c:399:13: error: 'compat_do_msg_fill' undeclared (first use in this function)
ipc/compat.c:399:13: note: each undeclared identifier is reported only once for each function it appears in
ipc/compat.c:399:5: warning: passing argument 3 of 'do_msgrcv' makes integer from pointer without a cast [enabled by default]
include/linux/msg.h:108:13: note: expected 'size_t' but argument is of type 'char *'
ipc/compat.c:399:5: warning: passing argument 6 of 'do_msgrcv' makes pointer from integer without a cast [enabled by default]
include/linux/msg.h:108:13: note: expected 'long int (*)(void *, struct msg_msg *, size_t)' but argument is of type 'int'
ipc/compat.c:399:5: error: too many arguments to function 'do_msgrcv'
include/linux/msg.h:108:13: note: declared here

vim +399 ipc/compat.c
   394			       compat_ssize_t msgsz, long msgtyp, int msgflg)
   395	{
   396		long err, mtype;
   397	
   398		err =  do_msgrcv(msqid, &mtype, msgp->mtext, (ssize_t)msgsz, msgtyp,
 > 399				 msgflg, compat_do_msg_fill);
   400		if (err < 0)
   401			goto out;
   402	
   403		if (put_user(mtype, &msgp->mtype))
   404			err = -EFAULT;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
