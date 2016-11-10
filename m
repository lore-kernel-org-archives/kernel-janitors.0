From: Christoph Hellwig <hch@lst.de>
Date: Thu, 10 Nov 2016 20:07:17 +0000
Subject: Re: [patch] block: precedence bug in bio_set_op_attrs() macro
Message-Id: <20161110200717.GA21893@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161110200438.GA22854@mwanda>
In-Reply-To: <20161110200438.GA22854@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jens Axboe <axboe@fb.com>, Christoph Hellwig <hch@lst.de>, Mike Christie <mchristi@redhat.com>, Shaun Tancheff <shaun.tancheff@seagate.com>, Hannes Reinecke <hare@suse.com>, Johannes Thumshirn <jthumshirn@suse.de>, Bart Van Assche <bart.vanassche@sandisk.com>, Ming Lei <ming.lei@canonical.com>, linux-block@vger.kernel.org, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Nov 10, 2016 at 11:04:38PM +0300, Dan Carpenter wrote:
> This code causes a problem for flush_epd_write_bio() because | has
> higher precedence than ?: so it basically turns into:
> 
> 	((bio)->bi_opf |= REQ_SYNC;
> 
> Which is wrong.

Its is.  And while we're at it the macro should really be doing a
= instead of |=.

And we really should stop using it, at least in the block core even
ASAP.
