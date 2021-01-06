From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 06 Jan 2021 14:59:34 +0000
Subject: Re: [PATCH] io_uring: fix an IS_ERR() vs NULL check
Message-Id: <4ba258d5-6097-ca9f-4467-6392404030cb@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/WCTxIRT4SHLemV@mwanda>
 <c88d8500-681d-7503-77ca-ae10d230a11b@gmail.com>
 <20210106143401.GD175893@casper.infradead.org> <20210106145610.GC2831@kadam>
In-Reply-To: <20210106145610.GC2831@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Matthew Wilcox <willy@infradead.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 1/6/21 7:56 AM, Dan Carpenter wrote:
> Jens just applied my patch right before you sent this.  I don't have
> strong feeling either way about this.  I guess I sort of agree with
> you.  If Jens can drop my patch then it should be pretty trivial for
> you to add a commit message to your patch and give me a Reported-by
> tag?

I can just drop it, don't feel too strongly but would tend to agree
that we might as well just make it NULL/pointer as it's a single
error value. Willy, are you sending a patch?

-- 
Jens Axboe
