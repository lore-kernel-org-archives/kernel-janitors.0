From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Feb 2020 16:11:58 +0000
Subject: Re: [PATCH] loop: Fix IS_ERR() vs NULL bugs in loop_prepare_queue()
Message-Id: <20200228161158.GC4118@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228141350.iaviwnry3z4ipjqe@kili.mountain>
 <c106c6ec-7171-3586-d5c5-5c14e386b3d5@kernel.dk>
In-Reply-To: <c106c6ec-7171-3586-d5c5-5c14e386b3d5@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Dan Schatzberg <schatzberg.dan@gmail.com>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Feb 28, 2020 at 07:25:58AM -0700, Jens Axboe wrote:
> On 2/28/20 7:13 AM, Dan Carpenter wrote:
> > The alloc_workqueue() function returns NULL on error, it never returns
> > error pointers.
> > 
> > Fixes: 29dab2122492 ("loop: use worker per cgroup instead of kworker")
> 
> I can't seem to find this commit?

I guess this went through Andrew Morton's tree.  I'll resend to him.

regards,
dan carpenter
