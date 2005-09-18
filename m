From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 18 Sep 2005 07:24:49 +0000
Subject: Re: [KJ] Holding off patches 6 - 20 for a bit
Message-Id: <200509180924.50739.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <E80C9DA8-1015-42E3-8B4F-7A9D140B36D2@gmail.com>
In-Reply-To: <E80C9DA8-1015-42E3-8B4F-7A9D140B36D2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On S=FCnndag 18 September 2005 05:38, Jesse Millan wrote:

> Here is the description link and summary:
>=20
> For modules which display their version as a string somewhere via
> printk, the preferred mechanism is:
>=20
> #define DRV_VERSION "1.0.0"
> MODULE_VERSION(DRV_VERSION);"
>=20
Yes, that one makes perfect sense. Note however the part about
'which display their version'. These would be modules that
use the same information in multiple places, or even have a
#define already for the version number, but do not have the
MODULE_VERSION();. What Matt did was just adding the MODULE_VERSION
call, not change it to use a new macro.

	Arnd <><
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
