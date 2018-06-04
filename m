From: Mathieu Malaterre <malat@debian.org>
Date: Mon, 04 Jun 2018 12:06:45 +0000
Subject: Re: [PATCH] fsl/qe: ucc: copy and paste bug in ucc_get_tdm_sync_shift()
Message-Id: <CA+7wUszWKm+qZQ7CQu3Kn7-aYeM-hSet03_PEh8EswNn141nyw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180604115842.7c4vzge3igjbnblt@kili.mountain>
In-Reply-To: <20180604115842.7c4vzge3igjbnblt@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: qiang.zhao@nxp.com, kernel-janitors@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, LKML <linux-kernel@vger.kernel.org>, leoyang.li@nxp.com

Where did the original go ?

https://patchwork.ozlabs.org/patch/868158/


On Mon, Jun 4, 2018 at 2:02 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> There is a copy and paste bug so we accidentally use the RX_ shift when
> we're in TX_ mode.
>
> Fixes: bb8b2062aff3 ("fsl/qe: setup clock source for TDM mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis work.  Not tested.  This affects the success path, so
> we should probably test it.
>
> diff --git a/drivers/soc/fsl/qe/ucc.c b/drivers/soc/fsl/qe/ucc.c
> index c646d8713861..681f7d4b7724 100644
> --- a/drivers/soc/fsl/qe/ucc.c
> +++ b/drivers/soc/fsl/qe/ucc.c
> @@ -626,7 +626,7 @@ static u32 ucc_get_tdm_sync_shift(enum comm_dir mode, u32 tdm_num)
>  {
>         u32 shift;
>
> -       shift = (mode = COMM_DIR_RX) ? RX_SYNC_SHIFT_BASE : RX_SYNC_SHIFT_BASE;
> +       shift = (mode = COMM_DIR_RX) ? RX_SYNC_SHIFT_BASE : TX_SYNC_SHIFT_BASE;
>         shift -= tdm_num * 2;
>
>         return shift;
