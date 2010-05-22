From: walter harms <wharms@bfs.de>
Date: Sat, 22 May 2010 09:39:41 +0000
Subject: Re: [PATCH 10/27] drivers/infiniband/core: Use memdup_user
Message-Id: <4BF7A65D.1070501@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005221021030.13021@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005221021030.13021-QfmoRoYWmW9knbxzx/v8hQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Cc: Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



Julia Lawall schrieb:
> From: Julia Lawall <julia@diku.dk>
> 
> Use memdup_user when user data is immediately copied into the
> allocated region.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression from,to,size,flag;
> position p;
> identifier l1,l2;
> @@
> 
> -  to = \(kmalloc@p\|kzalloc@p\)(size,flag);
> +  to = memdup_user(from,size);
>    if (
> -      to=NULL
> +      IS_ERR(to)
>                  || ...) {
>    <+... when != goto l1;
> -  -ENOMEM
> +  PTR_ERR(to)
>    ...+>
>    }
> -  if (copy_from_user(to, from, size) != 0) {
> -    <+... when != goto l2;
> -    -EFAULT
> -    ...+>
> -  }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/infiniband/core/ucm.c |   11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/infiniband/core/ucm.c b/drivers/infiniband/core/ucm.c
> index 4647484..08f948d 100644
> --- a/drivers/infiniband/core/ucm.c
> +++ b/drivers/infiniband/core/ucm.c
> @@ -706,14 +706,9 @@ static int ib_ucm_alloc_data(const void **dest, u64 src, u32 len)
>  	if (!len)
>  		return 0;
>  
> -	data = kmalloc(len, GFP_KERNEL);
> -	if (!data)
> -		return -ENOMEM;
> -
> -	if (copy_from_user(data, (void __user *)(unsigned long)src, len)) {
> -		kfree(data);
> -		return -EFAULT;
> -	}
> +	data = memdup_user((void __user *)(unsigned long)src, len);
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
>  
>  	*dest = data;
>  	return 0;
> --

This cast look strange, can it happen that (unsigned long)<(u64) ?
(is there a 32bit infiniband) ?

just my 2 cents,
 wh




