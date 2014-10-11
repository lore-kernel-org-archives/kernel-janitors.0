From: Wolfram Sang <wsa@the-dreams.de>
Date: Sat, 11 Oct 2014 16:56:51 +0000
Subject: Re: [RFC] drop owner assignment from platform_drivers
Message-Id: <20141011165650.GA1263@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="UugvWAfsgieZRqgk"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141010072439.GA1741@katana>
 <20141010083627.GL5182@n2100.arm.linux.org.uk>
 <20141010182604.GC6075@katana> <2769473.KEN6DZKnT7@wuerfel>
In-Reply-To: <2769473.KEN6DZKnT7@wuerfel>
To: cocci@systeme.lip6.fr


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > You got me wondering, though, that it could not be correct to call
> > platform_driver_register() from the platform core instead of module
> > init. I will check tomorrow. Still, this would be a bug independent of
> > my series. Although I'd need to respin it if platform_driver_probe()
> > needed a fix.
>=20
> Right, this seems to be a preexisting bug. platform_create_bundle=20
> and platform_driver_probe will both overwrite the .owner field with
> NULL since they live in builtin code. They need to be replaced with
> __platform_driver_probe and __platform_driver_register that both
> take an extra owner argument passed down from the caller in the driver
> module.

Yeah, that would be one solution. However, my personal favourite would
meanwhile be to revert the commit that Russell mentioned. I think it is
cleaner to have the owner explicitly set in the module rather than
hidden away by a function call. However, grepping through include/linux,
there are a few subsystems hiding it this way. So, it is a pattern
somewhow. Oh well...


--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUOWFSAAoJEBQN5MwUoCm2IV4P/1/T7/al/mRkkfrCYJXRb397
ps9F2cIDLErQrufQmbVew+xa16TOyN2UhXJKoos+y5UwNJPYmq42jVR03KRzycnm
h988LwKR7uOZnNEhDHtphcslWECG4PRdIIrpBR9IypEiLAPizQoBxvves56a7Myb
0ZkMccujb0aNVNSJ6wNCj8ZsKHmNBqNjiDhn7hdGr0B4RTISn6W5EyCHfa0YO0pJ
QUrsR9wv2dz3JMSX8sWADbCYkRSAlY5+mE5a7DSbwoy+OhNwP4WLwJ/VaXHQ+yt9
PulEwZp+d/CapSzkvWI4ONwqHSTdjitu6jW+t9/PTaUfMtWUoSYJU8dg3PHjRE2x
dYThXwaxvblgQ3MYP72082Pl1unbvowMVn/TALONRpVaoeaYsr5JsbBk3JGowwLB
p5icHEzwhwmWSUIicY4WZw0B4XSD/nZg/rS4tPhLBWO9Ha0nvZ+kWdZKSDkRZxZ9
uFX3znbqVuCuHM7MdDBMJhG3YLaIdZv5Z5p8Av+l0W7orvu7SANmJeSu5EJTiLRv
7qdBAWN9bE9aG9ZmYnL7UFpP5IMYG5wVG9cwNFhbCAGD1erpbrId9j/Ep+FL4HAh
aop1NOFwiNvSBoxep8tVJnONYo9N6+4M5HnG3aahtPcks6j4gjnfwWJCuwA2Z/Ee
autGMIb45Rf1doP3zy/N
=J6zd
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
