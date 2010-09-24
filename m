From: Matthew Dharm <mdharm-kernel@one-eyed-alien.net>
Date: Fri, 24 Sep 2010 20:02:18 +0000
Subject: Re: [usb-storage] [PATCH 23/24] usb: change to new flag variable
Message-Id: <20100924200218.GC25677@one-eyed-alien.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="sXc4Kmr5FA7axrvy"
List-Id: <kernel-janitors.vger.kernel.org>
References: <e0bdab5d2e8c52041c003de68ba774c3e706716c.1285355033.git.mfm@muteddisk.com> <1dd0f4a1709a9b139fe87f2b311cc0d129900b3f.1285355033.git.mfm@muteddisk.com>
In-Reply-To: <1dd0f4a1709a9b139fe87f2b311cc0d129900b3f.1285355033.git.mfm@muteddisk.com>
To: matt mooney <mfm@muteddisk.com>
Cc: kernel-janitors@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, usb-storage@lists.one-eyed-alien.net, Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Felipe Balbi <felipe.balbi@nokia.com>, David Vrabel <david.vrabel@csr.com>


--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 24, 2010 at 12:17:33PM -0700, matt mooney wrote:
> Replace EXTRA_CFLAGS with ccflags-y.

> diff --git a/drivers/usb/storage/Makefile b/drivers/usb/storage/Makefile
> index ef7e5a8..786f086 100644
> --- a/drivers/usb/storage/Makefile
> +++ b/drivers/usb/storage/Makefile
> @@ -5,7 +5,7 @@
>  # Rewritten to use lists instead of if-statements.
>  #
> =20
> -EXTRA_CFLAGS	:=3D -Idrivers/scsi
> +ccflags-y	:=3D -Idrivers/scsi
> =20
>  obj-$(CONFIG_USB_STORAGE)	+=3D usb-storage.o

I don't really know anything about the new 'ccflags' stuff.. but my
instincts tell me that perhaps that should be
'ccflags-$(CONFIG_USB_STORAGE)' rather than 'ccflags-y'?

Does it make a difference that usb-storage can be built-in or a loadable
module?

Matt

--=20
Matthew Dharm                              Home: mdharm-usb@one-eyed-alien.=
net=20
Maintainer, Linux USB Mass Storage Driver

I could always suspend a few hundred accounts and watch what happens.
					-- Tanya
User Friendly, 7/31/1998

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFMnQPK3gL8qCooyc4RAutEAJwKJwF9rYQgMV9n/9hv478yL1gYjgCfceWP
CRpzlah2PM6WobDhRG0AAxY=
=75Hx
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--
