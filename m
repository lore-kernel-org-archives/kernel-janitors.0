From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Mon, 11 Aug 2014 02:56:50 +0000
Subject: Re: [PATCH 6/14] powerpc/fsl: fsl_soc: delete unneeded test before of_node_put
Message-Id: <1407725810.4508.55.camel@pasglop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407492475-26283-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407492475-26283-4-git-send-email-Julia.Lawall@lip6.fr>
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

> ---
>  arch/powerpc/sysdev/fsl_soc.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/sysdev/fsl_soc.c b/arch/powerpc/sysdev/fsl_soc.c
> index ffd1169..bfb5b6c 100644
> --- a/arch/powerpc/sysdev/fsl_soc.c
> +++ b/arch/powerpc/sysdev/fsl_soc.c
> @@ -197,8 +197,7 @@ static int __init setup_rstcr(void)
>  	if (!rstcr && ppc_md.restart =3D fsl_rstcr_restart)
>  		printk(KERN_ERR "No RSTCR register, warm reboot won't work\n");
> =20
> -	if (np)
> -		of_node_put(np);
> +	of_node_put(np);
> =20
>  	return 0;
>  }
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
