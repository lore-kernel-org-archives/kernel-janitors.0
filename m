From: Eddie James <eajames@linux.ibm.com>
Date: Wed, 30 Sep 2020 13:38:31 +0000
Subject: Re: [PATCH] soc: aspeed: xdma: Return -EFAULT if copy_from_user() fails
Message-Id: <65b1447e-8f37-69f9-4049-25d130a281f8@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200930090334.GB621698@mwanda>
In-Reply-To: <20200930090334.GB621698@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, kernel-janitors@vger.kernel.org, Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org


On 9/30/20 4:03 AM, Dan Carpenter wrote:
> The copy_from_user() function returns the number of bytes remaining
> which we weren't able to copy.  This should return -EFAULT to the
> user.


Thanks,

Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Fixes: 86609baa4217 ("soc: aspeed: xdma: Add user interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/soc/aspeed/aspeed-xdma.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/soc/aspeed/aspeed-xdma.c b/drivers/soc/aspeed/aspeed-xdma.c
> index 91b51a3de8df..e6b4744bda64 100644
> --- a/drivers/soc/aspeed/aspeed-xdma.c
> +++ b/drivers/soc/aspeed/aspeed-xdma.c
> @@ -569,9 +569,8 @@ static ssize_t aspeed_xdma_write(struct file *file, const char __user *buf,
>   	if (len != sizeof(op))
>   		return -EINVAL;
>   
> -	rc = copy_from_user(&op, buf, len);
> -	if (rc)
> -		return rc;
> +	if (copy_from_user(&op, buf, len))
> +		return -EFAULT;
>   
>   	if (!op.len || op.len > client->size ||
>   	    op.direction > ASPEED_XDMA_DIRECTION_UPSTREAM)
