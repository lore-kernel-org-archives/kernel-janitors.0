Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E64FC6FD18
	for <kernel-janitors@archiver.kernel.org>; Tue, 25 Apr 2023 13:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233888AbjDYNbU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 25 Apr 2023 09:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234189AbjDYNbH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 25 Apr 2023 09:31:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5911D13FB7
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Apr 2023 06:31:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 816CB62E83
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Apr 2023 13:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B0AC43445
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Apr 2023 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682429462;
        bh=wmID8emQw+is79zlL5AF9o/8qFWaAe9tV8o9bZxfmd8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fxGwf6b9V0b29A2x9MYnoTsl71mf4LD1BQ5xiSM87TifE9z+pWZOrX+W2UgCNWodL
         LDAckxfK7xvn5rR3VGWy7Xf9PjSO/4Gc26E0cEDgdVhBMNHS5kcPxdxQh06Ilqfybb
         ohF0NOnTIRVVfTTOUB5OKFBf1WBzmhWjo2ZeoOqSFFdkfonHXrywEgr1kkHur0paBC
         WjwYMBBGYQAGJ4drv36Zn11BsfiIhkIh8pdIb3SlTVEhoWT6YA635pCaJW4z7mxoVH
         IIFvFUJp4nALyM0B8XIQ5mkCFxAHt0KvfOaxyQccLSpyJc0w5MyCrqaJIpbvBmdWm5
         ZWt2L5dzcDSNA==
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-63b4a64c72bso4624132b3a.0
        for <kernel-janitors@vger.kernel.org>; Tue, 25 Apr 2023 06:31:02 -0700 (PDT)
X-Gm-Message-State: AAQBX9eRi3Tx/Hc4IbGak9fMXJoI8ZBlxlwfHojeS3u6Z32rSD+NrSIV
        FHFVZrSMnzjBC7tMKwnqr5zxUnZcPfWHELWIA+wiwA==
X-Google-Smtp-Source: AKy350aIvPvFU11G6qOuvvWHhyxXmANsSsmKypyebe+yKmS7qPVlrUVJUhVNvRKDlhe6tff+0goq4lc4uY0rFxX3mp8=
X-Received: by 2002:a05:6a20:3d94:b0:f3:6b70:2dd7 with SMTP id
 s20-20020a056a203d9400b000f36b702dd7mr12684872pzi.34.1682429462222; Tue, 25
 Apr 2023 06:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de> <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <14636275-4d26-d639-5f6e-293fc6d1c4c6@web.de>
In-Reply-To: <14636275-4d26-d639-5f6e-293fc6d1c4c6@web.de>
From:   Robert Foss <rfoss@kernel.org>
Date:   Tue, 25 Apr 2023 15:30:51 +0200
X-Gmail-Original-Message-ID: <CAN6tsi7caOQZLLvbL7phMEtNvBLaWgJuHLkLo3YWdqQw7Vxnaw@mail.gmail.com>
Message-ID: <CAN6tsi7caOQZLLvbL7phMEtNvBLaWgJuHLkLo3YWdqQw7Vxnaw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: it6505: Move a variable assignment behind a
 null pointer check in receive_timing_debugfs_show()
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Allen Chen <allen.chen@ite.com.tw>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Hermes Wu <hermes.wu@ite.com.tw>,
        Hsin-yi Wang <hsinyi@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hey Markus,

This patch seems to be a part of a series without being marked as
such, this causes issues when importing this patch with maintainer
tools like b4 which automatically pull in the entire series and not
just the specific patch. Either label the patch as being part of a
series ( [PATCH 1/XX] ), or submit it separately.

On Sun, Apr 16, 2023 at 5:47=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> Date: Sun, 16 Apr 2023 17:30:46 +0200
>
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the function =E2=80=9Creceive_timing_debugfs_show=E2=80=9D.
>
> Thus avoid the risk for undefined behaviour by moving the assignment
> for the variable =E2=80=9Cvid=E2=80=9D behind the null pointer check.
>
> This issue was detected by using the Coccinelle software.
>
> Fixes: b5c84a9edcd418cd055becad6a22439e7c5e3bf8 ("drm/bridge: add it6505 =
driver")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

The email in the Signed-off tag should match the email of the sender,
which it doesn't.

With the two above issues fixed, please add my r-b.
Reviewed-by: Robert Foss <rfoss@kernel.org>

> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge=
/ite-it6505.c
> index abaf6e23775e..45f579c365e7 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3207,7 +3207,7 @@ static ssize_t receive_timing_debugfs_show(struct f=
ile *file, char __user *buf,
>                                            size_t len, loff_t *ppos)
>  {
>         struct it6505 *it6505 =3D file->private_data;
> -       struct drm_display_mode *vid =3D &it6505->video_info;
> +       struct drm_display_mode *vid;
>         u8 read_buf[READ_BUFFER_SIZE];
>         u8 *str =3D read_buf, *end =3D read_buf + READ_BUFFER_SIZE;
>         ssize_t ret, count;
> @@ -3216,6 +3216,7 @@ static ssize_t receive_timing_debugfs_show(struct f=
ile *file, char __user *buf,
>                 return -ENODEV;
>
>         it6505_calc_video_info(it6505);
> +       vid =3D &it6505->video_info;
>         str +=3D scnprintf(str, end - str, "---video timing---\n");
>         str +=3D scnprintf(str, end - str, "PCLK:%d.%03dMHz\n",
>                          vid->clock / 1000, vid->clock % 1000);
> --
> 2.40.0
>
