From: "Philip J. Kelleher" <pjk1939@linux.vnet.ibm.com>
Date: Fri, 21 Jun 2013 14:09:08 +0000
Subject: Re: [patch] rsxx: returning bytes remaining instead of -EFAULT
Message-Id: <20130621140908.GP6492@oc6784271780.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130621062111.GC10873@elgon.mountain>
In-Reply-To: <20130621062111.GC10873@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Joshua Morris <josh.h.morris@us.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 21, 2013 at 09:21:11AM +0300, Dan Carpenter wrote:
> copy_to/from_user() returns the number of bytes remaining to be copied.
> We should return -EFAULT here instead.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/block/rsxx/core.c b/drivers/block/rsxx/core.c
> index 6e85e21..102dc60 100644
> --- a/drivers/block/rsxx/core.c
> +++ b/drivers/block/rsxx/core.c
> @@ -199,9 +199,8 @@ static ssize_t rsxx_cram_read(struct file *fp, char __user *ubuf,
>  	if (st)
>  		return st;
> 
> -	st = copy_to_user(ubuf, buf, cnt);
> -	if (st)
> -		return st;
> +	if (copy_to_user(ubuf, buf, cnt))
> +		return -EFAULT;
> 
>  	info->offset += cnt;
> 
> @@ -222,9 +221,8 @@ static ssize_t rsxx_cram_write(struct file *fp, const char __user *ubuf,
>  	if (!buf)
>  		return -ENOMEM;
> 
> -	st = copy_from_user(buf, ubuf, cnt);
> -	if (st)
> -		return st;
> +	if (copy_from_user(buf, ubuf, cnt))
> +		return -EFAULT;
> 
>  	info->f_pos = (u32)*ppos + info->offset;

Thank You for noticing that mistake on my part.

> 
> 

