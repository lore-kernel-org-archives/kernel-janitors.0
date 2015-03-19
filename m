From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Thu, 19 Mar 2015 21:42:43 +0000
Subject: Re: [E1000-devel] [patch] igb: cleanup igb_enable_mas() a bit
Message-Id: <1426801363.2577.62.camel@jtkirshe-mobl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-RolvbGK7BWUWQMvbx1/n"
List-Id: <kernel-janitors.vger.kernel.org>
References: <9B4A1B1917080E46B64F07F2989DADD6534E3B53@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <9B4A1B1917080E46B64F07F2989DADD6534E3B53@ORSMSX114.amr.corp.intel.com>
To: kernel-janitors@vger.kernel.org


--=-RolvbGK7BWUWQMvbx1/n
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-03-19 at 14:36 -0700, Fujinaka, Todd wrote:
> I'm looking into this and while the code fix is correct, I'm not sure
> the underlying code is correct.
>=20
> Unfortunately, the person who knows the most about this is out for
> spring break. Can we hold off on this patch?

Understood, I will hold off on pushing this patch upstream until I hear
from Carolyn or you.  I will keep it in my dev-queue branch so that
validation and other testing can be done on it in the meantime.

--=-RolvbGK7BWUWQMvbx1/n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJVC0LTAAoJEOVv75VaS+3O/mYQAKL5WhqxNx775CpK3Coewucv
HEjaXh9+OETIq2WKOUZeT5Jrf7HBMrAxpQk5qivgWWXKEY8JbkLYjKRTYkKBeiAt
3Bl6OOvhI4/EdslauXeHf5YtWPbG/rxA0X1rfufKZ08+YNtRMshx/Y6gIjohd/zl
xYGrBnNmXqb/cIRfc6jv58x/erNzEJN0NUtJ4ykRjSQCKtfMboyOZVCFZiVkDO01
k+B5AxRlHOTKfBiwbCspbtJThh/3kfkGtbByLLYtLI8C2HdnbuJylRnkX1v4DlpE
HVyLnP0c/CVhiJttpXHrNCmq+0zFNBBnzXNjoJKrLIZ5pZJK4cWCVxBGkVw0luzE
ZJ8SMt0S+FPgEPwVauiIbSR+kFNVlwhZ4S4jrYdFKACt/Oo4eMu5f+9FUzp7BudY
aMSNUu+to/ngeSACkFVV6rZxb42T5EljSZHGJotgfbg4HZ7Jg/GSg90d0x9LuEFt
cZDQe4Hf64s/ESVujToq6Fjs3KzHEgviTujh8bL7XDlyJu9MF7hguE5MFxih+dqw
4I1o+H2emmdnCZMgIHxrGtSqdFn9bpsunlJCUf7ZLbrjS5A0snRqrs/HgR6Cor5v
uwQo3tQzmT4YMQe+8UECyaz2qEqgtoAu5H4yXvKiL0OodL3v4tzbOCI0gZlDgiRl
gSaqRhwvoxp4PP9dBjMG
=ekVG
-----END PGP SIGNATURE-----

--=-RolvbGK7BWUWQMvbx1/n--

