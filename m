From: Christoph Hellwig <hch@infradead.org>
Date: Thu, 22 May 2014 10:01:34 +0000
Subject: Re: [patch] [XFS] indent an if statement
Message-Id: <20140522100134.GA23071@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140521122746.GD23396@mwanda>
	<20140521142909.GA22281@infradead.org>
	<20140521143550.GC15585@mwanda> <537CD96D.2090901@bfs.de>
In-Reply-To: <537CD96D.2090901@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Christoph Hellwig <hch@infradead.org>, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, xfs@oss.sgi.com

On Wed, May 21, 2014 at 06:50:53PM +0200, walter harms wrote:
> This looks like a ffsll() maybe there are other implemantions and we can
> make a generic version (acualy i found only a ffsll() in nouvou, NTL).

All the helper in xfs_bit.[ch] are probably candidates for generic
library functions.

