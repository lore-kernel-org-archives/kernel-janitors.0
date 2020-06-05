From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 05 Jun 2020 11:48:43 +0000
Subject: Re: block: Fix use-after-free in blkdev_get()
Message-Id: <b6c8ebd7-ccd3-2a94-05b2-7b92a30ec8a9@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88676ff2-cb7e-70ec-4421-ecf8318990b1@web.de>
 <5fa658bf-3028-9b5c-30cc-dbdef6bf8f7a@huawei.com>
 <20200605094353.GS30374@kadam> <2ee6f2f7-eaec-e748-bead-0ad59f4c378b@web.de>
 <20200605111049.GA19604@bombadil.infradead.org>
In-Reply-To: <20200605111049.GA19604@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>, linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Jason Yan <yanaijie@huawei.com>, hulkci@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>

>> I am trying to contribute a bit of patch review as usual.
>
> Please stop criticising people's commit messages.  Your suggestions
> are usually not improvements.

The details can vary also for my suggestions.
Would you point any more disagreemnents out on concrete items?


> But refcount -> reference count is not particularly interesting.

Can a wording clarification become helpful also for this issue?

Regards,
Markus
