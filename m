From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 23 Jan 2018 09:51:24 +0000
Subject: Re: [PATCH 1/2] mfd: smsc-ece1099: Delete an error message for a failed memory allocation in smsc_i2
Message-Id: <20180123095124.ykuy6ci573otrk7c@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <978023d9-01f2-3a16-5eba-e06b8359cfc0@users.sourceforge.net>
 <6be526f1-cf39-9fa9-3508-ac75c9751986@users.sourceforge.net>
In-Reply-To: <6be526f1-cf39-9fa9-3508-ac75c9751986@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 16 Jan 2018, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 16 Jan 2018 08:52:27 +0100
>=20
> Omit an extra message for a memory allocation failure in this function.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/smsc-ece1099.c | 4 +---
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
