From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 19 Feb 2012 20:13:32 +0000
Subject: Re: [PATCH] b44: fix section mismatch warnings in b44.c
Message-Id: <20120219201332.GF2855@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ChQOR20MqfxkMJg9"
List-Id: <kernel-janitors.vger.kernel.org>
References: <c8f624fdb13dcf32d82b1abb70a423abc4a2359a.1329662367.git.n.pajkovsky@gmail.com>
In-Reply-To: <c8f624fdb13dcf32d82b1abb70a423abc4a2359a.1329662367.git.n.pajkovsky@gmail.com>
To: Nikola Pajkovsky <npajkovs@redhat.com>
Cc: Gary Zambrano <zambrano@broadcom.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Nikola Pajkovsky <n.pajkovsky@gmail.com>


--ChQOR20MqfxkMJg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 19, 2012 at 03:45:54PM +0100, Nikola Pajkovsky wrote:
> From: Nikola Pajkovsky <n.pajkovsky@gmail.com>
>=20

This changelog is not really helpful.

Why did you remove an __exit anotation instead changing the callers?
Obviously I looked at the code, so I can answer that question, but I
shouldn't have to.  It should be explained in the changelog.

Sometimes I add in information about when the error message was
introduced.

It might also be nice to mention what the bad effects of this
problem are.

> Signed-off-by: Nikola Pajkovsky <n.pajkovsky@gmail.com>
                                   ^^^^^^^^^^^^^^^^^^^^^
You're sending the patch from your redhat address; it's best to sign
it with the redhat address as well.

regards,
dan carpenter


--ChQOR20MqfxkMJg9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPQVfrAAoJEOnZkXI/YHqRQdQP/1Ax4keEUEH8SoCr0yC1xeBD
92KNbeVvOOLUz7bBCtA4IkwhWUIAyDtQUF5naIlmQDJW5p+4IhA20pSm88FtxZKh
2QgOtA1B6kGJ2Mg7QsSfwX8p59XBKmoQHk1zmCx0E1Ym7CHowdBLs+GbaQiOkzVx
fyB9LDWKNA3K5dm9gcpoV6LNtzkdYjWTbUsWj3NLlMzG3eeTXVITIkX89b+CZHij
7V6Z/Rtibo5So6dn42pd4KUm4UDzHEKUWUAb7DQSNZBhXHTM0maz9m0EqLl/7cIc
lzXG8oj0HbGiEFZL8G+bYR2MQh4JdX2jHVQA5G0Kjjvs3+bVUybOLvkXxv/mh6vu
iFiKNTDWRMcXgcdgB4aDQMXySqk1ypd4g22Fsvfc78kYoU3yaVgIpaQ0BCEZHpvW
DFbSio1yRIi8SLa7NKNthb6wzURFLM15uBGPpQ0zUNEJB76rQiiilFk9Cdmqx5wO
qG/5pW7UtgtrFjJwZ+punIqp3YwCcrXsjULDooGBIHbiTTc5R87eeQ8I9N1JnPnO
Ii/CfqnoG78eF+6RQmEJCoJF5dxQm+wTpaHP9lkofgLX2Tse6ERQMVxY9pM+1MwU
7XmAKdV5G7Ef0WgkCNrRFEaDWVegVmITZkNJIQC6eNYMZNgxEA9Fu5iqP7I+DdSx
ESoTxeCjZTwiaKXo1ZhV
=6OOu
-----END PGP SIGNATURE-----

--ChQOR20MqfxkMJg9--
