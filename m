From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 19 Sep 2012 12:20:55 +0000
Subject: [cr:crtools-3.6-rc5 6/32] arch/tile/kernel/compat.c:116:2: error: implicit declaration of function '
Message-Id: <20120919122055.GA15519@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Stanislav,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gorcunov/linux-cr.git crtools-3.6-rc5
head:   36cd0264fd0ce1a3491a59e61c80a990a3107859
commit: 625fbb93c8cf6dc3b431abb698ad26f7de51b0e3 [6/32] IPC: message queue receive cleanup
config: tile-tilegx_defconfig

All related error/warning messages:

arch/tile/kernel/compat.c: In function 'tile_compat_sys_msgsnd':
arch/tile/kernel/compat.c:116:2: error: implicit declaration of function 'do_msgsnd' [-Werror=implicit-function-declaration]
arch/tile/kernel/compat.c: In function 'tile_compat_sys_msgrcv':
arch/tile/kernel/compat.c:123:2: error: implicit declaration of function 'do_msgrcv' [-Werror=implicit-function-declaration]
arch/tile/kernel/compat.c:123:55: error: 'compat_do_msg_fill' undeclared (first use in this function)
arch/tile/kernel/compat.c:123:55: note: each undeclared identifier is reported only once for each function it appears in
arch/tile/kernel/compat.c:124:1: warning: control reaches end of non-void function [-Wreturn-type]
cc1: some warnings being treated as errors

--
ipc/compat.c: In function 'compat_sys_msgrcv':
ipc/compat.c:398:2: warning: passing argument 3 of 'do_msgrcv' makes integer from pointer without a cast [enabled by default]
include/linux/msg.h:108:13: note: expected 'size_t' but argument is of type 'char *'
ipc/compat.c:398:2: warning: passing argument 6 of 'do_msgrcv' makes pointer from integer without a cast [enabled by default]
include/linux/msg.h:108:13: note: expected 'long int (*)(void *, struct msg_msg *, size_t)' but argument is of type 'int'
--
ipc/msg.c: In function 'msgctl_down':
ipc/msg.c:429:30: warning: the omitted middle operand in ?: will always be 'true', suggest explicit middle operand [-Wparentheses]

vim +116 arch/tile/kernel/compat.c
   111	{
   112		compat_long_t mtype;
   113	
   114		if (get_user(mtype, &msgp->mtype))
   115			return -EFAULT;
 > 116		return do_msgsnd(msqid, mtype, msgp->mtext, msgsz, msgflg);
   117	}
   118	
   119	long tile_compat_sys_msgrcv(int msqid,
   120				    struct compat_msgbuf __user *msgp,
   121				    size_t msgsz, long msgtyp, int msgflg)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
