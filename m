From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Jan 2017 07:42:06 +0000
Subject: Re: [patch] drm/vc4: fix a bounds check
Message-Id: <20170117074206.GB4051@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170113074900.GB30524@mwanda>
 <20170116234010.GA21894@engestrom.ch>
In-Reply-To: <20170116234010.GA21894@engestrom.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Eric Engestrom <eric@engestrom.ch>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On Mon, Jan 16, 2017 at 11:40:10PM +0000, Eric Engestrom wrote:
> > diff --git a/drivers/gpu/drm/vc4/vc4_render_cl.c b/drivers/gpu/drm/vc4/=
vc4_render_cl.c
> > index 08886a3..5cdd003 100644
> > --- a/drivers/gpu/drm/vc4/vc4_render_cl.c
> > +++ b/drivers/gpu/drm/vc4/vc4_render_cl.c
> > @@ -461,7 +461,7 @@ static int vc4_rcl_surface_setup(struct vc4_exec_in=
fo *exec,
> >  		}
> > =20
> >  		ret =3D vc4_full_res_bounds_check(exec, *obj, surf);
> > -		if (!ret)
> > +		if (ret)
> >  			return ret;
> > =20
> >  		return 0;
>=20
> This now boils down to `return=A0vc4_full_res_bounds_check(...);`, so you
> could get rid of the `ret` variable completely :)

I tried to leave it the original style which the author intended.
That's also my prefered style.  I like big chunky "return 0;".  I
actually found this bug by looking at places where people return a
variable where a literal would work:

	if (!ret)
		return ret;

It's ambiguos if they intended to return a negative, or if they
condition is reversed.  The other reason why I slightly prefer his style
is because people get so "clever" with the last condition in a function
and it drives me nuts.  They'll do a series of checks like this:

	if (fail)
		goto;
	if (fail)
		goto;
	if (fail)
		goto;
	if (success)
		return;
label:

We should be testing for failure generally, but this particular kind of
success check is like nails on a chalk board for me.  My younger self
is guilty of this cleverness as well....

Of course, the other way: "return vc4_full_res_bounds_check();" is
fine too.  It's not something that bothers me.  I guess I just would
do whatever the original author prefers.

regards,
dan carpenter
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
