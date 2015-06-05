From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 05 Jun 2015 16:43:33 +0000
Subject: Re: [PATCH] firmware: Fix memory leak in error path
Message-Id: <alpine.DEB.2.10.1506051843040.2388@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433522316-23063-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1433522316-23063-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 6 Jun 2015, Firo Yang wrote:

> In error path, we forgot to free fw_work alloced by kzalloc.
> This will make a memory leak. So just free it before return.
>
> Signed-off-by: Firo Yang <firogm@gmail.com>
> ---
>  drivers/base/firmware_class.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/base/firmware_class.c b/drivers/base/firmware_class.c
> index 8c3aa3c..9c42883 100644
> --- a/drivers/base/firmware_class.c
> +++ b/drivers/base/firmware_class.c
> @@ -1307,8 +1307,10 @@ request_firmware_nowait(
>
>  	fw_work->module = module;
>  	fw_work->name = kstrdup_const(name, gfp);
> -	if (!fw_work->name)
> +	if (!fw_work->name) {
> +		kfree(fw_work);
>  		return -ENOMEM;
> +	}

Maybe it would be better to unify the error handling code at the end of
the function, if things are being forgotten.

julia

>  	fw_work->device = device;
>  	fw_work->context = context;
>  	fw_work->cont = cont;
> --
> 2.4.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
