From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 05 Jun 2020 13:04:56 +0000
Subject: Re: block: Fix use-after-free in blkdev_get()
Message-Id: <1d95e2f6-7cf8-f0d3-bf8a-54d0a99c9ba1@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88676ff2-cb7e-70ec-4421-ecf8318990b1@web.de>
 <5fa658bf-3028-9b5c-30cc-dbdef6bf8f7a@huawei.com>
 <20200605094353.GS30374@kadam> <2ee6f2f7-eaec-e748-bead-0ad59f4c378b@web.de>
 <20200605111049.GA19604@bombadil.infradead.org>
 <b6c8ebd7-ccd3-2a94-05b2-7b92a30ec8a9@web.de>
 <20200605115158.GD19604@bombadil.infradead.org>
 <453060f2-80af-86a4-7e33-78d4cc87503f@web.de>
In-Reply-To: <453060f2-80af-86a4-7e33-78d4cc87503f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, Matthew Wilcox <willy@infradead.org>, linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Jason Yan <yanaijie@huawei.com>, hulkci@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>, Ming Lei <ming.lei@redhat.com>

On 6/5/20 7:01 AM, Markus Elfring wrote:
>>> The details can vary also for my suggestions.
>>> Would you point any more disagreements out on concrete items?
>>
>> That's exactly the problem with many of your comments.
>> They're vague to the point of unintelligibility.
> 
> Was is so vague about possibilities which I point out for patch reviews
> (for example)?
> * Spelling corrections
> * Additional wording alternatives

I'll make this very simple - don't reply making suggestions to commit
messages, ever. The "improvements" aren't usually improvements, and it
causes more confusion for the submitter.

Maintainers generally do change commit messages to improve them, if
needed.

No reply is needed to this e-mail.

-- 
Jens Axboe
