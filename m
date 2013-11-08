From: Pawel Moll <pawel.moll@arm.com>
Date: Fri, 08 Nov 2013 12:44:01 +0000
Subject: Re: [patch] clk: vexpress: NULL dereference on error path
Message-Id: <1383914641.3226.1.camel@hornet>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131107080844.GR21844@elgon.mountain>
 <1383914574.3226.0.camel@hornet>
In-Reply-To: <1383914574.3226.0.camel@hornet>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Fri, 2013-11-08 at 12:42 +0000, Pawel Moll wrote:
> On Thu, 2013-11-07 at 08:08 +0000, Dan Carpenter wrote:
> > If the allocation fails then we dereference the NULL in the error path.
> > Just return directly.
> >=20
> > Fixes: ed27ff1db869 ('clk: Versatile Express clock generators ("osc") d=
river')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >=20
> > diff --git a/drivers/clk/versatile/clk-vexpress-osc.c b/drivers/clk/ver=
satile/clk-vexpress-osc.c
> > index 2dc8b41..a535c7b 100644
> > --- a/drivers/clk/versatile/clk-vexpress-osc.c
> > +++ b/drivers/clk/versatile/clk-vexpress-osc.c
> > @@ -102,7 +102,7 @@ void __init vexpress_osc_of_setup(struct device_nod=
e *node)
> > =20
> >  	osc =3D kzalloc(sizeof(*osc), GFP_KERNEL);
> >  	if (!osc)
> > -		goto error;
> > +		return;
> > =20
> >  	osc->func =3D vexpress_config_func_get_by_node(node);
> >  	if (!osc->func) {
>=20
> Well spotted, thanks!
>=20
> Will get it queued with other vexpress clk changes.

Having said that - Mike, it's a bug fix. If you can still get it into
the current merge window, please do:

Acked-by: Pawel Moll <pawel.moll@arm.com>

Pawe=C5=82


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
