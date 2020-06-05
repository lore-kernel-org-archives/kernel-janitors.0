From: Jan Kara <jack@suse.cz>
Date: Fri, 05 Jun 2020 14:42:36 +0000
Subject: Re: [PATCH v2] block: Fix use-after-free in blkdev_get()
Message-Id: <20200605144236.GB13248@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88676ff2-cb7e-70ec-4421-ecf8318990b1@web.de>
 <5fa658bf-3028-9b5c-30cc-dbdef6bf8f7a@huawei.com>
 <20200605094353.GS30374@kadam>
In-Reply-To: <20200605094353.GS30374@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jason Yan <yanaijie@huawei.com>, Jan Kara <jack@suse.cz>, Markus Elfring <Markus.Elfring@web.de>, linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, hulkci@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>

On Fri 05-06-20 12:43:54, Dan Carpenter wrote:
> I wonder if maybe the best fix is to re-add the "if (!res) " check back
> to blkdev_get().

Well, it won't be that simple since we need to call bd_abort_claiming()
under bdev->bd_mutex. And the fact that __blkdev_get() frees the reference
you pass to it is somewhat subtle and surprising so I think we are better
off getting rid of that.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
