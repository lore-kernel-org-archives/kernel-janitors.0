From: Christoph Hellwig <hch@lst.de>
Date: Wed, 12 Jul 2017 07:30:07 +0000
Subject: Re: [PATCH] dm bufio: Fix error code in dm_bufio_write_dirty_buffers()
Message-Id: <20170712073007.GA6260@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170712072634.qtm4tq7xlnp572hs@mwanda>
In-Reply-To: <20170712072634.qtm4tq7xlnp572hs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alasdair Kergon <agk@redhat.com>, Christoph Hellwig <hch@lst.de>, Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com, Shaohua Li <shli@kernel.org>, linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jul 12, 2017 at 10:26:34AM +0300, Dan Carpenter wrote:
> We should be returning normal negative error codes here.  The "a"
> variables comes from &c->async_write_error which is a blk_status_t
> converted to a regular error code.
> 
> In the current code, the blk_status_t gets propogated back to
> pool_create() and eventually results in an Oops.

And sparse correctly warns about this, so no idea how this slipped in..

> 
> Fixes: 4e4cbee93d56 ("block: switch bios to blk_status_t")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Christoph Hellwig <hch@lst.de>
