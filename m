From: Lyude Paul <lyude@redhat.com>
Date: Thu, 07 Jun 2018 16:22:46 +0000
Subject: Re: [PATCH -next] Input: synaptics-rmi4 - fix the error return code in rmi_probe_interrupts()
Message-Id: <6cdcc804be73a5e3bb6e8d70ab86dc716c5cc720.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Thu, 2018-06-07 at 01:48 +0000, Wei Yongjun wrote:
> The error return code PTR_ERR(data->irqdomain) is always 0 since
> data->irqdomain is equal to NULL in this error handling case.
> 
> Fixes: 24d28e4f1271 ("Input: synaptics-rmi4 - convert irq distribution to
> irq_domain")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/input/rmi4/rmi_driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/rmi4/rmi_driver.c
> b/drivers/input/rmi4/rmi_driver.c
> index 2fb0ae0..cb6d983 100644
> --- a/drivers/input/rmi4/rmi_driver.c
> +++ b/drivers/input/rmi4/rmi_driver.c
> @@ -1043,7 +1043,7 @@ int rmi_probe_interrupts(struct rmi_driver_data *data)
>  						   data);
>  	if (!data->irqdomain) {
>  		dev_err(&rmi_dev->dev, "Failed to create IRQ domain\n");
> -		return PTR_ERR(data->irqdomain);
> +		return -ENOMEM;
>  	}
>  
>  	data->irq_count = irq_count;
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-input" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
-- 
Cheers,
	Lyude Paul
