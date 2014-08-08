From: Michal Simek <michal.simek@xilinx.com>
Date: Fri, 08 Aug 2014 10:45:11 +0000
Subject: Re: [PATCH 12/14] ll_temac: delete unneeded test before of_node_put
Message-Id: <8c6f53e8-f0ae-4b5e-b852-50603bff0060@BN1BFFO11FD029.protection.gbl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407492475-26283-12-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407492475-26283-12-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On 08/08/2014 12:07 PM, Julia Lawall wrote:
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
>=20
> ---
>  drivers/net/ethernet/xilinx/ll_temac_main.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/et=
hernet/xilinx/ll_temac_main.c
> index 8a6e5c2..36f4459 100644
> --- a/drivers/net/ethernet/xilinx/ll_temac_main.c
> +++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
> @@ -1148,8 +1148,7 @@ static int temac_of_remove(struct platform_device *=
op)
>  	temac_mdio_teardown(lp);
>  	unregister_netdev(ndev);
>  	sysfs_remove_group(&lp->dev->kobj, &temac_attr_group);
> -	if (lp->phy_node)
> -		of_node_put(lp->phy_node);
> +	of_node_put(lp->phy_node);
>  	lp->phy_node =3D NULL;
>  	iounmap(lp->regs);
>  	if (lp->sdma_regs)

Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal



--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
