From: Mark Tinguely <tinguely@sgi.com>
Date: Thu, 22 May 2014 13:31:46 +0000
Subject: Re: [patch] [XFS] indent an if statement
Message-Id: <537DFC42.8080100@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140521122746.GD23396@mwanda>
	<20140521142909.GA22281@infradead.org>
	<20140521143550.GC15585@mwanda> <537CD96D.2090901@bfs.de>
	<20140522100134.GA23071@infradead.org>
In-Reply-To: <20140522100134.GA23071@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@infradead.org>
Cc: xfs@oss.sgi.com, kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, walter harms <wharms@bfs.de>

On 05/22/14 05:01, Christoph Hellwig wrote:
> On Wed, May 21, 2014 at 06:50:53PM +0200, walter harms wrote:
>> This looks like a ffsll() maybe there are other implemantions and we can
>> make a generic version (acualy i found only a ffsll() in nouvou, NTL).
>
> All the helper in xfs_bit.[ch] are probably candidates for generic
> library functions.


Discussed in the thread:

  http://oss.sgi.com/archives/xfs/2014-01/msg00542.html

--Mark.
