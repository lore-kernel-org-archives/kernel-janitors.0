From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 31 Aug 2017 16:52:47 +0000
Subject: Re: [PATCH] kernfs: checking for IS_ERR() instead of NULL
Message-Id: <20170831165247.GA26219@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170830140456.7n6sfogqb7mvjmrm@mwanda>
In-Reply-To: <20170830140456.7n6sfogqb7mvjmrm@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Shaohua Li <shli@fb.com>, linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 30, 2017 at 05:04:56PM +0300, Dan Carpenter wrote:
> The kernfs_get_inode() returns NULL on error, it never returns error
> pointers.
> 
> Fixes: aa8188253474 ("kernfs: add exportfs operations")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Tejun Heo <tj@kernel.org>

Hm, I don't know what tree aa8188253474 is in, but it's not mine, so I
can't take this patch :(

thanks,

greg k-h
