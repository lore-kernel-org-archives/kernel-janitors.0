From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 19 Sep 2019 18:17:34 +0000
Subject: Re: [PATCH] ata: libahci_platform: Add of_node_put() before loop exit
Message-Id: <c61069af-29c0-449a-a07f-c89c5a5535fa@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190815060014.2191-1-nishkadg.linux@gmail.com>
In-Reply-To: <20190815060014.2191-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Nishka Dasgupta <nishkadg.linux@gmail.com>, Jens Axboe <axboe@kernel.dk>, Hans de Goede <hdegoede@redhat.com>, linux-ide@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> +++ b/drivers/ata/libahci_platform.c
> @@ -497,6 +497,7 @@ struct ahci_host_priv *ahci_platform_get_resources(struct platform_device *pdev,
>
>  			if (of_property_read_u32(child, "reg", &port)) {
>  				rc = -EINVAL;
> +				of_node_put(child);
>  				goto err_out;
>  			}

I suggest to move the added function call to another jump target.

-				goto err_out;
+				goto err_put_node;
 	…
+err_put_node:
 	of_node_put(child);
 err_out:
 	…


Regards,
Markus
