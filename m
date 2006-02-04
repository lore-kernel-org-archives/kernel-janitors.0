From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 04 Feb 2006 17:50:29 +0000
Subject: Re: [KJ] hamradio/bpqether.c: check return value of
Message-Id: <20060204175029.GC5966@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============059197463169275988=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <43E20A9A.2070007@bfs.de>
In-Reply-To: <43E20A9A.2070007@bfs.de>
To: kernel-janitors@vger.kernel.org

--===============059197463169275988==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> --- linux/drivers/net/hamradio/bpqether.c.bak
> +++ linux/drivers/net/hamradio/bpqether.c
> @@ -595,6 +595,7 @@
>   */
>  static int __init bpq_init_driver(void)
>  {
> +	int ret;
>  #ifdef CONFIG_PROC_FS
>  	if (!proc_net_fops_create("bpqether", S_IRUGO, &bpq_info_fops)) {
>  		printk(KERN_ERR
> @@ -605,7 +606,12 @@
>
>  	dev_add_pack(&bpq_packet_type);
>
> -	register_netdevice_notifier(&bpq_dev_notifier);
> +	ret = register_netdevice_notifier(&bpq_dev_notifier);
> +	if (ret < 0) {
> +		printk( KERN_WARNING "register_netdevice_notifier failed in %s\n",__FUNCTION__);
> +		dev_remove_pack(&bpq_packet_type);
> +		return -1;
> +	}

Looks good except proc_net_fops_create() should be reversed, KERN_ERR,
and not return -1 always.


--===============059197463169275988==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============059197463169275988==--
