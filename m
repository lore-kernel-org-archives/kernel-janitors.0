From: "Zhen, Liang" <liang.zhen@intel.com>
Date: Mon, 06 Apr 2015 06:41:46 +0000
Subject: Re: [HPDD-discuss] [PATCH 15/16] staging: lustre: lnet: lnet: fix error return code
Message-Id: <D1482EB4.2B614%liang.zhen@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
 <1428235596-4757-16-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428235596-4757-16-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>, "Drokin, Oleg" <oleg.drokin@intel.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>

Julia, yes this is a bug that we have already fixed in the latest Lustre.
Sorry we haven=B9t submitted this patch to kernel on time.

Thanks
Liang

On 4/5/15, 8:06 PM, "Julia Lawall" <Julia.Lawall@lip6.fr> wrote:

>Return a negative error code on failure.
>
>A simplified version of the semantic match that finds this problem is as
>follows: (http://coccinelle.lip6.fr/)
>
>// <smpl>
>@@
>identifier ret; expression e1,e2;
>@@
>(
>if (\(ret < 0\|ret !=3D 0\))
> { ... return ret; }
>|
>ret =3D 0
>)
>... when !=3D ret =3D e1
>    when !=3D &ret
>*if(...)
>{
>  ... when !=3D ret =3D e2
>      when forall
> return ret;
>}
>// </smpl>
>
>Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
>---
> drivers/staging/lustre/lnet/lnet/api-ni.c |    8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/staging/lustre/lnet/lnet/api-ni.c
>b/drivers/staging/lustre/lnet/lnet/api-ni.c
>index faceb95..4a14e51 100644
>--- a/drivers/staging/lustre/lnet/lnet/api-ni.c
>+++ b/drivers/staging/lustre/lnet/lnet/api-ni.c
>@@ -650,15 +650,19 @@ lnet_prepare(lnet_pid_t requested_pid)
>=20
> 	recs =3D lnet_res_containers_create(LNET_COOKIE_TYPE_ME, LNET_FL_MAX_MES,
> 					  sizeof(lnet_me_t));
>-	if (recs =3D NULL)
>+	if (recs =3D NULL) {
>+		rc =3D -ENOMEM;
> 		goto failed;
>+	}
>=20
> 	the_lnet.ln_me_containers =3D recs;
>=20
> 	recs =3D lnet_res_containers_create(LNET_COOKIE_TYPE_MD, LNET_FL_MAX_MDS,
> 					  sizeof(lnet_libmd_t));
>-	if (recs =3D NULL)
>+	if (recs =3D NULL) {
>+		rc =3D -ENOMEM;
> 		goto failed;
>+	}
>=20
> 	the_lnet.ln_md_containers =3D recs;
>=20
>
>_______________________________________________
>HPDD-discuss mailing list
>HPDD-discuss@lists.01.org
>https://lists.01.org/mailman/listinfo/hpdd-discuss

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
