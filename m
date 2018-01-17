From: Eric Anholt <eric@anholt.net>
Date: Wed, 17 Jan 2018 19:47:58 +0000
Subject: Re: [PATCH -next] hwrng: bcm2835 - Remove redundant dev_err call in bcm2835_rng_probe()
Message-Id: <876080mfm9.fsf@anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516189234-11957-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516189234-11957-1-git-send-email-weiyongjun1@huawei.com>
To: linux-arm-kernel@lists.infradead.org

--=-=-=
Content-Type: text/plain

Wei Yongjun <weiyongjun1@huawei.com> writes:

> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlpfqG4ACgkQtdYpNtH8
nujAqA//d1bInXWbR9uj53UfIu7iEapW7aw0BI3r+OznVdI09Qbq9dSpdLGdraSS
49wvw8rAS/mjUQIWvUJdtvye4OP3720kDi3p6JUlib+ygBIbbxizkDOMsQae43Fw
/8N54XkiTTRaQBEJQ6wG2Rbdu/V/J6VWkjv67EofrRugSUJAwEso3q6yzkvaAtq7
Erom20bN0uRFnueP8+6LKWaKuATWWcph/FFQEDp0fPryCsJ3vA+Fmrj50va9RsZG
+2+Kkclr97pJNN7FL74ognNqalJOFetY0Vr54CiEcWrIdifvwDCOxMzlPMlr7l84
BN/LZNHFLbOWV/ZFgJdl7RSNRcR9AGaO/kGTtSOogkJHKRJVbehmwAvnyCv65yuX
+Je5enHQXJHvftPLjUMI/bnY0312FHvCSPWSujxl7rRGm7SdACKEQBsl4UjmomWk
lzfqvurpkStE4nEWAkhWnH/JW7XAdk8wq8rfyMdzRz79H46v/lzevEhTa8OvgACV
Pno0yTk8lKvX5v05WVkBCeyFTQXr3kTq+WNuyG/DOkR9Oiwlq6cDbaujGuuSz5fh
TVKn1P2Nz8+fYsb0exLOrPWI2zPRkV3K1IYxilmqyFFfYZdk35Z+S+85p6xX/0SB
CtGW61gnEbTQu/e9dQov432CLN5yzKKn+IR1/rG/q8QRcPQM/ks=
=h7JS
-----END PGP SIGNATURE-----
--=-=-=--
