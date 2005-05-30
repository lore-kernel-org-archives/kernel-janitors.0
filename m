From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 30 May 2005 06:25:17 +0000
Subject: Re: [KJ] [PATCH] aic79xx_osm scsi_add_host error checking
Message-Id: <200505301025.17819.adobriyan@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <429A7511.9020007@gmail.com>
In-Reply-To: <429A7511.9020007@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Monday 30 May 2005 06:06, Chuck Short wrote:
> This patch checks for the return value of scsi_add_host.

> --- linux-source-2.6.12-2.6.11.93.orig/drivers/scsi/aic7xxx/aic79xx_osm.c
> +++ linux-source-2.6.12-2.6.11.93/drivers/scsi/aic7xxx/aic79xx_osm.c
> @@ -1989,7 +1989,8 @@
>  	char	*new_name;
>  	u_long	s;
>  	u_long	target;
> -
> +	int error;
> +	

Trailing whitespace.

>  	template->name = ahd->description;
>  	host = scsi_host_alloc(template, sizeof(struct ahd_softc *));
>  	if (host = NULL)
> @@ -2065,7 +2066,9 @@
>  	ahd_unlock(ahd, &s);
>  
>  #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
> -	scsi_add_host(host, &ahd->dev_softc->dev); /* XXX handle failure */
> +	error = scsi_add_host(host, &ahd->dev_softc->dev);
> +	if (error)
> +		return (ENOMEM);	

Trailing whitespace.

>  	scsi_scan_host(host);
>  #endif
>  	return (0);

Also, before scsi_add_host() there is, at least:
	host = scsi_host_alloc(template, sizeof(struct ahd_softc *));
	new_name = malloc(strlen(buf) + 1, M_DEVBUF, M_NOWAIT);
	ahd->platform_data->dv_pid = kernel_thread(ahd_linux_dv_thread, ahd, 0);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
