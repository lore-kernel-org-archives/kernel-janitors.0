From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 07 Sep 2017 07:56:12 +0000
Subject: Re: [PATCH] mfd: stw481x: make three arrays static const, reduces object code size
Message-Id: <20170907075612.oijcvnxjymygb22p@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170905112712.15779-1-colin.king@canonical.com>
In-Reply-To: <20170905112712.15779-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 05 Sep 2017, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Don't populate the arrays vcore_val, vpll_val and vaux_val on the
> stack, instead make them static const.  Makes the object code smaller
> by over 370 bytes:
>=20
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    6971	   3248	     64	  10283	   282b	drivers/mfd/stw481x.o
>=20
> After:
>    text	   data	    bss	    dec	    hex	filename
>    6338	   3504	     64	   9906	   26b2	drivers/mfd/stw481x.o
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mfd/stw481x.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Applied for v4.15, thanks.

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
