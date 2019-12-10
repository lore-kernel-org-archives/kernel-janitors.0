From: Aleksa Sarai <cyphar@cyphar.com>
Date: Tue, 10 Dec 2019 11:27:50 +0000
Subject: Re: [PATCH][next] selftests: fix spelling mistake "chainged" -> "chained"
Message-Id: <20191210112750.5rfck3gnmobabhak@yavin.dot.cyphar.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="l7rai3c6jadzkxag"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191210112455.171482-1-colin.king@canonical.com>
In-Reply-To: <20191210112455.171482-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Shuah Khan <shuah@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--l7rai3c6jadzkxag
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-12-10, Colin King <colin.king@canonical.com> wrote:
> There is a spelling mistake in a literal string, fix it.

Yup, makes sense.

Reviewed-by: Aleksa Sarai <cyphar@cyphar.com>

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
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

--l7rai3c6jadzkxag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXe+BLwAKCRCdlLljIbnQ
EubTAP9OptH6VWy5DMeb7HaGfXTnyuPkThnwOMh7lvkzgNvH4AEAtBUbCf5wSGnb
yzCFDvF52CMUSP7Tzg5KEduILkkf+A4=
=9MTh
-----END PGP SIGNATURE-----

--l7rai3c6jadzkxag--
