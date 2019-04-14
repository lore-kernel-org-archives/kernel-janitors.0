From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 14 Apr 2019 16:12:09 +0000
Subject: Re: [PATCH 09/12] meson-gx-socinfo: add missing of_node_put after of_device_is_available
Message-Id: <80bcfd1f-f7db-5d2a-a96b-4b63d2c97138@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1550928043-14889-10-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1550928043-14889-10-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> @@ -123,8 +123,10 @@  static int __init meson_gx_socinfo_init(
>  		return -ENODEV;
>
>  	/* check if interface is enabled */
> -	if (!of_device_is_available(np))
> +	if (!of_device_is_available(np)) {
> +		of_node_put(np);
>  		return -ENODEV;
> +	}
>
>  	/* check if chip-id is available */
>  	if (!of_property_read_bool(np, "amlogic,has-chip-id"))

How do you think about to adjust the exception handling in this function
implementation a bit more according to the Linux coding style?

Regards,
Markus
