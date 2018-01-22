From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Jan 2018 15:45:58 +0000
Subject: Re: [PATCH 1/3] mfd/sm501: Delete an error message for a failed memory allocation in two functions
Message-Id: <20180122154558.sfknp2eyshecchs3@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f292e2f3-2471-4ea0-3a02-349e6c10ff03@users.sourceforge.net>
 <132f079f-8f99-329f-105b-91542ed7fcca@users.sourceforge.net>
In-Reply-To: <132f079f-8f99-329f-105b-91542ed7fcca@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, 15 Jan 2018, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 15 Jan 2018 15:40:46 +0100
>=20
> Omit an extra message for a memory allocation failure in these functions.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/sm501.c | 2 --
>  1 file changed, 2 deletions(-)

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
