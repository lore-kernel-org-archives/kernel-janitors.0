From: Jeff Liu <jeff.liu@oracle.com>
Date: Sat, 13 Oct 2012 13:25:40 +0000
Subject: Re: [patch] RDS: fix an integer overflow check
Message-Id: <50796BD4.4000608@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121012073146.GA9543@elgon.mountain>
In-Reply-To: <20121012073146.GA9543@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Venkat Venkatsubra <venkat.x.venkatsubra@oracle.com>, "David S. Miller" <davem@davemloft.net>, rds-devel@oss.oracle.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/12/2012 03:31 PM, Dan Carpenter wrote:
> "len" is an int.  We verified that len was postive already.  Since
> PAGE_SIZE is specified as an unsigned long, the type it promoted to
> unsigned and the condition is never true.
>
> I'm not sure this check is actually needed.  It might be that we could
> just remove it?
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/net/rds/info.c b/net/rds/info.c
> index 9a6b4f6..4d62618 100644
> --- a/net/rds/info.c
> +++ b/net/rds/info.c
> @@ -176,7 +176,7 @@ int rds_info_getsockopt(struct socket *sock, int optname, char __user *optval,
>   
>   	/* check for all kinds of wrapping and the like */
>   	start = (unsigned long)optval;
> -	if (len < 0 || len + PAGE_SIZE - 1 < len || start + len < start) {
Looks the original thought is to check up len + (PAGE_SIZE - 1) < len to 
avoid integer overflow, but lack of a "()".

However, we only have one add operation in this function which were 
shown as following:
         nr_pages = (PAGE_ALIGN(start + len) - (start & PAGE_MASK))
                         >> PAGE_SHIFT;

I also gone through the call chains, there is no other (start + len) 
operations for all transport, I think it's safe to remove this check up 
if so.

Thanks,
-Jeff
> +	if (len < 0 || len > INT_MAX - (PAGE_SIZE - 1) || start + len < start) {
>   		ret = -EINVAL;
>   		goto out;
>   	}
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

