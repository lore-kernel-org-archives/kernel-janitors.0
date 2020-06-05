From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Jun 2020 13:23:42 +0000
Subject: Re: block: Fix use-after-free in blkdev_get()
Message-Id: <b642a81c-84cd-ca05-5708-c109dc2e5ea8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88676ff2-cb7e-70ec-4421-ecf8318990b1@web.de>
 <5fa658bf-3028-9b5c-30cc-dbdef6bf8f7a@huawei.com>
 <20200605094353.GS30374@kadam> <2ee6f2f7-eaec-e748-bead-0ad59f4c378b@web.de>
 <20200605111049.GA19604@bombadil.infradead.org>
 <b6c8ebd7-ccd3-2a94-05b2-7b92a30ec8a9@web.de>
 <20200605115158.GD19604@bombadil.infradead.org>
 <453060f2-80af-86a4-7e33-78d4cc87503f@web.de>
 <1d95e2f6-7cf8-f0d3-bf8a-54d0a99c9ba1@kernel.dk>
In-Reply-To: <1d95e2f6-7cf8-f0d3-bf8a-54d0a99c9ba1@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>, Jason Yan <yanaijie@huawei.com>, hulkci@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>, Ming Lei <ming.lei@redhat.com>

> Maintainers generally do change commit messages to improve them,
> if needed.

You have got a documented choice here.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?idC5faf5c218a47fd6258187f62d9bb1009717896#n468

Regards,
Markus
