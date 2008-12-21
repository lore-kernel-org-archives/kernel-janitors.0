From: Julia Lawall <julia@diku.dk>
Date: Sun, 21 Dec 2008 16:36:33 +0000
Subject: Re: [PATCH 9/13] fs/xfs: Remove redundant test
Message-Id: <Pine.LNX.4.64.0812211736150.9555@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812211640360.9555@pc-004.diku.dk>
	<494E6846.8070800@sandeen.net>
In-Reply-To: <494E6846.8070800@sandeen.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Sandeen <sandeen@sandeen.net>
Cc: xfs-masters@oss.sgi.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com

> Looks fine to me, though a similar test under the #ifdef DEBUG can
> probably also be removed.

Indeed.  I will send an updated patch.

julia

> -Eric
> 
> > ---
> >  fs/xfs/xfs_trans_buf.c              |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_trans_buf.c b/fs/xfs/xfs_trans_buf.c
> > index 8ee2f8c..22afe29 100644
> > --- a/fs/xfs/xfs_trans_buf.c
> > +++ b/fs/xfs/xfs_trans_buf.c
> > @@ -307,7 +307,7 @@ xfs_trans_read_buf(
> >  			return (flags & XFS_BUF_TRYLOCK) ?
> >  					EAGAIN : XFS_ERROR(ENOMEM);
> >  
> > -		if ((bp != NULL) && (XFS_BUF_GETERROR(bp) != 0)) {
> > +		if (XFS_BUF_GETERROR(bp) != 0) {
> >  			xfs_ioerror_alert("xfs_trans_read_buf", mp,
> >  					  bp, blkno);
> >  			error = XFS_BUF_GETERROR(bp);
> > 
> > _______________________________________________
> > xfs mailing list
> > xfs@oss.sgi.com
> > http://oss.sgi.com/mailman/listinfo/xfs
> > 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
