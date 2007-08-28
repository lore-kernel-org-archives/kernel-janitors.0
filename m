From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Tue, 28 Aug 2007 07:54:25 +0000
Subject: Re: fs: use DIV_ROUND_UP where possible
Message-Id: <Pine.LNX.4.64.0708280353230.20351@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070827233412.7edda681@shaun>
In-Reply-To: <20070827233412.7edda681@shaun>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 27 Aug 2007, Shaun Zinck wrote:

> Convert code and definitions that look similar to DIV_ROUND_UP (defined in
> kernel.h), to use DIV_ROUND_UP instead of redefining or recoding it.
>
> Signed-off-by: Shaun Zinck <shaun.zinck@gmail.com>
> ---
>  fs/block_dev.c               |    2 +-
>  fs/direct-io.c               |    7 +++----
>  fs/jfs/jfs_dtree.h           |    4 ++--
>  fs/jfs/resize.c              |    2 +-
>  fs/nfs/nfs4renewd.c          |    4 ++--
>  fs/ocfs2/cluster/heartbeat.c |    2 +-
>  fs/ocfs2/dlm/dlmcommon.h     |    2 +-
>  fs/xfs/linux-2.6/xfs_linux.h |    1 -
>  fs/xfs/xfs_alloc.c           |    4 ++--
>  fs/xfs/xfs_bmap.c            |    4 ++--
>  fs/xfs/xfs_dir2_leaf.c       |    4 ++--
>  fs/xfs/xfs_ialloc.c          |    4 ++--
>  12 files changed, 19 insertions(+), 21 deletions(-)

you might have been better off doing this in chunks and CC'ing the
appropriate subsystem maintainers on each chunk.  there's a better
chance of stuff getting accepted that way.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
