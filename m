From: Aleksa Sarai <cyphar@cyphar.com>
Date: Thu, 16 Jan 2020 15:09:28 +0000
Subject: Re: [PATCH] selftests: fix spelling mistaked "chaigned" -> "chained"
Message-Id: <20200116150928.jimqz3gjppoirokc@yavin>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="whi5vyhgqsw2uity"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200116092903.52690-1-colin.king@canonical.com>
In-Reply-To: <20200116092903.52690-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Shuah Khan <shuah@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--whi5vyhgqsw2uity
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020-01-16, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is a spelling mistake in a literal string, fix it.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Yup, sure.

Reviewed-by: Aleksa Sarai <cyphar@cyphar.com>

> ---
>  tools/testing/selftests/openat2/resolve_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/testing/selftests/openat2/resolve_test.c b/tools/testi=
ng/selftests/openat2/resolve_test.c
> index 7a94b1da8e7b..bbafad440893 100644
> --- a/tools/testing/selftests/openat2/resolve_test.c
> +++ b/tools/testing/selftests/openat2/resolve_test.c
> @@ -230,7 +230,7 @@ void test_openat2_opath_tests(void)
>  		{ .name =3D "[in_root] garbage link to /root",
>  		  .path =3D "cheeky/garbageself",	.how.resolve =3D RESOLVE_IN_ROOT,
>  		  .out.path =3D "root",		.pass =3D true },
> -		{ .name =3D "[in_root] chainged garbage links to /root",
> +		{ .name =3D "[in_root] chained garbage links to /root",
>  		  .path =3D "abscheeky/garbageself", .how.resolve =3D RESOLVE_IN_ROOT,
>  		  .out.path =3D "root",		.pass =3D true },
>  		{ .name =3D "[in_root] relative path to 'root'",
> --=20
> 2.24.0
>=20


--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--whi5vyhgqsw2uity
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXiB8owAKCRCdlLljIbnQ
EgelAQCi7ehRRjMXxgaesk3ZbZTuR2HRlfXzCU49y/hQWWZbpAD+J2chJFoEBKQ2
tl0+P3uEiMVf47pvNnprKM/+N7nnjwA=
=pquf
-----END PGP SIGNATURE-----

--whi5vyhgqsw2uity--
