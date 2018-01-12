From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Fri, 12 Jan 2018 17:52:34 +0000
Subject: Re: [PATCH][next] ixgbe: fix comparison of offset with zero or NVM_INVALID_PTR
Message-Id: <1515779554.6613.2.camel@intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-iweXEgEoC6+j7fXiP6Dp"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180112171310.27973-1-colin.king@canonical.com>
In-Reply-To: <20180112171310.27973-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>


--=-iweXEgEoC6+j7fXiP6Dp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-01-12 at 17:13 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The incorrect operator && is being used and will always return false
> as offset can never be two different values at the same time. Fix
> this
> by using the || operator instead.
>=20
> Detected by CoverityScan, CID#1463806 ("Logically dead code")
>=20
> Fixes: 73834aec7199 ("ixgbe: extend firmware version support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/intel/ixgbe/ixgbe_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Dan Carpenter beat you too it, see his patch in my tree:

commit 7352baadcc2ad2ed214e52bd8b50ac6eb01968cd
Author: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Fri Jan 12 09:45:00 2018 -0800

    ixgbe: Fix && vs || typo
   =20
    "offset" can't be both 0x0 and 0xFFFF so presumably || was intended
    instead of &&.  That matches with how this check is done in other
    functions.
   =20
    Fixes: 73834aec7199 ("ixgbe: extend firmware version support")
    Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
--=-iweXEgEoC6+j7fXiP6Dp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiTyZWz+nnTrOJ1LZ5W/vlVpL7c4FAlpY9eIACgkQ5W/vlVpL
7c4eARAAl3KYCVb2W/XYvwkUzNbdav323QBeJFw0myLwQLED7Rn2EYIxJdIEh5Ye
FU9SEAzrycaKX5FWxqDW8o2yzRzx2YufDyR1n/9s5SZxjGcCpkqdRYVbVCOKPJLM
JdvoSueyRvLhtBdvuMW718aQVoPanlKQwi6ngoE2VL4/9MwjW4ekxDMMpBNrvaBV
NRcqAmZyyUV8PBix2rZDe14RNP1RO2rVBV3VUTOIE2GZfRhowIIj3ZWCz6b7Flbx
DE1GOrbxIuqoUjWy6Zuttk05p2YOgSv9S7Zba6iKZFqZmpvt5O1tDWTQLztCBHHH
5DAIxJMtNB1dlgGPtIeJRYX1wtjPg/YZDy1U3C1lf0WYEsgYge8wGD0tcO0ctWEq
aEGaBx2c1Enj00/52Y2yTDBFNJ6YyNIC3Ndvo5y9DLwBP15icNqfJEXFzbpnojwR
v0+Sm4oPXMKq5UP3UJ0k954V9+9J92U/79LKiZGmZ2Osd5Cp/tAtqNc2FcIcnP6N
BnB36Xi2pvDBNNI1pRZWVMtkN8KYlVG+aN1+oop7Z+dtKhvrgGgFlIYJGTnzvBXt
xtffYaT8/Zr9/du9s/BN2/H07tj9NNLjcFf06GT2hKSogLRQn2tcSW6oE7sYEpPr
In9fCVKQWIr6WtZzUZNfBetU3aUVIX+nCsPYmoxxTbM4DHG1HP0=
=Umy6
-----END PGP SIGNATURE-----

--=-iweXEgEoC6+j7fXiP6Dp--

