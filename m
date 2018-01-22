From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Jan 2018 15:45:36 +0000
Subject: Re: [PATCH 2/2] mfd/rc5t583: Improve a size determination in rc5t583_i2c_probe()
Message-Id: <20180122154536.tc45jwvlxl5gornt@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <681cd296-5d05-cdf8-f031-162d7f837b36@users.sourceforge.net>
 <144ca5ca-1cfd-28a7-7bf3-8f513d567abc@users.sourceforge.net>
In-Reply-To: <144ca5ca-1cfd-28a7-7bf3-8f513d567abc@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 15 Jan 2018, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 15 Jan 2018 14:50:25 +0100
>=20
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/rc5t583.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

--=20
Lee Jones
Linaro Services Technical Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
