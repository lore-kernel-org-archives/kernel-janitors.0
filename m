From: Tilman Schmidt <tilman@imap.cc>
Date: Mon, 20 Mar 2006 20:00:11 +0000
Subject: [KJ] Re: [PATCH] usb.h: reduce syslog clutter
Message-Id: <441F09CB.9080209@imap.cc>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75309124936614458=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060320194109.GA16890@suse.de>
In-Reply-To: <20060320194109.GA16890@suse.de>
To: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============75309124936614458==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig1D9E290EBDCACA039E2DCDB4"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig1D9E290EBDCACA039E2DCDB4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 20.03.2006 20:41, Greg KH wrote:

> On Sat, Mar 18, 2006 at 08:53:26PM +0100, Tilman Schmidt wrote:
>=20
>>The current versions of the err() / info() / warn() message macros in
>>include/linux/usb.h insert __FILE__ at the beginning of the message.
>>[...]
>>The following patch modifies these macros so that, when used in a
>>module, they'll insert the module name instead, which is significantly
>>shorter and also tends to be more useful to users (as opposed to kernel=

>>developers) trying to make sense of a particular message.
>>
>>It also adds a macro for the "notice" message level which was missing
>>so far.
>[...]
> What was wrong with my suggestion that we simply delete these macros an=
d
> convert the USB code over to using the proper dev_info(), dev_warn(),
> dev_err(), and dev_notice() macros instead?

Just that, as you remarked yourself:

> [T]here are a few places in the USB code that do
> not have a valid device and so they can't be dropped entirely.

and I still don't see how to handle that situation with the dev_ macros.

But I thought you said you would accept that patch if I submitted it
through the kernel-janitors. Why the change of mind?

--=20
Tilman Schmidt                          E-Mail: tilman@imap.cc
Bonn, Germany
Diese Nachricht besteht zu 100% aus wiederverwerteten Bits.
Unge=F6ffnet mindestens haltbar bis: (siehe R=FCckseite)


--------------enig1D9E290EBDCACA039E2DCDB4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3rc1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEHwnLMdB4Whm86/kRAtsAAJ0bYZItFeWGoAWdpdkKCVzOsvQ92ACfRV92
zHFj47qYn79WMK4/H+D78YE=
=DMpC
-----END PGP SIGNATURE-----

--------------enig1D9E290EBDCACA039E2DCDB4--

--===============75309124936614458==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75309124936614458==--
