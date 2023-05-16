Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8591FC77B75
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 May 2023 06:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjEPGv4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 May 2023 02:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjEPGvu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 May 2023 02:51:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DB084C04
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 23:51:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D8F2E634CF
        for <kernel-janitors@vger.kernel.org>; Tue, 16 May 2023 06:51:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F74FC433A1
        for <kernel-janitors@vger.kernel.org>; Tue, 16 May 2023 06:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684219865;
        bh=IkZg8YuVR0z291tuCohZ+wRhpmpjm4lfGrB34UI5SDo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hZ+ELW+fB7bDvJIClEqT9+kuhMUajcNmEq8fBMo8VmOhM6wLKSCzVOzHQ/adVGVOx
         A9BhVxGMD6mMl1n7t+nH30qzTMCFoUoOScJCF4/QTIV7WUZInbkUcGcNrB1CEcVerN
         InK4qwBiLByZN6W9jLbNIjSg7h6OtJUaxbw6JkSJqOVZSvChPT67vhe5OlWXgTugoA
         JNmfbAxY3N5QnhmxFaubBFFYy+Fe4f8A4HaBccKXbBUmW2vTt6XYAlYkBV3DbXbydl
         YBz0g1EsSbtmh3q4ptO9acaJXz2ASLrnGwqZlh9WNWK8T+amedj9Q2VVOw2or03TNk
         lllnZSc2OriQw==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ba716790926so6460532276.2
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 23:51:05 -0700 (PDT)
X-Gm-Message-State: AC+VfDwCbS/59HVHrCYQSTpkYewVz4cDiSWDoyrWe833s0h57nWdSLAB
        5dNUwG/rs3jbsl0iKcA1EjcL/vNyU24x0rrvTgQ=
X-Google-Smtp-Source: ACHHUZ4a9KZJ8XZEL5c3IdYm3Bkcyp9oxp3+hYzZRUcROSDj+f3YzXAfZpNIUg8O489RML2IuChzYkmxBtkvC5CczfQ=
X-Received: by 2002:a25:21c1:0:b0:ba7:4134:87b9 with SMTP id
 h184-20020a2521c1000000b00ba7413487b9mr9079659ybh.51.1684219864342; Mon, 15
 May 2023 23:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <c8000ec5-18e9-4e25-aeb1-3a6ce467d5f6@kili.mountain>
In-Reply-To: <c8000ec5-18e9-4e25-aeb1-3a6ce467d5f6@kili.mountain>
From:   Oded Gabbay <ogabbay@kernel.org>
Date:   Tue, 16 May 2023 09:50:37 +0300
X-Gmail-Original-Message-ID: <CAFCwf11HeVNW-3HVpN639+Ky9Ad9iWeA26u1PCT_eq7TkaY34Q@mail.gmail.com>
Message-ID: <CAFCwf11HeVNW-3HVpN639+Ky9Ad9iWeA26u1PCT_eq7TkaY34Q@mail.gmail.com>
Subject: Re: [PATCH] accel/habanalabs: fix gaudi2_get_tpc_idle_status() return
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Koby Elbaz <kelbaz@habana.ai>, Ofir Bitton <obitton@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Dani Liberman <dliberman@habana.ai>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        Dafna Hirschfeld <dhirschfeld@habana.ai>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 15, 2023 at 1:32=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The gaudi2_get_tpc_idle_status() function returned the incorrect variable
> so it always returned true.
>
> Fixes: d85f0531b928 ("accel/habanalabs: break is_idle function into per-e=
ngine sub-routines")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> From static analysis.  Not tested.
>
>  drivers/accel/habanalabs/gaudi2/gaudi2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/hab=
analabs/gaudi2/gaudi2.c
> index b778cf764a68..5539c84ee717 100644
> --- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
> +++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
> @@ -7231,7 +7231,7 @@ static bool gaudi2_get_tpc_idle_status(struct hl_de=
vice *hdev, u64 *mask_arr, u8
>
>         gaudi2_iterate_tpcs(hdev, &tpc_iter);
>
> -       return tpc_idle_data.is_idle;
> +       return *tpc_idle_data.is_idle;
>  }
>
>  static bool gaudi2_get_decoder_idle_status(struct hl_device *hdev, u64 *=
mask_arr, u8 mask_len,
> --
> 2.39.2
>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Applied to -next.
Thanks,
Oded
