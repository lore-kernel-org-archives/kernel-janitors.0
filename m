From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Oct 2020 21:59:58 +0000
Subject: Re: [PATCH][next] drm/amd/pm: fix out-of-bound read on pptable->SkuReserved
Message-Id: <CADnq5_N8FkB1bjhrfVi2EvRbKdDSgKOCm37zdmXACnTLSx6krw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201028124316.109886-1-colin.king@canonical.com>
In-Reply-To: <20201028124316.109886-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>

Applied.  Thanks!

On Wed, Oct 28, 2020 at 8:43 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> A recent change added two uint16_t elements to PPTable_t and reduced the
> uint32_t array down to 8 elements. This results in the dev_info printing
> of pptable->SkuReserved[8] accessing a value that is out-of-range on
> array SkuReserved.  The array has been shrunk by 1 element, so remove
> this extraneous dev_info message.
>
> Addresses-Coverity: ("Out-of-bounds read")
> Fixes: 1dc3c5a95b08 ("drm/amd/pm: update driver if file for sienna cichlid")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> index fa3842f460fc..0600befc6e4c 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> @@ -2279,7 +2279,6 @@ static void sienna_cichlid_dump_pptable(struct smu_context *smu)
>         dev_info(smu->adev->dev, "SkuReserved[5] = 0x%x\n", pptable->SkuReserved[5]);
>         dev_info(smu->adev->dev, "SkuReserved[6] = 0x%x\n", pptable->SkuReserved[6]);
>         dev_info(smu->adev->dev, "SkuReserved[7] = 0x%x\n", pptable->SkuReserved[7]);
> -       dev_info(smu->adev->dev, "SkuReserved[8] = 0x%x\n", pptable->SkuReserved[8]);
>
>         dev_info(smu->adev->dev, "GamingClk[0] = 0x%x\n", pptable->GamingClk[0]);
>         dev_info(smu->adev->dev, "GamingClk[1] = 0x%x\n", pptable->GamingClk[1]);
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
