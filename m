From: Dan Schatzberg <schatzberg.dan@gmail.com>
Date: Fri, 28 Feb 2020 16:15:50 +0000
Subject: Re: [PATCH] loop: Fix IS_ERR() vs NULL bugs in loop_prepare_queue()
Message-Id: <20200228161550.GA26021@dschatzberg-fedora-PC0Y6AEN.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228141350.iaviwnry3z4ipjqe@kili.mountain>
 <c106c6ec-7171-3586-d5c5-5c14e386b3d5@kernel.dk>
In-Reply-To: <c106c6ec-7171-3586-d5c5-5c14e386b3d5@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

es65;5603;1cOn Fri, Feb 28, 2020 at 07:25:58AM -0700, Jens Axboe wrote:
> On 2/28/20 7:13 AM, Dan Carpenter wrote:
> > The alloc_workqueue() function returns NULL on error, it never returns
> > error pointers.
> > 
> > Fixes: 29dab2122492 ("loop: use worker per cgroup instead of kworker")
> 
> I can't seem to find this commit?
> 
> -- 
> Jens Axboe
>

This went through Andrew's tree as patch series "Charge loop device
i/o to issuing cgroup", v3., it is currently in linux-next.

Thanks for fixing this Dan.

Acked-by: Dan Schatzberg <schatzberg.dan@gmail.com>
