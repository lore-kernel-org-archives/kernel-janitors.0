From: Lee Jones <lee.jones@linaro.org>
Date: Wed, 29 Nov 2017 10:59:22 +0000
Subject: Re: [PATCH] mfd: ti_am335x_tscadc: remove redundant assignment to node
Message-Id: <20171129105922.7fd6jsmlry4sxvhj@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171029125851.5727-1-colin.king@canonical.com>
In-Reply-To: <20171029125851.5727-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 29 Oct 2017, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Node is being initialized a value that is never read, it is
> being written over a few statements into the function with
> the return value from call to of_get_child_by_name. Hence
> this initialization can be removed. Cleans up clang warning:
>=20
> drivers/mfd/ti_am335x_tscadc.c:127:22: warning: Value stored
> to 'node' during its initialization is never read
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mfd/ti_am335x_tscadc.c | 2 +-
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
