From: Gabor Juhos <juhosg@openwrt.org>
Date: Thu, 22 Aug 2013 17:50:12 +0000
Subject: Re: [PATCH 6/6] MIPS: ath79: simplify platform_get_resource_byname/devm_ioremap_resource
Message-Id: <52164F54.2070209@openwrt.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr> <1376902316-18520-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376902316-18520-7-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Ralf Baechle <ralf@linux-mips.org>, kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

2013.08.19. 10:51 keltez=E9ssel, Julia Lawall =EDrta:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Remove unneeded error handling on the result of a call to
> platform_get_resource_byname when the value is passed to devm_ioremap_res=
ource.
>=20
> A simplified version of the semantic patch that makes this change is as
> follows: (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @@
> expression pdev,res,e,e1;
> expression ret !=3D 0;
> identifier l;
> @@
>=20
>   res =3D platform_get_resource_byname(...);
> - if (res =3D NULL) { ... \(goto l;\|return ret;\) }
>   e =3D devm_ioremap_resource(e1, res);
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Gabor Juhos <juhosg@openwrt.org>

Thanks!

-Gabor
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
