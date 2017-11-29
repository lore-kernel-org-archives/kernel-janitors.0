From: Lee Jones <lee.jones@linaro.org>
Date: Wed, 29 Nov 2017 10:59:52 +0000
Subject: Re: [PATCH] mfd: ab8500-debugfs: Use common error handling code in ab8500_print_modem_registers()
Message-Id: <20171129105952.pf6lywfqfsnmcnni@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7af3098c-21fd-aa16-237f-0359d312cac7@users.sourceforge.net>
In-Reply-To: <7af3098c-21fd-aa16-237f-0359d312cac7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Fri, 27 Oct 2017, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 27 Oct 2017 17:20:45 +0200
>=20
> Add jump targets so that two error messages are stored only once
> at the end of this function implementation.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/ab8500-debugfs.c | 35 +++++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 16 deletions(-)

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
