From: Christoph Hellwig <hch@lst.de>
Date: Tue, 20 Jun 2017 09:11:02 +0000
Subject: Re: [PATCH] btrfs: use new block error code
Message-Id: <20170620091102.GB10272@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170619105536.GA24075@elgon.mountain>
In-Reply-To: <20170619105536.GA24075@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Christoph Hellwig <hch@lst.de>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, linux-block@vger.kernel.org, Jens Axboe <axboe@fb.com>, kernel-janitors@vger.kernel.org

On Mon, Jun 19, 2017 at 01:55:37PM +0300, Dan Carpenter wrote:
> This function is supposed to return blk_status_t error codes now but
> there was a stray -ENOMEM left behind.
> 
> Fixes: 4e4cbee93d56 ("block: switch bios to blk_status_t")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks fine,

Acked-by: Christoph Hellwig <hch@lst.de>
