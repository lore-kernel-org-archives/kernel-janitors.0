From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Wed, 04 Sep 2019 16:35:42 +0000
Subject: Re: [PATCH -next] pwm: sifive: Remove redundant dev_err call in pwm_sifive_probe()
Message-Id: <20190904163542.me5q4hlzaf3pdnmx@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904111836.122616-1-weiyongjun1@huawei.com>
In-Reply-To: <20190904111836.122616-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-pwm@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, kernel-janitors@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org

Hello,

On Wed, Sep 04, 2019 at 11:18:36AM +0000, Wei Yongjun wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
>=20
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

that's right

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
