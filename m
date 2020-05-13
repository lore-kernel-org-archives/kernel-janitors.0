From: "Darrick J. Wong" <darrick.wong@oracle.com>
Date: Wed, 13 May 2020 15:17:54 +0000
Subject: Re: [PATCH] xfs: fix error code in xfs_iflush_cluster()
Message-Id: <20200513151754.GC1984748@magnolia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200513094803.GF347693@mwanda>
 <20200513132904.GE44225@bfoster>
 <20200513133905.GB3041@kadam>
In-Reply-To: <20200513133905.GB3041@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brian Foster <bfoster@redhat.com>, linux-xfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 13, 2020 at 04:39:05PM +0300, Dan Carpenter wrote:
> Oh yeah.  You're right.  This patch isn't correct.  Sorry about that.
> 
> I worry that there are several static analyzer's which will warn about
> this code...

/me wonders if this particular instance ought to have a breadcrumb to
remind future readers that we can handle the lack of memory, e.g.

cilist = kmem_alloc(..., KM_MAYFAIL...);
if (!cilist) {
	/* memory is tight, so defer the inode cluster flush */
	goto out_put;
}

--D

> regards,
> dan carpenter
> 
