From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 20 Feb 2006 21:09:17 +0000
Subject: Re: [KJ] bonding/bond_main.c: check return value of
Message-Id: <20060220210917.GB29791@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4618238268108259=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <43E20B2F.8050109@bfs.de>
In-Reply-To: <43E20B2F.8050109@bfs.de>
To: kernel-janitors@vger.kernel.org

--===============4618238268108259==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 02, 2006 at 02:37:51PM +0100, walter harms wrote:
> --- linux/drivers/net/bonding/bond_main.c.bak	2006-02-01 22:13:29.000000000 +0100
> +++ linux/drivers/net/bonding/bond_main.c	2006-02-01 22:41:31.000000000 +0100
> @@ -4893,7 +4893,14 @@
>  	}
>
>  	rtnl_unlock();
> -	register_netdevice_notifier(&bond_netdev_notifier);
> +
> +	res = register_netdevice_notifier(&bond_netdev_notifier);
> +
> +	if (res < 0) {
> +		printk( KERN_WARNING DRV_NAME" register_netdevice_notifier failed\n");

This one is OK, except I don't like empty lines introduced. KERN_WARNING
should KERN_ERR really.

> +		goto out_err;
> +	}


--===============4618238268108259==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4618238268108259==--
