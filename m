From: Sebastian Reichel <sre@kernel.org>
Date: Wed, 15 Mar 2017 17:43:38 +0000
Subject: Re: [PATCH] rtc: cpcap: kfreeing devm allocated memory
Message-Id: <20170315174337.4osgmj2reiw7v6pe@earth>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="t4xzvzp5f235vgrw"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170314075319.GB6111@mwanda>
In-Reply-To: <20170314075319.GB6111@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, rtc-linux@googlegroups.com, kernel-janitors@vger.kernel.org


--t4xzvzp5f235vgrw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 14, 2017 at 10:56:30AM +0300, Dan Carpenter wrote:
> We shouldn't kfree(rtc) because is devm_ managed memory.  It leads to a
> double free.
>=20
> Fixes: dd3bf50b35e3 ("rtc: cpcap: new rtc driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
> index 7c6a3c3167bd..5d163be98e9f 100644
> --- a/drivers/rtc/rtc-cpcap.c
> +++ b/drivers/rtc/rtc-cpcap.c
> @@ -266,10 +266,8 @@ static int cpcap_rtc_probe(struct platform_device *p=
dev)
>  	rtc->rtc_dev =3D devm_rtc_device_register(dev, "cpcap_rtc",
>  						&cpcap_rtc_ops, THIS_MODULE);
> =20
> -	if (IS_ERR(rtc->rtc_dev)) {
> -		kfree(rtc);
> +	if (IS_ERR(rtc->rtc_dev))
>  		return PTR_ERR(rtc->rtc_dev);
> -	}
> =20
>  	err =3D cpcap_get_vendor(dev, rtc->regmap, &rtc->vendor);
>  	if (err)

Acked-By: Sebastian Reichel <sre@kernel.org>

-- Sebastian

--t4xzvzp5f235vgrw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAljJfUcACgkQ2O7X88g7
+poVmRAAowLrctzOvgnR6mmMXs+9u4PNtSF7QsGkY8/ql3It7q1FP5B8KLZ3g48L
0Y7gRqZiIYWvEmcSdHjFZjy+cSp8AcVFuJYZwf4/MvAk4ZBFuISmt0TAGZyOH89J
MQNaDJZZd0BisWVXLNKKMXfO/loN8nzhwvobeTtT3sbCZJ+HfvSNIfva9p2tlqTk
dAA7RcY5Y9XlKHSNVJmiAk0lcGch201ap2Gstz2m266H8WUdlbzBQoL/VMAc0aij
YLozLIhAoc0LzW21kgnah5kZR4F5knS57I/AsmeloSm2lFq4cjGbU/0ecTmo2XAX
KJg3JnWlf53hwWuNZrlLMoYULkrqtlF5YbK8bATgn8UrURVtmfrmWzxEELznjcyu
tkMlskrrLEWP/bYmPTp8lmbMYzkxk3RAe6f+IGeP29h5//E2vaIGtMJvlM1QCweC
4CGA0/uJrFqFLOM0Qq6c2RXsO6kBTIC0eF0p8VCei4vub5jZgbTsM10+5IGIwJxU
sZDEXqbAoPIxNQUNFBHy/AR3aFAx7PJwjbsS9xZ0KWAJl4mo61Ad+sWg+mimaQPU
MA/4wxOdqIlTpbVHQQGWMQgSLjROGrBIHtsTx2RmqpYfK0h7i3XV7cVtsRGI3Ty4
xcyp9jgfCO1C6Kr9KmLRgXu6lPXNvuSBkQnMFyZ0WrnBSh4Md1E=
=tbsb
-----END PGP SIGNATURE-----

--t4xzvzp5f235vgrw--
