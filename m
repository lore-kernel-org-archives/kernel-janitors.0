From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jun 2020 18:08:45 +0000
Subject: Re: [PATCH v2] block: Fix use-after-free in blkdev_get()
Message-Id: <20200605180845.GU30374@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88676ff2-cb7e-70ec-4421-ecf8318990b1@web.de>
 <5fa658bf-3028-9b5c-30cc-dbdef6bf8f7a@huawei.com>
 <20200605094353.GS30374@kadam>
 <20200605144236.GB13248@quack2.suse.cz>
In-Reply-To: <20200605144236.GB13248@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Jason Yan <yanaijie@huawei.com>, Markus Elfring <Markus.Elfring@web.de>, linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, hulkci@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>

On Fri, Jun 05, 2020 at 04:42:36PM +0200, Jan Kara wrote:
> On Fri 05-06-20 12:43:54, Dan Carpenter wrote:
> > I wonder if maybe the best fix is to re-add the "if (!res) " check back
> > to blkdev_get().
> 
> Well, it won't be that simple since we need to call bd_abort_claiming()
> under bdev->bd_mutex. And the fact that __blkdev_get() frees the reference
> you pass to it is somewhat subtle and surprising so I think we are better
> off getting rid of that.

Fair enough.

Jason Yan sent a v3 of this patch that frees "whole".  I've looked it
over pretty close and I think it's probably correct.

(not that my opinion should count for much because I don't know this
code very well at all).

regards,
dan carpenter
