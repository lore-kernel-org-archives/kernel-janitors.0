From: Ben Myers <bpm@sgi.com>
Date: Thu, 15 Aug 2013 14:37:06 +0000
Subject: Re: [patch] xfs: check for underflow in xfs_iformat_fork()
Message-Id: <20130815143706.GI7153@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130815055338.GC23580@elgon.mountain>
	<520CA923.4060409@oracle.com>
In-Reply-To: <520CA923.4060409@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jeff Liu <jeff.liu@oracle.com>
Cc: Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com

Hey Dan & Jeff,

On Thu, Aug 15, 2013 at 06:10:43PM +0800, Jeff Liu wrote:
> On 08/15/2013 01:53 PM, Dan Carpenter wrote:
> 
> > The "di_size" variable comes from the disk and it's a signed 64 bit.
> > We check the upper limit but we should check for negative numbers as
> > well.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/fs/xfs/xfs_inode_fork.c b/fs/xfs/xfs_inode_fork.c
> > index 123971b..849fc70 100644
> > --- a/fs/xfs/xfs_inode_fork.c
> > +++ b/fs/xfs/xfs_inode_fork.c
> > @@ -167,7 +167,8 @@ xfs_iformat_fork(
> >  			}
> >  
> >  			di_size = be64_to_cpu(dip->di_size);
> > -			if (unlikely(di_size > XFS_DFORK_DSIZE(dip, ip->i_mount))) {
> > +			if (unlikely(di_size < 0 ||
> 
> But the di_size is initialized to ZERO while allocating a new inode on disk.
> I wonder if that is better to ASSERT in this case because the current check
> is used to make sure that the item is inlined, or we don't need it at all.

Hmm.  Dan's additional check looks good to me.  In this case I'd say the forced
shutdown is more appropriate than an assert, because here we're reading the
inode from disk, as opposed to looking at a structure that is already incore
which we think we've initialized.  We want to handle unexpected inputs from
disk without crashing even if we are CONFIG_XFS_DEBUG.

How did you come across this one?

Reviewed-by: Ben Myers <bpm@sgi.com>

Regards,
Ben
