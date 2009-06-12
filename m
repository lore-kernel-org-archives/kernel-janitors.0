From: Jiri Kosina <trivial@kernel.org>
Date: Fri, 12 Jun 2009 09:03:19 +0000
Subject: Re: [PATCH] mtd: adding __init/__exit macros to init/exitfunctions
Message-Id: <alpine.LNX.2.00.0906121102420.7457@wotan.suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="168427776-1635200020-1244797399=:7457"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200906110223.33397.PeterHuewe@gmx.de>
In-Reply-To: <200906110223.33397.PeterHuewe@gmx.de>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--168427776-1635200020-1244797399=:7457
Content-Type: TEXT/PLAIN; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable


[ CCing dmmw2 -- please either Ack the patch so that I can take it through =

  trivial tree, or take it through your tree. Thanks.

On Thu, 11 Jun 2009, Peter H=FCwe wrote:

> From: Peter Huewe <peterhuewe@gmx.de>
>=20
> Trivial patch which adds the __init and __exit macros to the module_init /
> module_exit functions to the following modules from drivers/mtd/=20
>  devices/m25p80.c
>  devices/slram.c
>  linux version 2.6.30
>  ftl.c
>  nand/cafe_nand.c
>  nand/cmx270_nand.c
>=20
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> ---
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index cc6369e..4ca4fab 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -772,13 +772,13 @@ static struct spi_driver m25p80_driver =3D {
>  };
> =20
> =20
> -static int m25p80_init(void)
> +static int __init m25p80_init(void)
>  {
>  	return spi_register_driver(&m25p80_driver);
>  }
> =20
> =20
> -static void m25p80_exit(void)
> +static void __exit m25p80_exit(void)
>  {
>  	spi_unregister_driver(&m25p80_driver);
>  }
> diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
> index 00248e8..7d846e9 100644
> --- a/drivers/mtd/devices/slram.c
> +++ b/drivers/mtd/devices/slram.c
> @@ -303,7 +303,7 @@ __setup("slram=3D", mtd_slram_setup);
> =20
>  #endif
> =20
> -static int init_slram(void)
> +static int __init init_slram(void)
>  {
>  	char *devname;
>  	int i;
> diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
> index a790c06..e56d6b4 100644
> --- a/drivers/mtd/ftl.c
> +++ b/drivers/mtd/ftl.c
> @@ -1099,7 +1099,7 @@ static struct mtd_blktrans_ops ftl_tr =3D {
>  	.owner		=3D THIS_MODULE,
>  };
> =20
> -static int init_ftl(void)
> +static int __init init_ftl(void)
>  {
>  	return register_mtd_blktrans(&ftl_tr);
>  }
> diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
> index 29acd06..1b4690b 100644
> --- a/drivers/mtd/nand/cafe_nand.c
> +++ b/drivers/mtd/nand/cafe_nand.c
> @@ -903,12 +903,12 @@ static struct pci_driver cafe_nand_pci_driver =3D {
>  	.resume =3D cafe_nand_resume,
>  };
> =20
> -static int cafe_nand_init(void)
> +static int __init cafe_nand_init(void)
>  {
>  	return pci_register_driver(&cafe_nand_pci_driver);
>  }
> =20
> -static void cafe_nand_exit(void)
> +static void __exit cafe_nand_exit(void)
>  {
>  	pci_unregister_driver(&cafe_nand_pci_driver);
>  }
> diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nan=
d.c
> index 10081e6..826cacf 100644
> --- a/drivers/mtd/nand/cmx270_nand.c
> +++ b/drivers/mtd/nand/cmx270_nand.c
> @@ -147,7 +147,7 @@ static int cmx270_device_ready(struct mtd_info *mtd)
>  /*
>   * Main initialization routine
>   */
> -static int cmx270_init(void)
> +static int __init cmx270_init(void)
>  {
>  	struct nand_chip *this;
>  	const char *part_type;
> @@ -261,7 +261,7 @@ module_init(cmx270_init);
>  /*
>   * Clean up routine
>   */
> -static void cmx270_cleanup(void)
> +static void __exit cmx270_cleanup(void)
>  {
>  	/* Release resources, unregister device */
>  	nand_release(cmx270_nand_mtd);
>=20

--=20
Jiri Kosina
SUSE Labs

--168427776-1635200020-1244797399=:7457--
