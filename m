From: Eric Anholt <eric@anholt.net>
Date: Fri, 08 Sep 2017 18:08:18 +0000
Subject: Re: [PATCH] drm/vc4: clean up error handling on devm_kzalloc failure
Message-Id: <87y3ppm5bh.fsf@anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170908131704.32517-1-colin.king@canonical.com>
In-Reply-To: <20170908131704.32517-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--=-=-=
Content-Type: text/plain

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> The current error handling on devm_kzalloc failures performs a non-null
> check on connector. Thss check is redundant because connector is null
> at that failure point.  With this check removed, we may as well make
> the failure path into a trivial -ENOMEM return to clean up the error
> handling.
>
> Detected by CoverityScan CID#1339527 ("Logically dead code")

Reviewed and applied.  Thanks!

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlmy3JIACgkQtdYpNtH8
nug4RhAAizQsgw7dmI9OUtxZ8ZmKlh26SGuRubNqqiba6i3Pn/SBAqcEk2FBPWHX
d3FxHWiai+EEOjOUD2Isa7WCjF3WF8RRU9tClR6WEanwde8NMDNWs3t/XYObGImS
s5Uwm3eatVWvuh+yBrVMcna6TNl9HWtshVnTJ5g4Hk3NRqNjNtu6bFawbapo741U
WFX/ZaLzfG60RSIL4N9Ov1ywpsd/rCDxhJeBOnCVMoKdQwj1d4NDQzCXYCE0L3P0
aBdNFY5YuBWsPEzDquOE6Qw+aioXbQ7VHMQm57W2Tsi8R9cLKdE16gEXRI22zGX3
AjcsKykpCo6OkViFRYjPT6W19AClzbgjV2b4Bzp0JeixrPqW50d54JStc1MvhftB
mgv8bAhNlDehsyfXpW+1YlXRD1H61BB96yMGhgEaQ5gU+MiKVRdv+hzUySx/6QCA
kJ7knlraRcIkCTo7iXD9ayFKoLXeygmlGe+nm2MSD7KPWImkQ0Tmppibk79CRvQ0
GkLEyxdJawMQIqJDoOEaJHHoD6AJyDmzpzbYErKgrw3WCz8lHF1708daqdQMSkpr
/V3PgkD9eGZ2DJixB1E2PMpXdAcEouyB3QOesqZ7GxNJdg1vgKF7gNf6/VqZVl+I
UKN591BhB6mLRraqilknQ3MkDmXoSs2+qSpdjIcwRKQusV5b1Jg=
=7ZiP
-----END PGP SIGNATURE-----
--=-=-=--
