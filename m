Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C541DC00140
	for <kernel-janitors@archiver.kernel.org>; Tue, 26 Jul 2022 15:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233721AbiGZPVQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 26 Jul 2022 11:21:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235433AbiGZPVP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 26 Jul 2022 11:21:15 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97290B4B8
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Jul 2022 08:21:13 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id j22so26804259ejs.2
        for <kernel-janitors@vger.kernel.org>; Tue, 26 Jul 2022 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nxE9dsdGfDUY/VfyIGG78mRxftlTU10K9gu1mEdo23Y=;
        b=ckMsRWr7YlkkzqeotkXcQtA7HHUMtrEG1XOKqcn3ixg+LTElRxlGNOh1TJ4Vqmusjp
         FaWwwzi5motga55a6BO6798OiIcBw3oGhqyt7okLN+Pv0nbRo07z29z+CEWNQjzBpa7C
         LgUkYc8+5P0mQMPa5VrBbVExWIeXWxQY/mzw6ozznpkk17vbZdn423yRV8JsE2G14V3L
         4C6gbJO3u+GZoOijmGrnok1TVVaYGpk9pnsTKqrXiUkPg32ziMCBnI2LM3+9B2aYqYBx
         bQ/RC2pCEv5iCyL/y1cKm1PsNy5UFg1RsWxL2EhmJfmiSeyGMIWSgAEFjqBk+vVziVr2
         pJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nxE9dsdGfDUY/VfyIGG78mRxftlTU10K9gu1mEdo23Y=;
        b=f+jkzkBVh8lMw4YDQHTW0LPGolFpT19/Np+XSOLAtPZOAw8pz+Qwfh3XtZUsUW5bK2
         wonwMdNxz7M5MsuU6reOd/QOMlR1eJwCotH3XnfZnB6xSvPhTGzr+FeIzUEjhoupBPHR
         CmimPd0fcbT6tvkebY0tGVKztVblTBLocU7djsIDUcyiTGaho5/J9ro1sPGz3psCBxJb
         MALUK1PuJs7wzSSKpz5d4iCw0uf0Z6GCn+WW/hjUUuRsC/vnBJyH3lYGUCR9VXu2SUKy
         a2NZawGgVKRVbPzu22iLipcbwwW+AtOUuwBQN6C/BAqi9+mBmjn/g+pGJ3N+fXKgqU0v
         aUTQ==
X-Gm-Message-State: AJIora8+k6/2dYG8O6oxFWLnple4LtWx2k6hPlv7Xm5XvnVmliaCDDGK
        MGMe/lD/LXiErrQrzK3uWc/rof7i/vBgMXrwVxU=
X-Google-Smtp-Source: AGRyM1teIkHeseea0bqiju3SGyrsx2ZDIHXTB0cU3k/9ys8L6lcyHdytDzruS9TDDHKYDti27AB0/6kbTwyU9XD+Ego=
X-Received: by 2002:a17:907:a06f:b0:72b:564c:465b with SMTP id
 ia15-20020a170907a06f00b0072b564c465bmr14522939ejc.344.1658848872115; Tue, 26
 Jul 2022 08:21:12 -0700 (PDT)
MIME-Version: 1.0
References: <YuAFEwKmf1uJz0e3@kili>
In-Reply-To: <YuAFEwKmf1uJz0e3@kili>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 26 Jul 2022 11:21:00 -0400
Message-ID: <CADnq5_PJvsOUxXa-eQB8P8y0arN+tjTawm8Cw-R=QPzk60BEEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix signedness bug in execute_synaptics_rc_command()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Harry Wentland <harry.wentland@amd.com>,
        Ian Chen <ian.chen@amd.com>, Leo Li <sunpeng.li@amd.com>,
        kernel-janitors@vger.kernel.org,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Roman Li <Roman.Li@amd.com>, amd-gfx@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        Fangzhi Zuo <Jerry.Zuo@amd.com>,
        Claudio Suarez <cssk@net-c.es>,
        Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Hersen Wu <hersenxs.wu@amd.com>,
        Mikita Lipski <mikita.lipski@amd.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Applied.  Thanks!

Alex

On Tue, Jul 26, 2022 at 11:16 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "ret" variable needs to be signed for the error handling to work.
>
> Fixes: 2ca97adccdc9 ("drm/amd/display: Add Synaptics Fifo Reset Workaround")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index d66e3cd64ebd..a0154a5f7183 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -569,7 +569,7 @@ static bool execute_synaptics_rc_command(struct drm_dp_aux *aux,
>         unsigned char rc_cmd = 0;
>         unsigned char rc_result = 0xFF;
>         unsigned char i = 0;
> -       uint8_t ret = 0;
> +       int ret;
>
>         if (is_write_cmd) {
>                 // write rc data
> --
> 2.35.1
>
