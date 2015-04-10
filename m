From: Simon Guinot <simon.guinot@sequanux.org>
Date: Fri, 10 Apr 2015 19:52:24 +0000
Subject: Re: [patch 2/2 v2] leds: netxbig: silence a static checker warning
Message-Id: <20150410195224.GJ1509@kw.sim.vm.gnt>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="c4f09764zL97bxnm"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150410083040.GA2189@mwanda>
 <5527DBBA.9060109@samsung.com>
 <20150410143056.GI16501@mwanda>
 <20150410144123.GI1509@kw.sim.vm.gnt>
 <20150410155034.GK16501@mwanda>
In-Reply-To: <20150410155034.GK16501@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org


--c4f09764zL97bxnm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 06:50:34PM +0300, Dan Carpenter wrote:
> I've looked at this some more.  Most of the places which call
> of_property_read_u32_index() check the return code.  The ones that don't
> mostly initialize their values going in.  The remainder introduce static
> checker warnings like:
>=20
> 	drivers/clk/ti/divider.c:472 ti_clk_get_div_table()
> 	error: potentially using uninitialized 'val'.
>=20
> These warnings cause me pain.  It calls of_get_property() earlier so
> it won't return -EINVAL.  I don't know if it can return -ENODATA or
> -EOVERFLOW?
>=20
> I guess not.

I think it can't. Above, we are calling of_property_count_u32_elems() to
count the number of u32 elements in the "timers" property. After we are
ensuring that there is three u32 elements available per timer. That's
why the return codes for the three of_property_read_u32_index() calls
are not checked.

Regards,

Simon

>=20
> Honestly, I hate ambigous code like this.  If it were just a clear bug
> then I could fix it but I invest more time in ambiguous code and end
> up not writing a patch.
>=20
> regards,
> dan carpenter

--c4f09764zL97bxnm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlUoKfgACgkQgtp0PDeOcDqzjACgiwlZRMcj9cnsPdI7LD4XxfVl
aYUAniqdv/+S/0R9hNI/ez83KVbyvjIM
=Unc3
-----END PGP SIGNATURE-----

--c4f09764zL97bxnm--
