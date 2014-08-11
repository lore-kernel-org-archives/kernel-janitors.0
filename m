From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Mon, 11 Aug 2014 02:57:18 +0000
Subject: Re: [PATCH 4/14] powerpc/pseries: delete unneeded test before of_node_put
Message-Id: <1407725838.4508.57.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407492475-26283-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407492475-26283-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org

On Fri, 2014-08-08 at 12:07 +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Of_node_put supports NULL as its argument, so the initial test is not
> necessary.
>=20
> Suggested by Uwe Kleine-K=C3=B6nig.
>=20
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @@
> expression e;
> @@
>=20
> -if (e)
>    of_node_put(e);
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

>=20
> ---
>  arch/powerpc/platforms/pseries/iommu.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platfo=
rms/pseries/iommu.c
> index 33b552f..2ea6831 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -575,8 +575,7 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus =
*bus)
>  	while (isa_dn && isa_dn !=3D dn)
>  		isa_dn =3D isa_dn->parent;
> =20
> -	if (isa_dn_orig)
> -		of_node_put(isa_dn_orig);
> +	of_node_put(isa_dn_orig);
> =20
>  	/* Count number of direct PCI children of the PHB. */
>  	for (children =3D 0, tmp =3D dn->child; tmp; tmp =3D tmp->sibling)
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
