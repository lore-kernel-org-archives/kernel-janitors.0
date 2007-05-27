From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 27 May 2007 22:00:23 +0000
Subject: Re: [KJ] replacing old-style "non-seekable" errors with "no_llseek"
Message-Id: <200705280000.23973.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705271722580.13051@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705271722580.13051@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sunday 27 May 2007, Robert P. J. Day wrote:
> can be rewritten more cleanly using the no_llseek() helper routine,
> and just assigning no_llseek to the llseek member of the
> file_operations struct, as in:
>=20
> =A0 =A0 .llseek =3D no_llseek
>=20
> and deleting the old routine. =A0am i reading that correctly? =A0or is
> there more to it than that?
=20
Actually, that is outdated as well.

If the file descriptor cannot be seeked, you should set the open
operation to nonseekable_open, or call that function from the
driver's own open function.

	Arnd <><

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
