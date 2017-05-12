From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Fri, 12 May 2017 20:17:03 +0000
Subject: Re: [PATCH V2] serial: efm32: Fix parity management in 'efm32_uart_console_get_options()'
Message-Id: <20170512201703.puk6xit34d3dnddv@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170512143545.15394-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170512143545.15394-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Fri, May 12, 2017 at 04:35:45PM +0200, Christophe JAILLET wrote:
> UARTn_FRAME_PARITY_ODD is 0x0300
> UARTn_FRAME_PARITY_EVEN is 0x0200
> So if the UART is configured for EVEN parity, it would be reported as ODD.
> Fix it by correctly testing if the 2 bits are set.
>=20
> Fixes: 3afbd89c9639 ("serial/efm32: add new driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks for picking this topic up again.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
