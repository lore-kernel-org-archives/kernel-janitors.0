From: Hans de Goede <hdegoede@redhat.com>
Date: Mon, 23 Sep 2019 09:07:38 +0000
Subject: Re: [PATCH] ata: libahci_platform: Use common error handling code in ahci_platform_get_resources()
Message-Id: <7463a1d5-e76f-99a6-5a1e-f9477da3c1da@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6ca97aeb-0892-ed0e-a149-b25848adf324@web.de>
In-Reply-To: <6ca97aeb-0892-ed0e-a149-b25848adf324@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-ide@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi,

On 22-09-2019 15:55, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Sep 2019 15:42:46 +0200
> 
> Convert the call of the function “of_node_put” to another jump target
> so that it can be better reused at three places in this function.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/ata/libahci_platform.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
> index e742780950de..7b2e364f3bd5 100644
> --- a/drivers/ata/libahci_platform.c
> +++ b/drivers/ata/libahci_platform.c
> @@ -497,8 +497,7 @@ struct ahci_host_priv *ahci_platform_get_resources(struct platform_device *pdev,
> 
>   			if (of_property_read_u32(child, "reg", &port)) {
>   				rc = -EINVAL;
> -				of_node_put(child);
> -				goto err_out;
> +				goto err_put_node;
>   			}
> 
>   			if (port >= hpriv->nports) {
> @@ -515,18 +514,14 @@ struct ahci_host_priv *ahci_platform_get_resources(struct platform_device *pdev,
>   			if (port_dev) {
>   				rc = ahci_platform_get_regulator(hpriv, port,
>   								&port_dev->dev);
> -				if (rc == -EPROBE_DEFER) {
> -					of_node_put(child);
> -					goto err_out;
> -				}
> +				if (rc == -EPROBE_DEFER)
> +					goto err_put_node;
>   			}
>   #endif
> 
>   			rc = ahci_platform_get_phy(hpriv, port, dev, child);
> -			if (rc) {
> -				of_node_put(child);
> -				goto err_out;
> -			}
> +			if (rc)
> +				goto err_put_node;
> 
>   			enabled_ports++;
>   		}
> @@ -558,6 +553,8 @@ struct ahci_host_priv *ahci_platform_get_resources(struct platform_device *pdev,
>   	devres_remove_group(dev, NULL);
>   	return hpriv;
> 
> +err_put_node:
> +	of_node_put(child);
>   err_out:
>   	devres_release_group(dev, NULL);
>   	return ERR_PTR(rc);
> --
> 2.23.0
> 
