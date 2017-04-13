From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <m@bjorling.me>
Date: Thu, 13 Apr 2017 19:35:39 +0000
Subject: Re: [PATCH] lightnvm: pblk-gc: fix an error pointer dereference in init
Message-Id: <79438233-5e3e-eff3-2918-4c63557eb07f@bjorling.me>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170413193241.GA591@mwanda>
In-Reply-To: <20170413193241.GA591@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Matias Bjorling <mb@lightnvm.io>, =?UTF-8?Q?Javier_Gonz=c3=a1lez?= <jg@lightnvm.io>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

On 04/13/2017 09:32 PM, Dan Carpenter wrote:
> These labels are reversed so we could end up dereferencing an error
> pointer or leaking.
>
> Fixes: 7f347ba6bb3a ("lightnvm: physical block device (pblk) target")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/lightnvm/pblk-gc.c b/drivers/lightnvm/pblk-gc.c
> index 9b147cfd8a41..f173fd4ea947 100644
> --- a/drivers/lightnvm/pblk-gc.c
> +++ b/drivers/lightnvm/pblk-gc.c
> @@ -527,10 +527,10 @@ int pblk_gc_init(struct pblk *pblk)
>
>  	return 0;
>
> -fail_free_main_kthread:
> -	kthread_stop(gc->gc_ts);
>  fail_free_writer_kthread:
>  	kthread_stop(gc->gc_writer_ts);
> +fail_free_main_kthread:
> +	kthread_stop(gc->gc_ts);
>
>  	return ret;
>  }
>

Thanks Dan. I've applied it for 4.12.
