From: Shaun Zinck <shaun.zinck@gmail.com>
Date: Tue, 28 Aug 2007 14:37:31 +0000
Subject: Re: fs: use DIV_ROUND_UP where possible
Message-Id: <20070828093731.54a2ce34@shaun>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070827233412.7edda681@shaun>
In-Reply-To: <20070827233412.7edda681@shaun>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 28 Aug 2007 03:54:25 -0400 (EDT)
"Robert P. J. Day" <rpjday@mindspring.com> wrote:

> On Mon, 27 Aug 2007, Shaun Zinck wrote:
> 
> > Convert code and definitions that look similar to DIV_ROUND_UP
> > (defined in kernel.h), to use DIV_ROUND_UP instead of redefining or
> > recoding it.
> >
> > Signed-off-by: Shaun Zinck <shaun.zinck@gmail.com>
> > ---
> >  fs/block_dev.c               |    2 +-
> >  fs/direct-io.c               |    7 +++----
> >  fs/jfs/jfs_dtree.h           |    4 ++--
> >  fs/jfs/resize.c              |    2 +-
> >  fs/nfs/nfs4renewd.c          |    4 ++--
> >  fs/ocfs2/cluster/heartbeat.c |    2 +-
> >  fs/ocfs2/dlm/dlmcommon.h     |    2 +-
> >  fs/xfs/linux-2.6/xfs_linux.h |    1 -
> >  fs/xfs/xfs_alloc.c           |    4 ++--
> >  fs/xfs/xfs_bmap.c            |    4 ++--
> >  fs/xfs/xfs_dir2_leaf.c       |    4 ++--
> >  fs/xfs/xfs_ialloc.c          |    4 ++--
> >  12 files changed, 19 insertions(+), 21 deletions(-)
> 
> you might have been better off doing this in chunks and CC'ing the
> appropriate subsystem maintainers on each chunk.  there's a better
> chance of stuff getting accepted that way.

I only did the fs/* stuff. There are many more occurrences, but
apparently even fs/* is not fine-grained enough. I can break them up
further. I'm new to this so I do appreciate the advice. I would break it
up into the following separate patches:

1) fs/block_dev.c
2) fs/direct_io.c
3) fs/jfs/*
4) fs/nfs/*
5) fs/ocfs2/*
6) fs/xfs/*

I would send these as separate patches instead of as a series, since
they are independent from each other. 

How's that sound?

-Shaun
