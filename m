From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 28 Jun 2019 21:18:53 +0000
Subject: Re: [PATCH][next] regulator: lp87565: fix missing break in switch statement
Message-Id: <4cb0e4ab-66c7-2b3d-27d3-fd5cfde8988f@canonical.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="oEKD0TuaAUSDAgkxvBRIrIF2rNVkuo2dS"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190627131639.6394-1-colin.king@canonical.com>
 <20190628143628.GJ5379@sirena.org.uk>
In-Reply-To: <20190628143628.GJ5379@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
Cc: Keerthy <j-keerthy@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oEKD0TuaAUSDAgkxvBRIrIF2rNVkuo2dS
Content-Type: multipart/mixed; boundary="tQHFnbd530JsHQTzVsockgDr2aN6yzYeZ";
 protected-headers="v1"
From: Colin Ian King <colin.king@canonical.com>
To: Mark Brown <broonie@kernel.org>
Cc: Keerthy <j-keerthy@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <4cb0e4ab-66c7-2b3d-27d3-fd5cfde8988f@canonical.com>
Subject: Re: [PATCH][next] regulator: lp87565: fix missing break in switch
 statement
References: <20190627131639.6394-1-colin.king@canonical.com>
 <20190628143628.GJ5379@sirena.org.uk>
In-Reply-To: <20190628143628.GJ5379@sirena.org.uk>

--tQHFnbd530JsHQTzVsockgDr2aN6yzYeZ
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 28/06/2019 15:36, Mark Brown wrote:
> On Thu, Jun 27, 2019 at 02:16:39PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently the LP87565_DEVICE_TYPE_LP87561_Q1 case does not have a
>> break statement, causing it to fall through to a dev_err message.
>> Fix this by adding in the missing break statement.
>=20
> This doesn't apply against current code, please check and resend.
>=20
So it applies cleanly against linux-next, I think the original code
landed in mfd/for-mfd-next - c.f. https://lkml.org/lkml/2019/5/28/550

Colin



--tQHFnbd530JsHQTzVsockgDr2aN6yzYeZ--

--oEKD0TuaAUSDAgkxvBRIrIF2rNVkuo2dS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEcGLapPABucZhZwDPaMKH38aoAiYFAl0WhD0ACgkQaMKH38ao
AiYXqhAAgNjTAegXGgSCgEaVLMbaflCz6y02yhmBbwEtjXJsbDREpATHmq4Gbt+j
erzMKu9kEXGF0arOAmBOkAVyvtWatjvF0Za6/vvjgUrFS5hBmukxGvzET0H9bTGz
YNJnIxm1YROmQc8zlJDk/JTChddEsHTdmQaz4oMvhI415EyyMnXXHBnIPKKnt4de
WRLO6cSk0wtE3uU2ueEBR9RTyaaPzvYYCCrB8ln6muXr1cBI1f2823t8Ty0PRBHS
TxCKUjTwg1ZBWPwCkk6jqS39ET2sn8NFkhkTbvWccvhTI+EB8vNy3JeNhv/7m+BD
EX0suKNfuOovcfZISF6ngtnSgZo4YgpuYA+ekfu8hNML2rA7hkLNGa3ykLhGv9L4
PxqlSI8ejX94A/mAZKHzHE29J+b+LAb7lGSFecFBqOpC1sv7G8Jsv2ftdfOs1qZN
LkIXVhFRT2dsTAVZb8HyTuDGY4KoP4nAze9ew0VDHw40QCJHwtcBUZIDlKzN+ayN
FgfXCA3e2RT8VAxNfWU0HRpFoZRbwmfhuvjMMvvUR7ee4VUyNLD0oabI3IoEjFnh
UXRoq6rHqDQ+aN2iz7Ya4qj+m2QKo7fEo+04uchuKWuBgewNe1Nx9vDHZFJlnw9l
kuRZPk8KyoUWmzx2BC3j2dae2miEk9gxfZHF2L/8OwNeXYzp8CQ=
=U/PE
-----END PGP SIGNATURE-----

--oEKD0TuaAUSDAgkxvBRIrIF2rNVkuo2dS--
