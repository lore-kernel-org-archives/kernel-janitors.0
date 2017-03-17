From: Eric Anholt <eric@anholt.net>
Date: Fri, 17 Mar 2017 23:52:04 +0000
Subject: Re: [PATCH] drm: vc4: remove redundant check of plane being non-null
Message-Id: <877f3njwbf.fsf@eliezer.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170316185418.32765-1-colin.king@canonical.com>
In-Reply-To: <20170316185418.32765-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--=-=-=
Content-Type: text/plain

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer plane is always null on the error path at label 'fail'
> hence the check if it is non-null is redundant. We can therefore
> remove the check and the destruction of plane as well as the fail
> error path and instead just return an -ENOMEM ERR_PTR.
>
> Detected by CoverityScan, CID#1339532 ("Logically Dead Code")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed and applied.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAljMdqQACgkQtdYpNtH8
nuhvyg/+Kpcqi/z4jwkAwxBwtZ/JuBkCpMWY0AcVZnggOD/KVqL5ZMyqlxx7FkYM
xUEMyLX1oWa8vPIY9h26YXRPpyij1Xe/ovE3H96GTeDAQ2uRiqqXhJJEIUvBs6/B
Xa16plN11kuKfu0GUsk9MEGF5B7hA8jf8pvZZ9XRH0RaKVKBda77N5QDlHnesFQQ
IoYYOwfrwNkTWEyBMyCt2W9boT67Tkp18CChJafeqjEVF8ShWYjD3Ub/kgNtCBH9
gjp7jrZL+/I23UHUBaDPUiQ4UM7Qd9SVs9hsB1lqKykjKAa1rE2gBsWX1stlWtbL
26MCb8nNPiwjTo09APnEr186yNb29UpmXG19xtg5EVvKYRpBGKYlNNdBHrMa4029
7KoVB0Gx5rDeyyZEkkX1xx7Q0JKg2dWvKPTHwQJKDoMbRcKIRiO5AEouJ8rLWKlg
T3A8SHVWRTPPqAMcJ4QEj0Gqaeo1JhStSKObkU4XF+WSTX6EAn6SOI1W9AVHNaO2
om0A72q8bnR5SwEsETsBKLnnIYV8d3/PkfEtWUUr26bTQ06igXgwN7JwC8RPB/IL
5BHp56o/5hf2x6XBIJOagxn7NHmIk8hPFPvM7kHPrPawE+6SV/B2RH8IC+wUk4SZ
0R5ozZEvGhhRBA0qOx0r3x9gUYW+RTnH6EsTb/L6vuKxPj6Brhc=
=jr2X
-----END PGP SIGNATURE-----
--=-=-=--
