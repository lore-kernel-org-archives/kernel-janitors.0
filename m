From: Tilman Schmidt <tilman@imap.cc>
Date: Mon, 20 Mar 2006 19:40:49 +0000
Subject: Re: [KJ] [PATCH] usb.h: reduce syslog clutter
Message-Id: <441F0541.60008@imap.cc>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95269038103458836=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <441C6536.2060800@imap.cc>
In-Reply-To: <441C6536.2060800@imap.cc>
To: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============95269038103458836==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig34214AB1C9C47E03492304C3"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig34214AB1C9C47E03492304C3
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Arnd Bergmann wrote:

> On Saturday 18 March 2006 20:53, Tilman Schmidt wrote:
>> +#if defined(CONFIG_MODULES) && defined(THIS_MODULE)
>> +#define KMSG_LOCATION_PREFIX THIS_MODULE ? THIS_MODULE->name : __FILE=
__
>> +#else
>> +#define KMSG_LOCATION_PREFIX __FILE__
>> +#endif
>> +
>=20
> Shouldn't this simply use KBUILD_MODNAME?

Thanks for the hint. I didn't know this expands to __FILE__ when not
compiling for a module. That's perfect!

A small drawback is that, according to scripts/Makefile.lib:

"It's possible that one object gets potentially linked into more
 than one module. In that case KBUILD_MODNAME will be set to foo_bar,
 where foo and bar are the name of the modules."

But I assume that's so rare it wouldn't warrant the more complicated
solution I proposed.

Second take of patch follows.

--=20
Tilman Schmidt                          E-Mail: tilman@imap.cc
Bonn, Germany
Diese Nachricht besteht zu 100% aus wiederverwerteten Bits.
Unge=F6ffnet mindestens haltbar bis: (siehe R=FCckseite)


--------------enig34214AB1C9C47E03492304C3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3rc1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEHwVJMdB4Whm86/kRAsUOAJ9zGI6NYmXry/YQi44792/yD/QJ9wCdHuwO
/bFwavYjeL0kbm/U/A7wUgg=
=iPot
-----END PGP SIGNATURE-----

--------------enig34214AB1C9C47E03492304C3--

--===============95269038103458836==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95269038103458836==--
