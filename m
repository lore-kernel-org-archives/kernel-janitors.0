From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 22 Jan 2018 15:40:43 +0000
Subject: Re: [PATCH] mfd/janz-cmodio: Delete an error message for a failed memory allocation in cmodio_pci_pr
Message-Id: <20180122154043.xvsncovr45y52yhm@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5a66d47c-317f-1abd-7eb1-3a4f74843c78@users.sourceforge.net>
In-Reply-To: <5a66d47c-317f-1abd-7eb1-3a4f74843c78@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, 14 Jan 2018, SF Markus Elfring wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 14 Jan 2018 22:15:09 +0100
>=20
> Omit an extra message for a memory allocation failure in this function.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/mfd/janz-cmodio.c | 4 +---
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
