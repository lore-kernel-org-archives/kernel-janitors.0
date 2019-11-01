From: Stefan Hajnoczi <stefanha@redhat.com>
Date: Fri, 01 Nov 2019 08:08:36 +0000
Subject: Re: [PATCH] vsock: Simplify '__vsock_release()'
Message-Id: <20191101080836.GA4888@stefanha-x1.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="tKW2IUtsqtDRztdT"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191031064741.4567-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191031064741.4567-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: davem@davemloft.net, sunilmut@microsoft.com, willemb@google.com, sgarzare@redhat.com, ytht.net@gmail.com, arnd@arndb.de, tglx@linutronix.de, decui@microsoft.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2019 at 07:47:41AM +0100, Christophe JAILLET wrote:
> Use '__skb_queue_purge()' instead of re-implementing it.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  net/vmw_vsock/af_vsock.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Modulo the comment about double-underscore:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl276AIACgkQnKSrs4Gr
c8hfmgf+INURpFV1u1GE48Cf2ihsC6QhHVe3MTzVVV3eQztp78fDvWBPuRqFZP7U
HjbZNkqJ92U4xAhO9Z+biLTYUKeLb1IIueXXUgZsrELr3zfdAL9fybIGln7c42Nx
yJvwDFHAbgT1fFlnoaYE22ZUeALajF/AiBdIjwoqWmRYN2iYDHjzZzncuoaEVjuN
RueUQUVdjdCLcIbAaLf460N2ksM511vXRJ8BjTSkQL6154steJgibuT2PwluMNhp
FKEIavD0NT/tjZRuS7IkmXl+ZTENDEPuUeRaRsxk9KXhG1/MlcyHGVhgdDvk5irL
BG3X708iLUI2gdg+CkotgwzgFMiT4A==
=C+k4
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
