From: Thierry Reding <thierry.reding@gmail.com>
Date: Wed, 21 May 2014 21:02:20 +0000
Subject: Re: [PATCH] radeon: Use time_before()
Message-Id: <20140521210215.GB6237@mithrandir>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="b5gNqxB1S1yM7hjW"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400693977-21033-1-git-send-email-manuel.schoelling@gmx.de>
In-Reply-To: <1400693977-21033-1-git-send-email-manuel.schoelling@gmx.de>
To: Manuel =?utf-8?Q?Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, christian.koenig@amd.com


--b5gNqxB1S1yM7hjW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2014 at 07:39:37PM +0200, Manuel Sch=C3=B6lling wrote:
> To be future-proof and for better readability the time comparisons are mo=
dified
> to use time_before() instead of plain, error-prone math.

Nit: commit messages are best wrapped around column 72.

> Signed-off-by: Manuel Sch=C3=B6lling <manuel.schoelling@gmx.de>
> ---
>  drivers/gpu/drm/radeon/radeon_pm.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/=
radeon_pm.c
> index f30b842..b08db66 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -1592,7 +1592,7 @@ static void radeon_dynpm_idle_work_handler(struct w=
ork_struct *work)
>  		 * to false since we want to wait for vbl to avoid flicker.
>  		 */
>  		if (rdev->pm.dynpm_planned_action !=3D DYNPM_ACTION_NONE &&
> -		    jiffies > rdev->pm.dynpm_action_timeout) {
> +		    time_before(rdev->pm.dynpm_action_timeout, jiffies)) {
>  			radeon_pm_get_dynpm_state(rdev);
>  			radeon_pm_set_clocks(rdev);
>  		}

I think time_after(jiffies, rdev->pm.dynpm_action_timeout) would be more
intuitive, but either way:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTfRRXAAoJEN0jrNd/PrOh2u4P/0L94g4KjQ8gr/WMlt8YRz5w
jEYJBhJMGRR88uMxz79vPGmbblL2Bqe1cyqhusxiBg8BJMWvi6UVAHHiABzYzv0r
G4ti0ruOOaXFLcGCjr9sIBIOdRSJC4bhCp+2CtIArgzBX/ECTFXbaF+qP9XUKWeA
Uls4Ty1Hvjs9WTLmBijJ7/oLlAaZDEe2Ym6tELpycSKD32QGOzCqmOYjex6uzHib
WTfzYV8//+69oPWQo41jzsuWquvmuTVpMjR66E3xMh3qyf+eqdje2aV8qLUaMPz5
Mz8OSaT7bDOWmbf1CFKScBbGFMAEzl43OAipN02x/eclaQF20ZMFkX1gHRxxQURA
RGTZDjWYl//h1POfor4/vrqPEWeO0kdEI7sgSJVhSwea7waJ1gbX7rIrTKhXvieA
1yRSnRZpNFLD5FWGBJev685g4nt6oPS9dNFkJTYYwJdgX4+LN8N/MWWtrgHVF3Oi
4iYDcWChV+ktaqTUSke1V6TCHEtleGhEPa2VPUP4l9880/6OVpAJTakBASWfc3SS
E2EXcGFxuwLYrH/BjRn5TjA3xcgPj/DtzzvQ9+ejvnjZ6+2P2/MnI/t2JOASSP6K
tqpiDPPknSc6qvGnRmgKqVjFkFeqvo7OxYQn7qmPVCsVl6uuDg409A9SSKD3zWwA
hqB3RqM6bWYrVKGfEjJZ
=7g6l
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--
