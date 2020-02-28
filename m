From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 28 Feb 2020 14:25:58 +0000
Subject: Re: [PATCH] loop: Fix IS_ERR() vs NULL bugs in loop_prepare_queue()
Message-Id: <c106c6ec-7171-3586-d5c5-5c14e386b3d5@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228141350.iaviwnry3z4ipjqe@kili.mountain>
In-Reply-To: <20200228141350.iaviwnry3z4ipjqe@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Dan Schatzberg <schatzberg.dan@gmail.com>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2/28/20 7:13 AM, Dan Carpenter wrote:
> The alloc_workqueue() function returns NULL on error, it never returns
> error pointers.
> 
> Fixes: 29dab2122492 ("loop: use worker per cgroup instead of kworker")

I can't seem to find this commit?

-- 
Jens Axboe
