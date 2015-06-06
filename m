From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 06 Jun 2015 05:20:28 +0000
Subject: Re: [PATCH v2] firmware: Fix memory leak in error path
Message-Id: <alpine.DEB.2.02.1506060719460.2009@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1433562919-14325-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1433562919-14325-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Sat, 6 Jun 2015, Firo Yang wrote:

> Eliminate a memory leak by unifying the error handling code
> at the end of the function.
> 
> Signed-off-by: Firo Yang <firogm@gmail.com>
> ---
>  drivers/base/firmware_class.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/firmware_class.c b/drivers/base/firmware_class.c
> index 8c3aa3c..bf06fb2 100644
> --- a/drivers/base/firmware_class.c
> +++ b/drivers/base/firmware_class.c
> @@ -1299,6 +1299,7 @@ request_firmware_nowait(
>  	const char *name, struct device *device, gfp_t gfp, void *context,
>  	void (*cont)(const struct firmware *fw, void *context))
>  {
> +	int rc;
>  	struct firmware_work *fw_work;
>  
>  	fw_work = kzalloc(sizeof(struct firmware_work), gfp);
> @@ -1307,8 +1308,11 @@ request_firmware_nowait(
>  
>  	fw_work->module = module;
>  	fw_work->name = kstrdup_const(name, gfp);
> -	if (!fw_work->name)
> -		return -ENOMEM;
> +	if (!fw_work->name) {
> +		rc = -ENOMEM;
> +		goto err_dup;
> +	}
> +
>  	fw_work->device = device;
>  	fw_work->context = context;
>  	fw_work->cont = cont;
> @@ -1316,15 +1320,20 @@ request_firmware_nowait(
>  		(uevent ? FW_OPT_UEVENT : FW_OPT_USERHELPER);
>  
>  	if (!try_module_get(module)) {
> -		kfree_const(fw_work->name);
> -		kfree(fw_work);
> -		return -EFAULT;
> +		rc = -EFAULT;
> +		goto err_module;
>  	}
>  
>  	get_device(fw_work->device);
>  	INIT_WORK(&fw_work->work, request_firmware_work_func);
>  	schedule_work(&fw_work->work);
>  	return 0;
> +
> +err_module:

It is considered to be safer that the label reflect what happens at the 
destination, and not the reason for reaching the label.

julia

> +	kfree_const(fw_work->name);
> +err_dup:
> +	kfree(fw_work);
> +	return rc;
>  }
>  EXPORT_SYMBOL(request_firmware_nowait);
>  
> -- 
> 2.4.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
