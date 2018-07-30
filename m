From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 30 Jul 2018 07:35:26 +0000
Subject: Re: [PATCH -next v3] thermal: armada: fix copy-paste error in armada_thermal_probe()
Message-Id: <20180730093526.3ae018ae@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1532934423-179537-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1532934423-179537-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Wei,

Daniel Lezcano <daniel.lezcano@linaro.org> wrote on Mon, 30 Jul 2018
09:29:32 +0200:

> On 30/07/2018 09:07, Wei Yongjun wrote:
> > The return value from devm_kzalloc() is not checked correctly. The
> > test is done against a wrong variable. Fix it.
> >=20
> > Fixes: e72f03ef2543 ("thermal: armada: use the resource managed registr=
ation helper alternative")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> > v2 - > v3: fix the description
> > --- =20
>=20
>=20
> Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>=20
>=20

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
