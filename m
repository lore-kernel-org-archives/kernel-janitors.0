From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Mar 2015 18:41:04 +0000
Subject: Re: [patch] regulator: core: remove some unneeded conditions
Message-Id: <20150303184104.GD21293@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="eL/3bkOpB8q3g/mM"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150226204046.GE6820@mwanda>
In-Reply-To: <20150226204046.GE6820@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--eL/3bkOpB8q3g/mM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2015 at 11:40:46PM +0300, Dan Carpenter wrote:
> These always true or always false conditions cause static checker
> warnings.
>=20
> The check prior to checking "if (pin->enable_count <=3D 1) {" is
> "if (pin->enable_count > 1) ", so we know that ->enable_count is <=3D 1
> already and can delete the check.

> The queue_delayed_work() function is type bool so the return value can
> never be less than zero.

Please don't submit multiple changes in a single patch, it makes it much
harder to review things and means that problems with one part of the
change block other bits.  Especially the second bit here looks wrong as
is...

> @@ -2158,13 +2155,10 @@ int regulator_disable_deferred(struct regulator *=
regulator, int ms)
>  	rdev->deferred_disables++;
>  	mutex_unlock(&rdev->mutex);
> =20
> -	ret =3D queue_delayed_work(system_power_efficient_wq,
> -				 &rdev->disable_work,
> -				 msecs_to_jiffies(ms));
> -	if (ret < 0)
> -		return ret;
> -	else
> -		return 0;
> +	queue_delayed_work(system_power_efficient_wq,
> +			   &rdev->disable_work,
> +			   msecs_to_jiffies(ms));
> +	return 0;

This doesn't look right - it looks like someone changed the return type
at some point and failed to update all the callers.  Presumbly the
return value means something (though a quick grep suggests the change is
correct as the value says if the work was already queued).  It does mean
that the changelog needs revision though, the point isn't that the
return value can't be less than zero it's that the function can't fail.

--eL/3bkOpB8q3g/mM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU9gA/AAoJECTWi3JdVIfQJBQH/jk1UplmJWKVmNMDJBj+guEo
r+QmVR4PfkpbqKCV12qheE8GzyWyUpo53ays/W322ThnhuU6nz0ypnyQrwfyzatg
C/Vxiea4igcHQV2/NuKoVOfcQYkKTJ72c6nRxj58k1a19WLsgSwomGXU8S5NVSb8
vkmPqWCne+d563wyQX5m1Nkol0xatb6r09D03Qir9HDHQ6GNSmXHWdkE6nHuyqXz
Ifxv/1pMHDsjsfirRaJxzrjvB+n0ZP36ryxt0xCgI700Jhol9qu9C7BCnE14lBZp
2H38LJY05JQAeuHtOxppqqdoFfLJkdWPQtaqIDODn7+7ywWWLDjciM7L1913owA=
=A8lf
-----END PGP SIGNATURE-----

--eL/3bkOpB8q3g/mM--
