From: "Nish Aravamudan" <nish.aravamudan@gmail.com>
Date: Sun, 18 Feb 2007 18:11:54 +0000
Subject: Re: [KJ] discouraging the introduction of unnecessary typedefs
Message-Id: <29495f1d0702181011i262ed557g57887574c3d373ee@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702180700400.4148@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702180700400.4148@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/18/07, Randy Dunlap <rdunlap@xenotime.net> wrote:
> On Sun, 18 Feb 2007 07:49:46 -0500 (EST) Robert P. J. Day wrote:
>
> > On Sun, 18 Feb 2007, Robert P. J. Day wrote:
> >
> > >
> > >   Chapter 5 of the CodingStyle doc is fairly unambiguous in
> > > recommending against introducing new typedefs, but it appears some
> > > people can't help themselves:
> > >
> > > $ grep -rw mutex_t *
> > > fs/xfs/support/uuid.c:static mutex_t    uuid_monitor;
> > > fs/xfs/xfs_mount.h:     mutex_t                 m_ilock;        /* inode list mutex */
> > > fs/xfs/quota/xfs_qm.h:extern mutex_t            xfs_Gqm_lock;
> > > fs/xfs/quota/xfs_qm.h:       mutex_t             qh_lock;
> > > fs/xfs/quota/xfs_qm.h:  mutex_t          qi_quotaofflock;/* to serialize quotaoff */
> > > fs/xfs/quota/xfs_qm.c:mutex_t           xfs_Gqm_lock;
> > > fs/xfs/quota/xfs_qm.c:extern mutex_t    qcheck_lock;
> > > fs/xfs/quota/xfs_qm_syscalls.c:mutex_t        qcheck_lock;
> > > fs/xfs/quota/xfs_dquot.h:       mutex_t           qh_lock;
> > > fs/xfs/quota/xfs_dquot.h:       mutex_t          q_qlock;       /* quota lock */
> > > fs/xfs/linux-2.6/mutex.h:typedef struct mutex mutex_t;
> > >
> > >   not a big deal, of course, but if the recommended coding style is
> > > that opposed to adding typedefs, perhaps this sort of thing should be
> > > nipped in the bud before it gets any more widespread.
> >
> >   actually, i just took a closer look and the XFS code is particularly
> > bad about introducing new typedefs just for programmer convenience.
> > the directory fs/xfs/linux-2.6 contains the header files mrlock.h,
> > mutex.h, sema.h and spin.h (among others) that introduce these
> > typedefs.
> >
> >   apparently, the XFS people have never read the CodingStyle doc.  :-)
>
> It could be that.  Or it could be that they use the same code on
> multiple OSes and have a need to keep it the same on those various
> systems.  They do indeed use the XFS code in more than one place,
> so it could just be a portability issue.
> (not that that is a high priority for Linux code or style)

They also tend to be slightly resistant to patches that change this
(perhaps with good reason), IME. XFS is a corner-case for the kernel,
maintenance wise, I would probably leave it alone (like OSS, for a
different reason).

Thanks,
Nish
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
