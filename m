From: Dave Chinner <david@fromorbit.com>
Date: Wed, 13 May 2020 21:09:16 +0000
Subject: Re: [PATCH] xfs: fix error code in xfs_iflush_cluster()
Message-Id: <20200513210916.GF2040@dread.disaster.area>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200513094803.GF347693@mwanda>
 <20200513132904.GE44225@bfoster>
 <20200513133905.GB3041@kadam>
 <20200513151754.GC1984748@magnolia>
In-Reply-To: <20200513151754.GC1984748@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Brian Foster <bfoster@redhat.com>, linux-xfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 13, 2020 at 08:17:54AM -0700, Darrick J. Wong wrote:
> On Wed, May 13, 2020 at 04:39:05PM +0300, Dan Carpenter wrote:
> > Oh yeah.  You're right.  This patch isn't correct.  Sorry about that.
> > 
> > I worry that there are several static analyzer's which will warn about
> > this code...
> 
> /me wonders if this particular instance ought to have a breadcrumb to
> remind future readers that we can handle the lack of memory, e.g.
> 
> cilist = kmem_alloc(..., KM_MAYFAIL...);
> if (!cilist) {
> 	/* memory is tight, so defer the inode cluster flush */
> 	goto out_put;
> }

I'm working on patches that make this memory allocation go away
altogether, so I'd suggest just ignoring it for now.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
