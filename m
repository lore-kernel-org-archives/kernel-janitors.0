From: NeilBrown <neilb@suse.de>
Date: Thu, 19 Jul 2012 10:50:45 +0000
Subject: Re: [md:for-next 9/27] ERROR: "blk_check_plugged" [drivers/md/raid456.ko] undefined!
Message-Id: <20120719205045.7543e032@notabene.brown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Sig_/wejWS8hEoXtRA=TUBaJ0ED."
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120719094741.GA13848@localhost>
In-Reply-To: <20120719094741.GA13848@localhost>
To: kernel-janitors@vger.kernel.org

--Sig_/wejWS8hEoXtRA=TUBaJ0ED.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Jul 2012 17:47:41 +0800 Fengguang Wu <fengguang.wu@intel.com>
wrote:

> Hi NeilBrown,
>=20
> Kernel build failed on
>=20
> tree:   git://neil.brown.name/md for-next
> head:   6db16051b04957b8e7e60c21b43e4b54ed927b46
> commit: b774e8d8414b3e25fcd9c96febb522519b17dbd6 [9/27] blk: centralize n=
on-request unplug handling.
> config: i386-randconfig-k003 (attached as .config)
>=20
> All related error/warning messages:
>=20
> ERROR: "blk_check_plugged" [drivers/md/raid456.ko] undefined!
>=20
> (forgot to export the symbol)

Thanks.  Fixed.

NeilBrown

--Sig_/wejWS8hEoXtRA=TUBaJ0ED.
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQIVAwUBUAfmhjnsnt1WYoG5AQIT7A/+L39lEb2xP7VPXyhrM7+ziXQiabtMwfaL
dPXEqsyELRJ1f0fXiiuO6Sz7IyDFK6ru19/UFjP5by4vVvhgyiucB7wbtj7RvI78
gjo3LxZR6c4u0fFgFDnVwgVsOjXMMblc8FelywwSawapj18RrmyUU/eTbwt1G24+
zpE6r4VCVqFREEnetch62xS4oLXDMvsq0jToEQGRqYCJOExJB6w+d2ayHwm7/dPG
hsYtADN9ILS7KcAJ0LW0OMzPujNXKrqb5thEZF+IHzNsZxU/FfsLtz+dMlbI/HSx
ObczXzwN5QYA0GDX1fCokbRy3srdg0ZDeZcex6+DlxFH92R4Ab8aIiWYdnKkTbRO
tqrWDgPD9xR0CYLnHArjPiauBI6Y4Tl8LpOp4OJDGLBkGuzmXTqOatJX252Z4Ddx
ut6LwCTIE3whkRQYQjb4Vphze7UQt6Ka+muFv8AgiqLjj1iYI20vvUcx9mXwA/SG
ECSVDSelChanqXu1xAJMB6XDaklyUN2SAZ9mYHnroRNqCN13QWdsl299gQs/AfxH
b1eLKuOTWyUiC8q5QAImjNc6jvCsDa2s7va7g7B2MxVQ04Gxf6D7RurF8tTtK9rm
tUn/PCv99THMo8V7aV4DBZ0KkpLBK8pgk/7vV1CtcNPYUc+zFEMSCsFBz4fzMZWF
q/Br12DRhiQ=
=GP1U
-----END PGP SIGNATURE-----

--Sig_/wejWS8hEoXtRA=TUBaJ0ED.--
