From: Jens Axboe <axboe@fb.com>
Date: Wed, 14 May 2014 14:07:28 +0000
Subject: Re: [patch] mtip32xx: blk_mq_init_queue() returns an ERR_PTR
Message-Id: <537378A0.9060204@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140514125418.GA14571@mwanda>
In-Reply-To: <20140514125418.GA14571@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Asai Thambi S P <asamymuthupa@micron.com>, Sam Bradshaw <sbradshaw@micron.com>, Kent Overstreet <kmo@daterainc.com>, Alexander Gordeev <agordeev@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2014-05-14 06:54, Dan Carpenter wrote:
> We changed this from blk_alloc_queue_node() to blk_mq_init_queue() so
> the check needs to be updated as well.
>
> Fixes: ee5036035df1 ('mtip32xx: convert to use blk-mq')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan, applied.

-- 
Jens Axboe

