From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Jan 2021 14:56:10 +0000
Subject: Re: [PATCH] io_uring: fix an IS_ERR() vs NULL check
Message-Id: <20210106145610.GC2831@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/WCTxIRT4SHLemV@mwanda>
 <c88d8500-681d-7503-77ca-ae10d230a11b@gmail.com>
 <20210106143401.GD175893@casper.infradead.org>
In-Reply-To: <20210106143401.GD175893@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

Jens just applied my patch right before you sent this.  I don't have
strong feeling either way about this.  I guess I sort of agree with
you.  If Jens can drop my patch then it should be pretty trivial for
you to add a commit message to your patch and give me a Reported-by
tag?

regards,
dan carpenter
