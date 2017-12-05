From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 05 Dec 2017 08:32:11 +0000
Subject: Re: [PATCH][next] misc: rtsx: rts5260: make several functions static
Message-Id: <20171205083211.nhpsmhnati6blynz@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171204121238.4751-1-colin.king@canonical.com>
In-Reply-To: <20171204121238.4751-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Daniel Bristot de Oliveira <bristot@redhat.com>, Rui Feng <rui_feng@realsil.com.cn>, Stephen Rothwell <sfr@canb.auug.org.au>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 04 Dec 2017, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Several functios are local to the source and do not need to be in global
> scope, so make them static.
>=20
> Cleans up sparse warnings:
> symbol 'rts5260_get_ocpstat' was not declared. Should it be static?
> symbol 'rts5260_get_ocpstat2' was not declared. Should it be static?
> symbol 'rts5260_clear_ocpstat' was not declared. Should it be static?
> symbol 'rts5260_process_ocp' was not declared. Should it be static?
> symbol 'rts5260_init_hw' was not declared. Should it be static?
> symbol 'rts5260_set_aspm' was not declared. Should it be static?
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/misc/cardreader/rts5260.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Acked-by: Lee Jones <lee.jones@linaro.org>

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
