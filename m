From: Yanjun Zhu <yanjun.zhu@oracle.com>
Date: Mon, 24 Jul 2017 02:53:12 +0000
Subject: Re: [PATCH] IB/IPoIB: Fix error code in ipoib_add_port()
Message-Id: <e250def1-f150-090a-3a5d-2eed4e72bd1f@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170713074548.i6cgpjhmmcnvtd5c@mwanda>
In-Reply-To: <20170713074548.i6cgpjhmmcnvtd5c@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Erez Shitrit <erezsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Alex Vesker <valex-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Dasaratharaman Chandramouli <dasaratharaman.chandramouli-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Feras Daoud <ferasda-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Shamir Rabinovitch <shamir.rabinovitch-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Ahern <dsa-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Thanks!
Reviewed-by: Zhu Yanjun <yanjun.zhu@oracle.com>


On 2017/7/13 15:45, Dan Carpenter wrote:
> We accidentally don't see the error code on some of these error paths.
> It means we return ERR_PTR(0) which is NULL and it results in a NULL
> dereference in the caller.
>
> This bug dates to pre-git days.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/infiniband/ulp/ipoib/ipoib_main.c b/drivers/infiniband/ulp/ipoib/ipoib_main.c
> index 6e86eeee370e..ddd8114b6713 100644
> --- a/drivers/infiniband/ulp/ipoib/ipoib_main.c
> +++ b/drivers/infiniband/ulp/ipoib/ipoib_main.c
> @@ -2212,6 +2212,7 @@ static struct net_device *ipoib_add_port(const char *format,
>   		goto register_failed;
>   	}
>   
> +	result = -ENOMEM;
>   	if (ipoib_cm_add_mode_attr(priv->dev))
>   		goto sysfs_failed;
>   	if (ipoib_add_pkey_attr(priv->dev))
>

