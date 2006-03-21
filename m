From: Tilman Schmidt <tilman@imap.cc>
Date: Tue, 21 Mar 2006 00:56:37 +0000
Subject: [KJ] Re: [PATCH] usb.h: reduce syslog clutter
Message-Id: <441F4F45.4000801@imap.cc>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73525597704872703=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060320194109.GA16890@suse.de>
In-Reply-To: <20060320194109.GA16890@suse.de>
To: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============73525597704872703==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig71F7221BB48C8AACE29CCBD8"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig71F7221BB48C8AACE29CCBD8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 20.03.2006 21:39, Greg KH wrote:
> On Mon, Mar 20, 2006 at 09:00:11PM +0100, Tilman Schmidt wrote:
>=20
>>On 20.03.2006 20:41, Greg KH wrote:
>>
>>
>>>On Sat, Mar 18, 2006 at 08:53:26PM +0100, Tilman Schmidt wrote:
>>>
>>>
>>>>The current versions of the err() / info() / warn() message macros in=

>>>>include/linux/usb.h insert __FILE__ at the beginning of the message.
>>>>[...]
>>>>The following patch modifies these macros so that, when used in a
>>>>module, they'll insert the module name instead, which is significantl=
y
>>>>shorter and also tends to be more useful to users (as opposed to kern=
el
>>>>developers) trying to make sense of a particular message.
>>>>
>>>>It also adds a macro for the "notice" message level which was missing=

>>>>so far.
>>>
>>>[...]
>>>What was wrong with my suggestion that we simply delete these macros a=
nd
>>>convert the USB code over to using the proper dev_info(), dev_warn(),
>>>dev_err(), and dev_notice() macros instead?
>>
>>Just that, as you remarked yourself:
>>
>>
>>>[T]here are a few places in the USB code that do
>>>not have a valid device and so they can't be dropped entirely.
>>
>>and I still don't see how to handle that situation with the dev_ macros=
=2E
>>
>>But I thought you said you would accept that patch if I submitted it
>>through the kernel-janitors. Why the change of mind?
>=20
> No, I think you misunderstood me.  I said that converting the USB code
> over to using the proper dev_* macros would be a good janitor's project=
,
> not that you need to submit this patch through them.
>=20
> There are only a very few places that these macros can not be used, and=

> only after converting everything that can possibly be changed, then we
> can see if these are still really needed or not.

Greg, as you may remember, Hansj=F6rg and I are trying to submit an
existing, working driver for inclusion in the main kernel tree. That
driver does have quite a few places where it must emit a message without
reliably having access to a valid device structure. The janitors can't
convert that for us because it is not part of the tree yet; it can't
become part of the tree because it uses those macros you say shouldn't
be propagated any further; I can't convert it myself because I don't
know how, and when I ask you you only tell me not to worry. Catch-22.

What harm does it do to fix those macros now when they are needed in
existing code, even if they might disappear sometime in kernel 2.6.21 or
so? Does it justify blocking the inclusion of a driver in the tree?
Fourteen months ago you told me there were no valid reasons for not
including a USB driver in the main kernel tree. Have we hit upon such a
reason after all?

Regards
Tilman

--=20
Tilman Schmidt                          E-Mail: tilman@imap.cc
Bonn, Germany
Diese Nachricht besteht zu 100% aus wiederverwerteten Bits.
Unge=F6ffnet mindestens haltbar bis: (siehe R=FCckseite)


--------------enig71F7221BB48C8AACE29CCBD8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3rc1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEH09VMdB4Whm86/kRAhv2AJ405tWKQx5sWYrUEmdKB9FWn5vzGACfftZy
jwuMiYJuboPA7Nqb7oRBA+w=
=fEbZ
-----END PGP SIGNATURE-----

--------------enig71F7221BB48C8AACE29CCBD8--

--===============73525597704872703==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73525597704872703==--
