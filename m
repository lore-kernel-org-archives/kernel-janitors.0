From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Fri, 10 Jan 2020 07:16:26 +0000
Subject: Re: [PATCH -next] pwm: sun4i: Fix wrong pointer passed to PTR_ERR()
Message-Id: <20200110071626.5xmthg43j24p5ha2@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110012515.32965-1-weiyongjun1@huawei.com>
In-Reply-To: <20200110012515.32965-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-pwm@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>, kernel-janitors@vger.kernel.org, mripard@kernel.org, wens@csie.org, thierry.reding@gmail.com, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org

On Fri, Jan 10, 2020 at 01:25:15AM +0000, Wei Yongjun wrote:
> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
>=20
> Fixes: 5b090b430d75 ("pwm: sun4i: Add an optional probe for bus clock")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

there is already a patch, see

	https://patchwork.ozlabs.org/patch/1220206/

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
