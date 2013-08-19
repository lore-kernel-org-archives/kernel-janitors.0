From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 Aug 2013 14:44:36 +0000
Subject: Re: [PATCH 4/6 v2] usb: musb: dsps: simplify platform_get_resource_byname/devm_ioremap_resource
Message-Id: <20130819144436.GI22811@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376902316-18520-5-git-send-email-Julia.Lawall@lip6.fr>
 <5211FED3.4090102@secomea.dk>
 <alpine.DEB.2.02.1308191346390.2313@hadrien>
 <52122BD1.2090406@cogentembedded.com>
In-Reply-To: <52122BD1.2090406@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Svenning =?iso-8859-1?Q?S=F8rensen?= <sss@secomea.dk>, Felipe Balbi <balbi@ti.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Aug 19, 2013 at 06:29:37PM +0400, Sergei Shtylyov wrote:
> Hello.
>=20
> On 08/19/2013 03:47 PM, Julia Lawall wrote:
>=20
> >From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> >Remove unneeded error handling on the result of a call to
> >platform_get_resource_byname when the value is passed to
> >devm_ioremap_resource.
>=20
> >A simplified version of the semantic patch that makes this change is as
> >follows: (http://coccinelle.lip6.fr/)
>=20
> >// <smpl>
> >@@
> >expression pdev,res,e,e1;
> >expression ret !=3D 0;
> >identifier l;
> >@@
> >
> >   res =3D platform_get_resource_byname(...);
> >- if (res =3D NULL) { ... \(goto l;\|return ret;\) }
> >   e =3D devm_ioremap_resource(e1, res);
> >// </smpl>
>=20
> >This patch also adjusts the error-handling code on the call to
> >devm_ioremap_resource to check the right value, noticed by Svenning S=F8=
rensen.
>=20
>    Saying "also" in the changelog is usuallly a good sign the patch
> should be split.
>=20
> >Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> >---
> >v2: Fixed the bug on the test of the result of devm_ioremap_resource
>=20
> >  drivers/usb/musb/musb_dsps.c |    7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> >diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
> >index 4ffbaac..e60be6f 100644
> >--- a/drivers/usb/musb/musb_dsps.c
> >+++ b/drivers/usb/musb/musb_dsps.c
> >@@ -357,12 +357,9 @@ static int dsps_musb_init(struct musb *musb)
> >  	u32 rev, val;
> >
> >  	r =3D platform_get_resource_byname(parent, IORESOURCE_MEM, "control");
> >-	if (!r)
> >-		return -EINVAL;
> >-
> >  	reg_base =3D devm_ioremap_resource(dev, r);
> >-	if (!musb->ctrl_base)
> >-		return -EINVAL;
> >+        if (IS_ERR(reg_base))
> >+		return PTR_ERR(reg_base);
>=20
>    This is indented with space, not tabs. And of course, this was a
> matter of a separate *fix* patch, while the original patch was a
> *cleanup*.
>=20

I would say this falls under the "trivial and closely related"
banner.  But I would prefer if the changelog said "Fixed a bug,
also made some cleanups."  Especially I wish the subject mentioned
the bugfix.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
