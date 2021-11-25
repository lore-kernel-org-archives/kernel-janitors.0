Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813B9C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Nov 2021 10:10:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354476AbhKYKNk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 Nov 2021 05:13:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351669AbhKYKLi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Nov 2021 05:11:38 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8EFC061763
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Nov 2021 02:08:27 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id q17so4153461plr.11
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Nov 2021 02:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dpnu1/6yOkuuCH/ZN6WkNINuR/8m8h6zVVSJwYoqYq0=;
        b=GDGjyl56MydM000AjpIcyCHg6ib0vb3fgxBUv2+ozwRpG3KpT6kZZ51krmIFnhkseI
         x9mMd23ZLT27XqgC76hqEkmseCkvxxQDOd0SMo2yhmCQpzEAmqDnUVAOp4C5nN8dcrdi
         oaAVZM/JycIvHAoUkf94SYuE+r6QDlfizgDRgCIYc5xQ+XEj1cfReEK1P6iak3G1q9kr
         XjkK0cP6YMDaJbe50jK4ZotR8uNdE9/Ufzy2TZ+dgR/j5MJa6cdAeuOZweMPFwdoK5d0
         fXPUK3jCDbE8ck6d8GbbRTmrkx1li1pr6c71Z0o/LWHZ91CSzQjNhCmQKHWV7INtGBeB
         U2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dpnu1/6yOkuuCH/ZN6WkNINuR/8m8h6zVVSJwYoqYq0=;
        b=sRZSZTs8Se2Cu2Qdc48GudDtGBKDEX59U1q2K/QY/A39/0CM4XV/Pck2YlGVN1jwkn
         k4iRbUepLwCMQlHinynPF1qRJKaqXBLvtyJhhm0SRFhqR3eWVQyt5EYZm46MDEK+yQlm
         pluK1JmK1R2b1tCf1M4CdfVv1lzWCNZgYG7FIG2GejBbf95XYXQJOLMQGjbtA+rdQp18
         Ib7zoj0B8DFRrdH0idplE+FnTLEw+17toyybGByDvCJZdP0L8YtLUdVm6eoCrUk3EUEp
         MM0Px9iqdd7Ki5o4bS5tl9sB4yvTsXXcINWJtqJYakGeCKiaY6jMr7/FnOfkPCnxP4ua
         Ft2Q==
X-Gm-Message-State: AOAM532ymBaYd8zeKlAYUvHYonbNAljqtXXCHBadQcooNhwU6AwGQbnL
        DJTLrxZGOXclGvtpZ/TTi3ZDsFfR6ykdPlYHDIgfRw==
X-Google-Smtp-Source: ABdhPJz+NTXqZHw+mAr5aK8WO0aa5tYnZafpMCG8SxZ8nd297hrIXq/zBL7KVwlJS/KtNmoEyjg0bBr49xYaV3M9w18=
X-Received: by 2002:a17:903:2004:b0:142:6344:2c08 with SMTP id
 s4-20020a170903200400b0014263442c08mr27504855pla.51.1637834907420; Thu, 25
 Nov 2021 02:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20211124145219.GD13656@kili> <YZ9GYUrBvmCQaZtg@google.com>
In-Reply-To: <YZ9GYUrBvmCQaZtg@google.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 25 Nov 2021 11:08:16 +0100
Message-ID: <CAG3jFytY6KB+u+nji5tse81AJkiE1gP+6d7XvooheQwjqvw6Rg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: fix an error code in anx7625_register_audio()
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Xin Ji <xji@analogixsemi.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 25 Nov 2021 at 09:16, Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Wed, Nov 24, 2021 at 05:52:19PM +0300, Dan Carpenter wrote:
> > This code accidentally returns IS_ERR(), which is 1, instead of
> > propagating the negative error code.  The caller doesn't check for
> > errors so it doesn't affect run time at all.
> >
> > Fixes: 566fef1226c1 ("drm/bridge: anx7625: add HDMI audio function")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

Applied to drm-misc-next.
