From: Christoph Hellwig <hch@infradead.org>
Date: Wed, 01 Feb 2012 21:15:40 +0000
Subject: Re: [patch] xfs: remove an unneeded NULL check
Message-Id: <20120201211540.GA3619@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120128105501.GB25092@elgon.mountain>
	<20120131225601.GQ9090@dastard>
	<20120201104500.GA13672@infradead.org>
	<20120201211326.GU9090@dastard>
In-Reply-To: <20120201211326.GU9090@dastard>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Chinner <david@fromorbit.com>
Cc: Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, xfs@oss.sgi.com, Christoph Hellwig <hch@infradead.org>, xfs-masters@oss.sgi.com, Ben Myers <bpm@sgi.com>, Dan Carpenter <dan.carpenter@oracle.com>

On Thu, Feb 02, 2012 at 08:13:26AM +1100, Dave Chinner wrote:
> > > There's a set of reviewed patches (for 3.3) that change all this
> > > code. The null check might still be there, but that needs to be
> > > checked.
> > 
> > Which series is that?  I mut have to admit I've lost track by now.
> 
> The removal of all the old log code.

That stuff actually still went into 3.3-rc1.

