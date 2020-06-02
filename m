From: Mark Brown <broonie@kernel.org>
Date: Tue, 02 Jun 2020 09:49:47 +0000
Subject: Re: [PATCH] spi: spi-ti-qspi: call pm_runtime_put on pm_runtime_get failure
Message-Id: <20200602094947.GA5684@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="BXVAT5kNtrzKuDFl"
List-Id: <kernel-janitors.vger.kernel.org>
References: <26028f50-3fb8-eb08-3c9f-08ada018bf9e@web.de>
In-Reply-To: <26028f50-3fb8-eb08-3c9f-08ada018bf9e@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, linux-spi@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Dinghao Liu <dinghao.liu@zju.edu.cn>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 10:40:33AM +0200, Markus Elfring wrote:
> > The counter is incremented via pm_runtime_get even in failure case.
> > To correct the counter call pm_runtime_put in case of failure, too.
>=20
> How do you think about a wording variant like the following?
>=20
>    Change description:
>    The PM runtime reference counter is generally incremented by a call of
>    the function =E2=80=9Cpm_runtime_get_sync=E2=80=9D.
>    Thus call the function =E2=80=9Cpm_runtime_put_autosuspend=E2=80=9D al=
so in one error case
>    to keep the reference counting consistent.

The original changelog is perfectly fine, please stop sending these.

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7WILoACgkQJNaLcl1U
h9DjBAf8Cv2mppt2k43MzqHRc3jstaRWync9NLGQlJhGTT7Y3mPwynIc64JoOPKk
n88vwec+oBWDCnFUZZzNT7eK3XYJNFvnC10mt0p8kZSYu1wznntH/lBA8FNMu7Qy
varbbXp5irF+x1VyKfc3phJG/s7Gi5jnixtv/MZcEBY84GroD4nXvwlmIWzPrhxo
EJEAVd2F4Eea5n7p9ivEDRacCkP7G/2jYTYjWdfW6JYkJVpLgJdH6xzuD3cWZjIb
KkXT4EbKlh/6F6oOuutwsc0tRHG++YeOVAGNbqtSrpELbzOx9e8v4qeSedSzAxta
Bx995z3ICwchSCLdLMZWqRI44gr4ow==
=l1jf
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
