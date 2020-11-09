From: Kurt Kanzenbach <kurt@linutronix.de>
Date: Mon, 09 Nov 2020 13:27:52 +0000
Subject: Re: [PATCH][next] net: dsa: fix unintended sign extension on a u16 left shift
Message-Id: <87y2jar76v.fsf@kurt>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201109124008.2079873-1-colin.king@canonical.com>
In-Reply-To: <20201109124008.2079873-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--=-=-=
Content-Type: text/plain

On Mon Nov 09 2020, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The left shift of u16 variable high is promoted to the type int and
> then sign extended to a 64 bit u64 value.  If the top bit of high is
> set then the upper 32 bits of the result end up being set by the
> sign extension. Fix this by explicitly casting the value in high to
> a u64 before left shifting by 16 places.
>
> Also, remove the initialisation of variable value to 0 at the start
> of each loop iteration as the value is never read and hence the
> assignment it is redundant.
>
> Addresses-Coverity: ("Unintended sign extension")
> Fixes: e4b27ebc780f ("net: dsa: Add DSA driver for Hirschmann Hellcreek switches")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Kurt Kanzenbach <kurt@linutronix.de>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEooWgvezyxHPhdEojeSpbgcuY8KYFAl+pQ9gACgkQeSpbgcuY
8KYcTBAAy18YsyfEDK2RBP/05cmZJKdrhKGT65m5aI1JezdENk9bCdlxSlc+Oqga
rAzG0pQliyooyHkhkk/+uKd0TMFQ5TdbvIW7af2AoAiNADbUrp2I1an/CXbxIBGA
kCoyqGmGpmvl6V9/sRklq5Y16BxxhDJVREa4/oeiAl4HEuqUQo/bxnc8bH3puOzx
3SMHt0YZDWLyIAkmocREmMBijzlAlXEpTrIR/QnDJTcAEJgxlUlHwJq8Vn4c+1iR
rc2XlsIwzzLz1ah6wfVzP24wbHvFwpGGUMjOR2OubJeKcyn8u5AjqT4z2NCr3/G5
7MhTYblsO0qZVLSxO63ZatXzB8gX+Y6Pr3M6WQqL1B3j4mMrGJSYYohPBHSwKeDh
1z+w8tYNOPGAQ811hjuMrIJh/xGIo4dglYCWASo6oUi611tqrs1WBMaH09E9Dy3F
jYj7Zv+K4qMRmeGYLGu3bLihqycZFq3XvyPmGF8aJlKCNAQnPb+2Vk5v5L3AXsSj
qD3cJbCO87U86Ee4jYyGnpu/5+g1VGWxQzvzWrtqFyITPJVL1gJ51TEPdG2DvbSb
REMVKGPmLZCrylUWmq8zQa7MqCxuI1sSwyIhhAGx/PxvEHc0AlHMm4HNBq8+ZCVD
crawO2LX5auQKEudppWsulWZIRQzvO3xaE+3Ov3C85LVvBQ8XWE=
=OcYZ
-----END PGP SIGNATURE-----
--=-=-=--
