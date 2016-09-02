From: Nicolas Ferre <nicolas.ferre@atmel.com>
Date: Fri, 02 Sep 2016 07:55:51 +0000
Subject: Re: [PATCH 2/9] tty/serial: at91: constify uart_ops structures
Message-Id: <931065fc-5304-a0d5-1cde-b02bc5dc4b21@atmel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472752298-981-1-git-send-email-Julia.Lawall@lip6.fr>
 <1472752298-981-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1472752298-981-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org

Le 01/09/2016 =E0 19:51, Julia Lawall a =E9crit :
> Check for uart_ops structures that are only stored in the ops field of a
> uart_port structure.  This field is declared const, so uart_ops structures
> that have this property can be declared as const also.
>=20
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct uart_ops i@p =3D { ... };
>=20
> @ok@
> identifier r.i;
> struct uart_port e;
> position p;
> @@
> e.ops =3D &i@p;
>=20
> @bad@
> position p !=3D {r.p,ok.p};
> identifier r.i;
> struct uart_ops e;
> @@
> e@i@p
>=20
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
> static
> +const
>  struct uart_ops i =3D { ... };
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Thanks Julia.
Bye,

> ---
>  drivers/tty/serial/atmel_serial.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel=
_serial.c
> index 2eaa18d..963a72f 100644
> --- a/drivers/tty/serial/atmel_serial.c
> +++ b/drivers/tty/serial/atmel_serial.c
> @@ -2292,7 +2292,7 @@ static void atmel_poll_put_char(struct uart_port *p=
ort, unsigned char ch)
>  }
>  #endif
> =20
> -static struct uart_ops atmel_pops =3D {
> +static const struct uart_ops atmel_pops =3D {
>  	.tx_empty	=3D atmel_tx_empty,
>  	.set_mctrl	=3D atmel_set_mctrl,
>  	.get_mctrl	=3D atmel_get_mctrl,
>=20
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
