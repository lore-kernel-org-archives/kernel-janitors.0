From: Felix Blyakher <felixb@sgi.com>
Date: Thu, 05 Mar 2009 17:43:20 +0000
Subject: Re: [PATCH 0/3] xfs: fix sparse warnings
Message-Id: <4BC7466E-89A4-44E3-8189-C5531F994D73@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090304183136.525.13769.stgit@f10box.hanneseder.net>
In-Reply-To: <20090304183136.525.13769.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>


On Mar 4, 2009, at 12:33 PM, Hannes Eder wrote:

> The following series fixes a fair amount of the remaining sparse
> warnings in fs/xfs with !CONFIG_XFS_DEBUG.
>
> With CONFIG_XFS_DEBUG we still got alot of "Should it be static?"
> warnings, but that's a different issue.

Looks good to me with the changes Christoph pointed out.
I'll push it in. Thanks.

Reviewed-by: Felix Blyakher <felixb@sgi.com>

>
>
> ---
> Hannes Eder (3):
>      xfs: include header files for prototypes
>      xfs: make symbols static
>      xfs: move declaration to header file
>
> fs/xfs/linux-2.6/xfs_ioctl.c |    1 +
> fs/xfs/linux-2.6/xfs_super.c |    6 +++---
> fs/xfs/support/debug.c       |    1 +
> fs/xfs/xfs_bmap.c            |    2 +-
> fs/xfs/xfs_da_btree.h        |    1 +
> fs/xfs/xfs_dir2.c            |    2 --
> fs/xfs/xfs_dir2_leaf.c       |    2 +-
> 7 files changed, 8 insertions(+), 7 deletions(-)

