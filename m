From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 28 Aug 2007 14:32:30 +0000
Subject: Re: fs: use DIV_ROUND_UP where possible
Message-Id: <Pine.LNX.4.64.0708281028410.11545@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070827233412.7edda681@shaun>
In-Reply-To: <20070827233412.7edda681@shaun>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 28 Aug 2007, Shaun Zinck wrote:

> On Tue, 28 Aug 2007 03:54:25 -0400 (EDT)
> "Robert P. J. Day" <rpjday@mindspring.com> wrote:
>
> > On Mon, 27 Aug 2007, Shaun Zinck wrote:
> >
> > > Convert code and definitions that look similar to DIV_ROUND_UP
> > > (defined in kernel.h), to use DIV_ROUND_UP instead of redefining or
> > > recoding it.
> > >
> > > Signed-off-by: Shaun Zinck <shaun.zinck@gmail.com>
> > > ---
> > >  fs/block_dev.c               |    2 +-
> > >  fs/direct-io.c               |    7 +++----
> > >  fs/jfs/jfs_dtree.h           |    4 ++--
> > >  fs/jfs/resize.c              |    2 +-
> > >  fs/nfs/nfs4renewd.c          |    4 ++--
> > >  fs/ocfs2/cluster/heartbeat.c |    2 +-
> > >  fs/ocfs2/dlm/dlmcommon.h     |    2 +-
> > >  fs/xfs/linux-2.6/xfs_linux.h |    1 -
> > >  fs/xfs/xfs_alloc.c           |    4 ++--
> > >  fs/xfs/xfs_bmap.c            |    4 ++--
> > >  fs/xfs/xfs_dir2_leaf.c       |    4 ++--
> > >  fs/xfs/xfs_ialloc.c          |    4 ++--
> > >  12 files changed, 19 insertions(+), 21 deletions(-)
> >
> > you might have been better off doing this in chunks and CC'ing the
> > appropriate subsystem maintainers on each chunk.  there's a better
> > chance of stuff getting accepted that way.
>
> I only did the fs/* stuff. There are many more occurrences, but
> apparently even fs/* is not fine-grained enough. I can break them up
> further.

that's generally a good idea when it comes to the fs/ stuff, since
there's a huge amount of content there.  check the MAINTAINERS file to
see how fine-grained it gets.

> I would break it up into the following separate patches:
>
> 1) fs/block_dev.c
> 2) fs/direct_io.c
> 3) fs/jfs/*
> 4) fs/nfs/*
> 5) fs/ocfs2/*
> 6) fs/xfs/*
>
> I would send these as separate patches instead of as a series, since
> they are independent from each other.
>
> How's that sound?

you can probably submit 1) and 2) as a single patch, since it seems
fairly generic, and there is a general filesystems maintainer that you
can CC on that one:

  FILESYSTEMS (VFS and infrastructure)
  P:      Alexander Viro
  M:      viro@zeniv.linux.org.uk
  S:      Maintained

as for the rest, yes, you should probably do those separately.  you're
far more likely to get a quick reply and have the patch accepted that
way.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
