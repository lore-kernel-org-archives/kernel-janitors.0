From: Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 01 Dec 2014 16:01:26 +0000
Subject: Re: [PATCH 1/1] GPU-DRM-MSM-Adreno: Deletion of unnecessary checks before the function call "release
Message-Id: <20141201160123.GF11943@ulmo.nvidia.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="QNDPHrPUIc00TOLW"
List-Id: <kernel-janitors.vger.kernel.org>
References: <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <54747B11.9070104@users.sourceforge.net>
In-Reply-To: <54747B11.9070104@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org


--QNDPHrPUIc00TOLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2014 at 01:50:25PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>

You can probably get rid of this if you configure your emailer properly.

> Date: Tue, 25 Nov 2014 13:44:20 +0100

This is odd. I've never seen git send-email generate these.

I didn't notice with your earlier patches, but the subject prefix is
wrong. Please use something more consistent with existing patches, in
this case: "drm/msm: ..." or "drm/msm/adreno: ..."

> The release_firmware() function tests whether its argument is NULL
> and then returns immediately. Thus the test around the call is not needed.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 655ce5b..757052c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -404,9 +404,7 @@ void adreno_gpu_cleanup(struct adreno_gpu *gpu)
>  			msm_gem_put_iova(gpu->memptrs_bo, gpu->base.id);
>  		drm_gem_object_unreference(gpu->memptrs_bo);
>  	}
> -	if (gpu->pm4)
> -		release_firmware(gpu->pm4);
> -	if (gpu->pfp)
> -		release_firmware(gpu->pfp);
> +	release_firmware(gpu->pm4);
> +	release_firmware(gpu->pfp);
>  	msm_gpu_cleanup(&gpu->base);
>  }

Besides the subject prefix,

Reviewed-by: Thierry Reding <treding@nvidia.com>

--QNDPHrPUIc00TOLW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUfJDTAAoJEN0jrNd/PrOhJpwQALGxMfJdXJBBBWY42M9Q2749
D/WTe5gSLtRxxSF1Qc8cjQf06M+RbvXl+ZZOheEBC1IdSbNmPFqVj4uEanh0AXB2
3v2yTA5ig/A/hu2Sv7+iCJ0tvhU/J/GmW12nNIadZNcnV3U6YMu/QKNxspFjL5U6
HmGHHpVPzb57Sohcis0r/TO5twZZuSY6PM7Z8Ztt/6rpxN4HHpOlew8fbsVQDcJx
Cu9zGKouWaTRXCLv/NoMFxcZL2k6yjPJIWVfkknbgweo+/I9UH3XhLIs/keNutH/
Qnz22bgZrQwnFjy02S6DQKneYcYLn+3IMoWpsss4xE5586Pw8zR9BNtxufOSbFL3
qwSjP74tGtke+MOrLEg2R8Ar9J4Ywnx204UF3qOFWynumpg8GH7O1DTolqWEbGy5
iAK0s+SB86xM6ZC5lsUkQznw22w0nT/C8dqouYIIYODeIxC5Sj475vAZfZhSlNMQ
5WZvXC50vcVLJU4nR+z9IUK9pXv8IIYzoUnfZ3sVeUHNCEXNTkRRtW+vOdfFed6D
C26ZZWJec3BifbbGZdNip+0BXVxVEcKI8Gditdj7LIdXxD/KFRfVqNY3l2QxvG0I
9wQu+iwiv/1avl7SetaVVAwm7s6JiJ+99JUKDDj3+s0B3I8uUPNm2OiJnbkvKKqE
CITy27kWJObkVmypEDMp
=dCpw
-----END PGP SIGNATURE-----

--QNDPHrPUIc00TOLW--
