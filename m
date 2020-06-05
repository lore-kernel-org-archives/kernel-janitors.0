From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 Jun 2020 11:10:39 +0000
Subject: Re: [PATCH v2] block: Fix use-after-free in blkdev_get()
Message-Id: <20200605111039.GL22511@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88676ff2-cb7e-70ec-4421-ecf8318990b1@web.de>
 <5fa658bf-3028-9b5c-30cc-dbdef6bf8f7a@huawei.com>
 <20200605094353.GS30374@kadam>
 <2ee6f2f7-eaec-e748-bead-0ad59f4c378b@web.de>
In-Reply-To: <2ee6f2f7-eaec-e748-bead-0ad59f4c378b@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Jason Yan <yanaijie@huawei.com>, linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, hulkci@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>

On Fri, Jun 05, 2020 at 12:56:45PM +0200, Markus Elfring wrote:
> > A lot of maintainers have blocked Markus and asked him to stop trying
> > to help people write commit message.
> 
> I am trying to contribute a bit of patch review as usual.
> 

We have asked you again and again to stop commenting on commit messages.
New kernel developers have emailed me privately to say that your review
comments confused and discouraged them.  Greg has created a email bot to
respond to your commit message reviews.

regards,
dan carpenter
