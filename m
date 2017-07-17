From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 17 Jul 2017 11:01:09 +0000
Subject: Re: [PATCH 5/9] mfd: Drop unnecessary static
Message-Id: <20170717110109.c53tmzvvcd64f7c4@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
 <1493928654-18768-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1493928654-18768-6-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Tony Lindgren <tony@atomide.com>, keescook@chromium.org, kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 04 May 2017, Julia Lawall wrote:

> Drop static on a local variable, when the variable is initialized before
> any use, on every possible execution path through the function.
>=20
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @bad exists@
> position p;
> identifier x;
> type T;
> @@
>=20
> static T x@p;
> ...
> x =3D <+...x...+>
>=20
> @@
> identifier x;
> expression e;
> type T;
> position p !=3D bad.p;
> @@
>=20
> -static
>  T x@p;
>  ... when !=3D x
>      when strict
> ?x =3D e;
> // </smpl>
>=20
> The change increases the code size but decreases the size of the bss segm=
ent.
>=20
> before:
>    text    data     bss     dec     hex filename
>    3369     272     300    3941     f65 drivers/mfd/twl4030-irq.o
>=20
> after:
>    text    data     bss     dec     hex filename
>    3401     272      28    3701     e75 drivers/mfd/twl4030-irq.o
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
>  drivers/mfd/twl4030-irq.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
