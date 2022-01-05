Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5136EC433F5
	for <kernel-janitors@archiver.kernel.org>; Wed,  5 Jan 2022 20:09:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243897AbiAEUJi (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 5 Jan 2022 15:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243847AbiAEUJa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 5 Jan 2022 15:09:30 -0500
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E24C061212
        for <kernel-janitors@vger.kernel.org>; Wed,  5 Jan 2022 12:09:29 -0800 (PST)
Received: by mail-oi1-x22e.google.com with SMTP id r131so627785oig.1
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Jan 2022 12:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=w5io1mhY/CuWn+JWdMxz5VGckhBoDiBFygEqCAudt+0=;
        b=ByFqQpR9BH6VLpD3Y7uVEe2w3xHpWWTCubZouHyzxghEmg+Cg5+b0oATDt3XwiDioS
         5ekjUrLOwlH+49O9isEHigY9nkIyzRk9KtOZ2sQXGBVjLEzIOmGJqJVXQaRj/1Ai8db2
         XRcKHZbdgV1yqyNRhIzuRRdkKz6LyvHfMMj94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=w5io1mhY/CuWn+JWdMxz5VGckhBoDiBFygEqCAudt+0=;
        b=oiSDZC58XAGVHV9uByr9G+ahUxX9hY598oxaabFpr4lF0YVNtalT8s9dJR8uTPiKyK
         XSNhsNaRJWAUtd4sL8DVdh1j8xHD0D3UQsFODX/lPQsrvhfuRtFCDwLHs4SfQcz78iVd
         jNM1SY22Utg0GxP2iP7vC9d0EIQas3MOwX4cfcTqNKk9T6Ser6Y+W8E2757RsUEExKBx
         ji1Qf0Iu7aqrwzTRRIK6o5n7ra4xphHrpIVM91f90IeMi56X3/EMomat6+UQ0s9RMmHP
         dG89Fl5IKov8PPNDUVAGxECXb/MLmjkdF/k9jn6MpimbiUWJaajUyH8esAT61gf2oDLA
         g/eA==
X-Gm-Message-State: AOAM533Fgj7KoqcW0VGfFc9utKV3Yl/5ES0UvilMAXAxqI1nfs/9hWKP
        ZW+dhoGgtOSJ9SUmxMvWn8719x9U+BlhfwVtOqLaTw==
X-Google-Smtp-Source: ABdhPJwjz8XD8bGgh/xlrvEPoae5Md2PsKfYPTixPnc9jD7I2Lt5h5lXbD1+Ynwc+vpJk77ax73vcuCTauiJOOoyfkY=
X-Received: by 2002:aca:4382:: with SMTP id q124mr3813128oia.64.1641413369023;
 Wed, 05 Jan 2022 12:09:29 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 12:09:28 -0800
MIME-Version: 1.0
In-Reply-To: <6fd20c8779d6b03a5b54509af25b478049482087.1640531508.git.christophe.jaillet@wanadoo.fr>
References: <6fd20c8779d6b03a5b54509af25b478049482087.1640531508.git.christophe.jaillet@wanadoo.fr>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 5 Jan 2022 12:09:28 -0800
Message-ID: <CAE-0n52jDxkfYbsQPzKjSeD4rimTz1p2gaDRFpK-LLxxNV31Ow@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Fix a potential double free in an error
 handling path
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
        robdclark@gmail.com, sean@poorly.run
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Christophe JAILLET (2021-12-26 07:14:05)
> 'dp_bridge' is devm_alloc'ed, so there is no need to free it explicitly or
> there will be a double free().
>
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
