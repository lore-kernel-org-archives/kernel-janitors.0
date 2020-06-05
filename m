From: Matthew Wilcox <willy@infradead.org>
Date: Fri, 05 Jun 2020 15:15:37 +0000
Subject: Re: block: Fix use-after-free in blkdev_get()
Message-Id: <20200605151537.GH19604@bombadil.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88676ff2-cb7e-70ec-4421-ecf8318990b1@web.de>
 <5fa658bf-3028-9b5c-30cc-dbdef6bf8f7a@huawei.com>
 <20200605094353.GS30374@kadam>
 <2ee6f2f7-eaec-e748-bead-0ad59f4c378b@web.de>
 <20200605111039.GL22511@kadam>
 <63e57552-ab95-7bb4-b4f1-70a307b6381d@web.de>
 <20200605114208.GC19604@bombadil.infradead.org>
 <a050788f-5875-0115-af31-692fd6bf3a88@web.de>
 <20200605125209.GG19604@bombadil.infradead.org>
 <366e055b-6a00-662e-2e03-f72053f67ae6@web.de>
In-Reply-To: <366e055b-6a00-662e-2e03-f72053f67ae6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Jason Yan <yanaijie@huawei.com>, hulkci@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>

On Fri, Jun 05, 2020 at 03:12:08PM +0200, Markus Elfring wrote:
> > Your feedback is unhelpful
> 
> Do you find proposed spelling corrections useful?

To commit messages?  No.

> > and you show no signs of changing it in response to the people
> > who are telling you that it's unhelpful.
> 
> Other adjustments can occasionally be more challenging
> besides the usual communication challenges.

I think I'm going to ask Greg if I can borrow his bot.

Many hackers start out by just making spelling fixes to code.  And that's
fine, often they progress to more substantial contributions.  You do not
seem to progress, and making spelling corrections to changelog messages
is a level of nitpicking that just isn't helpful.
