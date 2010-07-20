From: Alex Elder <aelder@sgi.com>
Date: Tue, 20 Jul 2010 19:35:33 +0000
Subject: Re: [PATCH 6/8] xfs: fix unsigned underflow
Message-Id: <1279654533.1859.242.camel@doink>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279219605-12631-1-git-send-email-segooon@gmail.com>
	<20100715212116.GA7013@infradead.org>
In-Reply-To: <20100715212116.GA7013@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: Christoph Hellwig <hch@infradead.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, xfs@oss.sgi.com

On Thu, 2010-07-15 at 17:21 -0400, Christoph Hellwig wrote:
> On Thu, Jul 15, 2010 at 10:46:45PM +0400, Kulikov Vasiliy wrote:
> > map_len is unsigned. Checking map_len <= 0 is buggy when it should be
> > below zero. So, check exact expression instead of map_len.
> > 
> > Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> 
> Looks good,
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 

Looks good to me too.  Do you want me to pull this
in via the XFS tree, or do you have other plans?

					-Alex

