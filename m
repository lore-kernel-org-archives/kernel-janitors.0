From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 05 Dec 2017 08:31:48 +0000
Subject: Re: [PATCH] misc: rtsx: make several functions static
Message-Id: <20171205083148.gtfc2ayn5kmmyok7@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171204124329.5569-1-colin.king@canonical.com>
In-Reply-To: <20171204124329.5569-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Rui Feng <rui_feng@realsil.com.cn>, Daniel Bristot de Oliveira <bristot@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 04 Dec 2017, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
>=20
> Several functions are local to the source and do not need to be in global
> scope, so make them static.
>=20
> Cleans up sparse warnings:
> symbol 'rtsx_pm_power_saving' was not declared. Should it be static?
> symbol 'rtsx_set_l1off_sub_cfg_d0' was not declared. Should it be static?
> symbol 'rtsx_pm_full_on' was not declared. Should it be static?
> symbol 'rtsx_comm_set_ltr_latency' was not declared. Should it be static?
> symbol 'rtsx_pci_process_ocp' was not declared. Should it be static?
> symbol 'rtsx_pci_process_ocp_interrupt' was not declared. Should it be
> static?
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/misc/cardreader/rtsx_pcr.c | 12 ++++++------
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
