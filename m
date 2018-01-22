From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Jan 2018 15:45:17 +0000
Subject: Re: [PATCH 1/2] mfd/rc5t583: Delete an error message for a failed memory allocation in rc5t583_i2c_p
Message-Id: <20180122154517.irwjh5sehg424bvt@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <681cd296-5d05-cdf8-f031-162d7f837b36@users.sourceforge.net>
 <c9a59f0e-5219-8e23-209a-300a8b2e65f3@users.sourceforge.net>
In-Reply-To: <c9a59f0e-5219-8e23-209a-300a8b2e65f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 15 Jan 2018, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 15 Jan 2018 14:48:57 +0100
>=20
> Omit an extra message for a memory allocation failure in this function.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/rc5t583.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

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
