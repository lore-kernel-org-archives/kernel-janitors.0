From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 23 Aug 2017 14:37:02 +0000
Subject: Re: [PATCH] skd: error pointer dereference in skd_cons_disk()
Message-Id: <2e42aaf6-2b6a-5dd7-23a8-a6301b829ae6@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170823065122.pqju3ks5rxpymllz@mwanda>
In-Reply-To: <20170823065122.pqju3ks5rxpymllz@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Bart Van Assche <bart.vanassche@wdc.com>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/23/2017 05:20 AM, Dan Carpenter wrote:
> My initial impulse was to check for IS_ERR_OR_NULL() but when I looked
> at this code a bit more closely, we should only need to check for
> IS_ERR().
> 
> The blk_mq_alloc_tag_set() returns negative error codes and zero on
> success so we can just do an "if (rc) goto err_out;".  It's better to
> preserve the error code anyhow.  The blk_mq_init_queue() returns error
> pointers on failure, it never returns NULL.  We can also remove the
> "q = NULL;" at the start because that's no longer needed.

Applied, thanks Dan.

-- 
Jens Axboe

