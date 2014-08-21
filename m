From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 21 Aug 2014 12:13:55 +0000
Subject: Re: [PATCH 1/4] mfd: menelaus: fix error return code
Message-Id: <20140821121355.GG4266@lee--X1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407355938-10932-2-git-send-email-Julia.Lawall@lip6.fr>
 <20140821082605.GS4266@lee--X1>
 <alpine.DEB.2.10.1408210705250.2534@hadrien>
In-Reply-To: <alpine.DEB.2.10.1408210705250.2534@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 21 Aug 2014, Julia Lawall wrote:

> Convert a zero return value on error to a negative one, as returned
> elsewhere in the function.
>=20
> Additionally, converted 1 << 7 to BIT(7) at the suggestion of Lee Jones.
>=20
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> (
> if@p1 (\(ret < 0\|ret !=3D 0\))
>  { ... return ret; }
> |
> ret@p1 =3D 0
> )
> ... when !=3D ret =3D e1
>     when !=3D &ret
> *if(...)
> {
>   ... when !=3D ret =3D e2
>       when forall
>  return ret;
> }
>=20
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
> v2: Drop the name "val" and use BIT(7).

Thanks Julia.  Patch applied.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
