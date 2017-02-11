From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Sat, 11 Feb 2017 18:30:17 +0000
Subject: Re: [PATCH] serial: efm32: Fix parity management in 'efm32_uart_console_get_options()'
Message-Id: <20170211183017.sg5xjkox5zlkuvwa@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170210210640.17749-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170210210640.17749-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Fri, Feb 10, 2017 at 10:06:40PM +0100, Christophe JAILLET wrote:
> UARTn_FRAME_PARITY_ODD is 0x0300
> UARTn_FRAME_PARITY_EVEN is 0x0200
> So if the UART is configured for EVEN parity, it would be reported as ODD.
> Fix it by testing if the 2 bits are set in the ODD case.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Un-tested
> ---
>  drivers/tty/serial/efm32-uart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/tty/serial/efm32-uart.c b/drivers/tty/serial/efm32-u=
art.c
> index ebd8569f9ad5..84034ef20c88 100644
> --- a/drivers/tty/serial/efm32-uart.c
> +++ b/drivers/tty/serial/efm32-uart.c
> @@ -572,9 +572,9 @@ static void efm32_uart_console_get_options(struct efm=
32_uart_port *efm_port,
>  			16 * (4 + (clkdiv >> 6)));
> =20
>  	frame =3D efm32_uart_read32(efm_port, UARTn_FRAME);
> -	if (frame & UARTn_FRAME_PARITY_ODD)
> +	if ((frame & UARTn_FRAME_PARITY_ODD) =3D UARTn_FRAME_PARITY_ODD)
>  		*parity =3D 'o';
> -	else if (frame & UARTn_FRAME_PARITY_EVEN)
> +	else if ((frame & UARTn_FRAME_PARITY_EVEN) =3D UARTn_FRAME_PARITY_EVEN)

There is really a bug, but the fix looks wrong (although it does the
right thing). The check for UARTn_FRAME_PARITY_EVEN should check both
bits, too.

The right change that works independent of the actual
values would be:

diff --git a/drivers/tty/serial/efm32-uart.c b/drivers/tty/serial/efm32-uar=
t.c
index 195acc868763..00cdffbe4eda 100644
--- a/drivers/tty/serial/efm32-uart.c
+++ b/drivers/tty/serial/efm32-uart.c
@@ -27,6 +27,7 @@
 #define UARTn_FRAME		0x04
 #define UARTn_FRAME_DATABITS__MASK	0x000f
 #define UARTn_FRAME_DATABITS(n)		((n) - 3)
+#define UARTn_FRAME_PARITY		0x0300
 #define UARTn_FRAME_PARITY_NONE		0x0000
 #define UARTn_FRAME_PARITY_EVEN		0x0200
 #define UARTn_FRAME_PARITY_ODD		0x0300
@@ -572,12 +573,16 @@ static void efm32_uart_console_get_options(struct efm=
32_uart_port *efm_port,
 			16 * (4 + (clkdiv >> 6)));
=20
 	frame =3D efm32_uart_read32(efm_port, UARTn_FRAME);
-	if (frame & UARTn_FRAME_PARITY_ODD)
+	switch (frame & UARTn_FRAME_PARITY) {
+	case UARTn_FRAME_PARITY_ODD:
 		*parity =3D 'o';
-	else if (frame & UARTn_FRAME_PARITY_EVEN)
+		break;
+	case UARTn_FRAME_PARITY_EVEN:
 		*parity =3D 'e';
-	else
+		break;
+	default:
 		*parity =3D 'n';
+	}
=20
 	*bits =3D (frame & UARTn_FRAME_DATABITS__MASK) -
 			UARTn_FRAME_DATABITS(4) + 4;


I'd suggest to add

Fixes: 3afbd89c9639 ("serial/efm32: add new driver")

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
