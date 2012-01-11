From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jan 2012 11:56:23 +0000
Subject: Re: [PATCH 15/16] Staging: quickstart: Add QS_INFO and QS_ERR macros for logs
Message-Id: <20120111115622.GN3644@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="N/GrjenRD+RJfyz+"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326147815-11451-16-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326147815-11451-16-git-send-email-szymon@janc.net.pl>
To: kernel-janitors@vger.kernel.org


--N/GrjenRD+RJfyz+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 09, 2012 at 11:23:34PM +0100, Szymon Janc wrote:
> Signed-off-by: Szymon Janc <szymon@janc.net.pl>
> ---
>  drivers/staging/quickstart/quickstart.c |   17 +++++++++--------
>  1 files changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/qu=
ickstart/quickstart.c
> index 51a6d0c..c757ef6 100644
> --- a/drivers/staging/quickstart/quickstart.c
> +++ b/drivers/staging/quickstart/quickstart.c
> @@ -44,6 +44,9 @@ MODULE_LICENSE("GPL");
>  #define QUICKSTART_PF_DRIVER_NAME	"quickstart"
>  #define QUICKSTART_PF_DEVICE_NAME	"quickstart"
> =20
> +#define QS_INFO(fmt, arg...)	printk(KERN_INFO "quickstart: " fmt "\n", #=
#arg)
> +#define QS_ERR(fmt, arg...)	printk(KERN_ERR "quickstart: " fmt "\n", ##a=
rg)
> +

No.  Don't do this.  You can do same thing with pr_err() so you
don't need to create your own macros.  Just add this to the front:

#define pr_fmt(fmt) "quickstart: " fmt

We already have a million standard ways of printing stuff, we don't
need a million and two.

regards,
dan carpenter

--N/GrjenRD+RJfyz+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPDXjmAAoJEOnZkXI/YHqR7EAP/RvXwftzi59HjrgfDXZ+XKm/
A0QBiW9wozrBJn5U2b/lk+HLmZvY7E7ucnPGksRFctgPOPJEhJof4ZKt9LIPHZs+
UJcc0jTTLP5wk7KI3EWwV3vzxPhVmM1ZL77Thg/EAk6iqw4ME4iX4v4marQf78JH
ABN6wqt9ZjlXf6s37E+h2sZ2Ubu0tTilSZoRGpAVNJY4WG2TE2g8HRP6Df3X8EOZ
fLQzlE2B/Mv3DXahQ6X8xA7OhLiWM9DEQ4McmFFGFtkih2AAytURqMO/Cx1VR5IG
eLIhqjfZ5oIxrH60ywIhtUAZuNGbmRG8o1tZAVEXV1atNxZXGf2bFqnNcfvEUzVV
MJa/sYKen0vkIz5/O3bd2qKqb+/aV3FECxxmhodCdpS/VMZH8gPAXQBnVFOisJfO
disH2kn936oRDPsAp/DEaT8crv5CQaqZc/IR1e0cbIl2vmEAqI7DUGzisJCc0mlh
aIi6H4zqbr6kVYAreyd91XO/GOF0YNODA0BOiXsBYv1dNCQ+mPNjz/3SwFra5bFR
WOwFoPXyw01WqWHpTiMbGMBQjK0bTIXNqBfZV1ZOG/kR/DQLF5+rE3iXcu+u/oZ9
a9XnssqklOv+cAGK/1ia/A5tnjrjLtdOlJccuGzJhYrkY+HYEC9AHWaxXczhueM8
idRQ/37UENGwJP5WtPps
=E94L
-----END PGP SIGNATURE-----

--N/GrjenRD+RJfyz+--
