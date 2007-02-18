From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 18 Feb 2007 12:04:34 +0000
Subject: [KJ] discouraging the introduction of unnecessary typedefs
Message-Id: <Pine.LNX.4.64.0702180700400.4148@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  Chapter 5 of the CodingStyle doc is fairly unambiguous in
recommending against introducing new typedefs, but it appears some
people can't help themselves:

$ grep -rw mutex_t *
fs/xfs/support/uuid.c:static mutex_t    uuid_monitor;
fs/xfs/xfs_mount.h:     mutex_t                 m_ilock;        /* inode list mutex */
fs/xfs/quota/xfs_qm.h:extern mutex_t            xfs_Gqm_lock;
fs/xfs/quota/xfs_qm.h:       mutex_t             qh_lock;
fs/xfs/quota/xfs_qm.h:  mutex_t          qi_quotaofflock;/* to serialize quotaoff */
fs/xfs/quota/xfs_qm.c:mutex_t           xfs_Gqm_lock;
fs/xfs/quota/xfs_qm.c:extern mutex_t    qcheck_lock;
fs/xfs/quota/xfs_qm_syscalls.c:mutex_t        qcheck_lock;
fs/xfs/quota/xfs_dquot.h:       mutex_t           qh_lock;
fs/xfs/quota/xfs_dquot.h:       mutex_t          q_qlock;       /* quota lock */
fs/xfs/linux-2.6/mutex.h:typedef struct mutex mutex_t;

  not a big deal, of course, but if the recommended coding style is
that opposed to adding typedefs, perhaps this sort of thing should be
nipped in the bud before it gets any more widespread.

  any thoughts on this?

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
