From: Bernd Petrovitsch <bernd@firmix.at>
Date: Sun, 25 Mar 2007 21:35:15 +0000
Subject: Re: [KJ] [PATCH] dvb: remove coding style comments on indentation
Message-Id: <1174858515.4015.13.camel@gimli.at.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4606E766.3090100@linuxtv.org>
In-Reply-To: <4606E766.3090100@linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sun, 2007-03-25 at 17:19 -0400, Michael Krufky wrote:
> Charles Cl=E9ment wrote:
> > Remove comments on setting indentation for emacs in bt8xx driver.
>=20
> What do we gain by this patch?  The "c-basic-offset: 8" helps us
> to enforce tabbing style.  Why would anybody want this removed?

I don't know.

Adding "c-indent-tabs-mode: t" is probably even better.

	Bernd
--=20
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
