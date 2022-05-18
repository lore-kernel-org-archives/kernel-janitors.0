Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FFEC433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 May 2022 17:58:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbiERR6p (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 18 May 2022 13:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241300AbiERR6n (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 May 2022 13:58:43 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79D228CCC2
        for <kernel-janitors@vger.kernel.org>; Wed, 18 May 2022 10:58:40 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-d39f741ba0so3665932fac.13
        for <kernel-janitors@vger.kernel.org>; Wed, 18 May 2022 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ELERMRaIpmuhHySx2YSWo9zl1auoeO0zCJspkCGUb8=;
        b=WztX6FXpVxtEwvPsejPooMiIoLzU5fwON21vwGO/t9GQ5IX6M+jUyx5uffisTEX1Pq
         dQYSiuFVdV10a8Sse1XFrWfWumnpbgYj67B66TlXz80YMGEKLNwgnfGa6qnaHPMeN977
         U11G1Qs9KGZqvSpcG+J8OrT4Ir2WMLItMpYG/Aobv/KjAZkdMzUpRne36BGJOvACMfbh
         f81OqNzW/bbewiK7OfmnWoafIglQyVU2EUh+6Yjv9890N62kgPYDjYt7VuuTohpsrTyJ
         J2T3YLrR/IQ+u6YbJM84I3IC2KHhdj64ULmp5LPruE+iwJ7OrB5ehHuekkZlDIrQz6Xg
         X3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ELERMRaIpmuhHySx2YSWo9zl1auoeO0zCJspkCGUb8=;
        b=lg9X8jlP61vIAUaRLty6lC/2OtHPS549Aw83hy9QCHflmive9Sw4s/UcuE8ni0iuH5
         bpYPBMFjCWdfMk16p+gGGwBRZrBPbfDyZn+pkUMu8XFa0lisVJz8hpVhc24f54oe2nbe
         TjWmJ9yGNgvPU65guL07nZdM2+JqrjjV2xlLfOvRaT+Wr4Bx1YeaJ1LW/kK6cgSBeryr
         BlRZoqDB40yW4WGhYXhzbuMRfPD5cfTIygyGFmfv1JvbkLw6z99hjKemcf/tEpyENqcX
         +nOamRNFXnl9lx8cfg+PfLQtOU8B/YemoTSXPINc4wDsKpkVb+pfOQ+dqnBNgHKYNoh1
         jArw==
X-Gm-Message-State: AOAM531HKG81j0X+Q199kvyJLUQ1w1qIHzr6Gup8Qfd6fsL+X8jEMGGy
        9ON9GSk8dCrhQwqPGueZxi7tyYV7dOaAdkwAgwI=
X-Google-Smtp-Source: ABdhPJwLIMGVcH8SUnqAp+plnUhiQH/D9DfJg9ao0cuQSwu7T8lNFtFU+MFNDxfWDF4oY0zwWaBjr83L75Ph9eL2dNc=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr402709oap.253.1652896719840; Wed, 18 May
 2022 10:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <YoUvHGsEaMtloBXN@kili>
In-Reply-To: <YoUvHGsEaMtloBXN@kili>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 18 May 2022 13:58:28 -0400
Message-ID: <CADnq5_OhtcD71Ne9uqXRNSe+_Eui=DNg8tcQeL40Ymf9C_EsMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/pm: smu_v13_0_4: delete duplicate condition
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Evan Quan <evan.quan@amd.com>, Tim Huang <tim.huang@amd.com>,
        Xiaomeng Hou <Xiaomeng.Hou@amd.com>,
        David Airlie <airlied@linux.ie>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        kernel-janitors@vger.kernel.org, Aaron Liu <aaron.liu@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Huang Rui <ray.huang@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Wed, May 18, 2022 at 1:39 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> There is no need to check if "clock_ranges' is non-NULL.  It is checked
> already on the line before.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  .../drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c  | 62 +++++++++----------
>  1 file changed, 30 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
> index 7d6ff141b43f..5a17b51aa0f9 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_4_ppt.c
> @@ -644,42 +644,40 @@ static int smu_v13_0_4_set_watermarks_table(struct smu_context *smu,
>         if (!table || !clock_ranges)
>                 return -EINVAL;
>
> -       if (clock_ranges) {
> -               if (clock_ranges->num_reader_wm_sets > NUM_WM_RANGES ||
> -                       clock_ranges->num_writer_wm_sets > NUM_WM_RANGES)
> -                       return -EINVAL;
> -
> -               for (i = 0; i < clock_ranges->num_reader_wm_sets; i++) {
> -                       table->WatermarkRow[WM_DCFCLK][i].MinClock =
> -                               clock_ranges->reader_wm_sets[i].min_drain_clk_mhz;
> -                       table->WatermarkRow[WM_DCFCLK][i].MaxClock =
> -                               clock_ranges->reader_wm_sets[i].max_drain_clk_mhz;
> -                       table->WatermarkRow[WM_DCFCLK][i].MinMclk =
> -                               clock_ranges->reader_wm_sets[i].min_fill_clk_mhz;
> -                       table->WatermarkRow[WM_DCFCLK][i].MaxMclk =
> -                               clock_ranges->reader_wm_sets[i].max_fill_clk_mhz;
> -
> -                       table->WatermarkRow[WM_DCFCLK][i].WmSetting =
> -                               clock_ranges->reader_wm_sets[i].wm_inst;
> -               }
> +       if (clock_ranges->num_reader_wm_sets > NUM_WM_RANGES ||
> +               clock_ranges->num_writer_wm_sets > NUM_WM_RANGES)
> +               return -EINVAL;
>
> -               for (i = 0; i < clock_ranges->num_writer_wm_sets; i++) {
> -                       table->WatermarkRow[WM_SOCCLK][i].MinClock =
> -                               clock_ranges->writer_wm_sets[i].min_fill_clk_mhz;
> -                       table->WatermarkRow[WM_SOCCLK][i].MaxClock =
> -                               clock_ranges->writer_wm_sets[i].max_fill_clk_mhz;
> -                       table->WatermarkRow[WM_SOCCLK][i].MinMclk =
> -                               clock_ranges->writer_wm_sets[i].min_drain_clk_mhz;
> -                       table->WatermarkRow[WM_SOCCLK][i].MaxMclk =
> -                               clock_ranges->writer_wm_sets[i].max_drain_clk_mhz;
> -
> -                       table->WatermarkRow[WM_SOCCLK][i].WmSetting =
> -                               clock_ranges->writer_wm_sets[i].wm_inst;
> -               }
> +       for (i = 0; i < clock_ranges->num_reader_wm_sets; i++) {
> +               table->WatermarkRow[WM_DCFCLK][i].MinClock =
> +                       clock_ranges->reader_wm_sets[i].min_drain_clk_mhz;
> +               table->WatermarkRow[WM_DCFCLK][i].MaxClock =
> +                       clock_ranges->reader_wm_sets[i].max_drain_clk_mhz;
> +               table->WatermarkRow[WM_DCFCLK][i].MinMclk =
> +                       clock_ranges->reader_wm_sets[i].min_fill_clk_mhz;
> +               table->WatermarkRow[WM_DCFCLK][i].MaxMclk =
> +                       clock_ranges->reader_wm_sets[i].max_fill_clk_mhz;
> +
> +               table->WatermarkRow[WM_DCFCLK][i].WmSetting =
> +                       clock_ranges->reader_wm_sets[i].wm_inst;
> +       }
>
> -               smu->watermarks_bitmap |= WATERMARKS_EXIST;
> +       for (i = 0; i < clock_ranges->num_writer_wm_sets; i++) {
> +               table->WatermarkRow[WM_SOCCLK][i].MinClock =
> +                       clock_ranges->writer_wm_sets[i].min_fill_clk_mhz;
> +               table->WatermarkRow[WM_SOCCLK][i].MaxClock =
> +                       clock_ranges->writer_wm_sets[i].max_fill_clk_mhz;
> +               table->WatermarkRow[WM_SOCCLK][i].MinMclk =
> +                       clock_ranges->writer_wm_sets[i].min_drain_clk_mhz;
> +               table->WatermarkRow[WM_SOCCLK][i].MaxMclk =
> +                       clock_ranges->writer_wm_sets[i].max_drain_clk_mhz;
> +
> +               table->WatermarkRow[WM_SOCCLK][i].WmSetting =
> +                       clock_ranges->writer_wm_sets[i].wm_inst;
>         }
>
> +       smu->watermarks_bitmap |= WATERMARKS_EXIST;
> +
>         /* pass data to smu controller */
>         if ((smu->watermarks_bitmap & WATERMARKS_EXIST) &&
>              !(smu->watermarks_bitmap & WATERMARKS_LOADED)) {
> --
> 2.35.1
>
