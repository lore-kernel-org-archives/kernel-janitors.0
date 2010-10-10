From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
Date: Sun, 10 Oct 2010 19:44:05 +0000
Subject: Re: [PATCH] arch: arm/imx: fix memory init in imx_dma_request()
Message-Id: <20101010194405.GS29673@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286731703-17775-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1286731703-17775-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Sun, Oct 10, 2010 at 09:28:23PM +0400, Vasiliy Kulikov wrote:
> imx_dma_request() didn't fill struct pointed by imxdma with zeroes
> as it passed sizeof(pointer), not sizeof(struct) to memset().
>=20
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
Acked-and-tested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
