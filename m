From: Jiri Kosina <trivial@kernel.org>
Date: Fri, 12 Jun 2009 09:02:23 +0000
Subject: Re: [PATCH] infiniband: adding __init/__exit macros to addr.c and
Message-Id: <alpine.LNX.2.00.0906121101410.7457@wotan.suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="168427776-295265968-1244797343=:7457"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200906110200.05883.PeterHuewe@gmx.de>
In-Reply-To: <200906110200.05883.PeterHuewe@gmx.de>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--168427776-295265968-1244797343=:7457
Content-Type: TEXT/PLAIN; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable


[ CCing Infiniband maintainers in case they prefer taking it through the=20
  subsystem tree ]

On Thu, 11 Jun 2009, Peter H=FCwe wrote:

> From: Peter Huewe <peterhuewe@gmx.de>
>=20
> Trivial patch which adds the __init and __exit macros to the module_init /
> module_exit functions from drivers/infiniband/core/addr.c and cma.c
> linux version 2.6.30
>=20
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> ---
> diff --git a/drivers/infiniband/core/addr.c b/drivers/infiniband/core/add=
r.c
> index ce511d8..5be1bd4 100644
> --- a/drivers/infiniband/core/addr.c
> +++ b/drivers/infiniband/core/addr.c
> @@ -514,7 +514,7 @@ static struct notifier_block nb =3D {
>  	.notifier_call =3D netevent_callback
>  };
> =20
> -static int addr_init(void)
> +static int __init addr_init(void)
>  {
>  	addr_wq =3D create_singlethread_workqueue("ib_addr");
>  	if (!addr_wq)
> @@ -524,7 +524,7 @@ static int addr_init(void)
>  	return 0;
>  }
> =20
> -static void addr_cleanup(void)
> +static void __exit addr_cleanup(void)
>  {
>  	unregister_netevent_notifier(&nb);
>  	destroy_workqueue(addr_wq);
> diff --git a/drivers/infiniband/core/cma.c b/drivers/infiniband/core/cma.c
> index 851de83..0753178 100644
> --- a/drivers/infiniband/core/cma.c
> +++ b/drivers/infiniband/core/cma.c
> @@ -2960,7 +2960,7 @@ static void cma_remove_one(struct ib_device *device)
>  	kfree(cma_dev);
>  }
> =20
> -static int cma_init(void)
> +static int __init cma_init(void)
>  {
>  	int ret, low, high, remaining;
> =20
> @@ -2990,7 +2990,7 @@ err:
>  	return ret;
>  }
> =20
> -static void cma_cleanup(void)
> +static void __exit cma_cleanup(void)
>  {
>  	ib_unregister_client(&cma_client);
>  	unregister_netdevice_notifier(&cma_nb);
>=20

--=20
Jiri Kosina
SUSE Labs

--168427776-295265968-1244797343=:7457--
