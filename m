From: Simon Guinot <simon.guinot@sequanux.org>
Date: Fri, 10 Apr 2015 14:30:54 +0000
Subject: Re: [patch 2/2 v2] leds: netxbig: silence a static checker warning
Message-Id: <20150410143054.GH1509@kw.sim.vm.gnt>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="iQ6IArq7eFCrt6Lv"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150410002507.GF1509@kw.sim.vm.gnt>
 <20150410083040.GA2189@mwanda>
In-Reply-To: <20150410083040.GA2189@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>


--iQ6IArq7eFCrt6Lv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 11:30:41AM +0300, Dan Carpenter wrote:
> Static checkers complain that "timers[i].delay_on" is an unsigned long
> but we're writing to only 32 bits of it.  The code works on 32 bit
> systems and little endian 64 bit systems so it doesn't cause a problem
> in practise but it's still better to silence the warning.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Simon Guinot <simon.guinot@sequanux.org>

Note that your patch applies on the top of a patch "leds: netxbig: add=20
device tree binding" which has not been merged yet by Bryan. For now,
this patch only sits in the mvebu/for-next branch for testing purpose.
And it is still not clear to me in which tree the patch will go. That's
why I think you should resend your patch to the mvebu maintainers (added
in Cc) on the LAKML. Probably they will be interested in merging your
clean-up patch in the mvebu/for-next branch as well.

Regards,

Simon

> ---
> v2: use a temporary variable
>=20
> diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
> index 028686f2..6cb4537 100644
> --- a/drivers/leds/leds-netxbig.c
> +++ b/drivers/leds/leds-netxbig.c
> @@ -444,12 +444,17 @@ static int netxbig_leds_get_of_pdata(struct device =
*dev,
>  		if (!timers)
>  			return -ENOMEM;
>  		for (i =3D 0; i < num_timers; i++) {
> +			u32 delay_on =3D 0;
> +			u32 delay_off =3D 0;
> +
>  			of_property_read_u32_index(np, "timers", 3 * i,
>  						&timers[i].mode);
>  			of_property_read_u32_index(np, "timers", 3 * i + 1,
> -						(u32 *) &timers[i].delay_on);
> +						   &delay_on);
>  			of_property_read_u32_index(np, "timers", 3 * i + 2,
> -						(u32 *) &timers[i].delay_off);
> +						   &delay_off);
> +			timers[i].delay_on =3D delay_on;
> +			timers[i].delay_off =3D delay_off;
>  		}
>  		pdata->timer =3D timers;
>  		pdata->num_timer =3D num_timers;

--iQ6IArq7eFCrt6Lv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlUn3p4ACgkQgtp0PDeOcDrfjgCfSQu7BjWFXqwmM+ARmAn9ZzHl
udAAoIbp/kahxC2YsYv20ZBE9fqgDGq5
=d+Ok
-----END PGP SIGNATURE-----

--iQ6IArq7eFCrt6Lv--
