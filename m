From: Domen Puncer <domen@coderock.org>
Date: Sat, 19 Feb 2005 20:27:11 +0000
Subject: [KJ] Re: drivers/scsi/aic7xxx/* - compile warning cleanup
Message-Id: <20050219202711.GA3850@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50822568781530708=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50822568781530708==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 15/02/05 00:02 +0200, Stephen Biggs wrote:
Content-Description: Mail message body
> Description: compile warning cleanup - handle error return from 
> scsi_add_host
> 
> Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>
> 
> diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/aic7xxx/aic79xx_osm.c linux-2.6.11-rc3-mm2/drivers/scsi/aic7xxx/aic79xx_osm.c
> --- linux-2.6.11-rc3-mm2-original/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-02-12 12:06:25.000000000 +0200
> +++ linux-2.6.11-rc3-mm2/drivers/scsi/aic7xxx/aic79xx_osm.c	2005-02-12 17:35:49.000000000 +0200
> @@ -2065,7 +2065,8 @@ ahd_linux_register_host(struct ahd_softc
>  	ahd_unlock(ahd, &s);
>  
>  #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
> -	scsi_add_host(host, &ahd->dev_softc->dev); /* XXX handle failure */
> +	if (scsi_add_host(host, &ahd->dev_softc->dev))
> +		return (EIO);

If it was that simple, I doubt they'd wrote the comment :-)
Everything has to be "undone" before return.


	Domen

--===============50822568781530708==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50822568781530708==--
