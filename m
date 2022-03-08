Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48938C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Mar 2022 20:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350214AbiCHU0P (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Mar 2022 15:26:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345619AbiCHU0P (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Mar 2022 15:26:15 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D73651302
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Mar 2022 12:25:18 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id h10so494000oia.4
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Mar 2022 12:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=oDPDk3UmBsVk40ec9UZG1guo+bgLJlbyhqOvTa87J18=;
        b=ZEU3s/iBsPE/dcbZEncVtRdgyz4R+oUlZ8IFZd75aCfzqlFSkSNyCjKiT+LTsfYBHl
         Cm9iCylS8NjPhmqGyLleWV/AlIuLHWBBjfRO9YzBSGOiL+HUUoYiriTtZCjxZs0k6RSS
         JHDC2KWjdYFrWraKvKeVS8XH3ypl7yOLBoubU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=oDPDk3UmBsVk40ec9UZG1guo+bgLJlbyhqOvTa87J18=;
        b=EeMlmGs8xf/3K+WQFhJNcwYv3z1joXAzPdm1uLXTFDTiXKk8eEr6PyMpkyxjMZmXIo
         xWJj+o/ItBjMGiwvWSym0rNNwBq+4MBis1cWZt9JoWwyD3fo3Zqo+Qh/A3TjiNceCAmi
         DtNTputb2ath1v6NBvk1DMGXfTzNhOCBxBKdUiCBELjSbnFjPXJb2keYq+8OobYL57JN
         AS3IS7prVSKKbnoiC/61NtB9FEApVzE9JgXHHrWSCl93dhG0zvUtjlH4kdkKBWfcP3pN
         +YIEH8+M8KbHT8M8pxx37xjVZBgZTxMT9JdhbNsjq7csJir9u2RLkzfYzd8Zv81jqnQZ
         flhQ==
X-Gm-Message-State: AOAM532cAQwTsY1JllaaW9hP7TFxBDwYg9tc1NXuYHw6N/7yXXvMiqGh
        YKceyn6uXy3vl/QtR8oKKpgDp8AQfVgUd9DMoc6rMA==
X-Google-Smtp-Source: ABdhPJyfkvCfjSZ//u1fwsUJLWTGqZE5hW7zbIbFOcJy9M5AYS6WsphZTeYWH38/SUWdTsorovwAZS/YNjiEUrd/bVU=
X-Received: by 2002:a05:6808:220d:b0:2d4:99cb:3849 with SMTP id
 bd13-20020a056808220d00b002d499cb3849mr3846554oib.63.1646771117701; Tue, 08
 Mar 2022 12:25:17 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:25:16 -0800
MIME-Version: 1.0
In-Reply-To: <20220307133105.GA17534@kili>
References: <20220307133105.GA17534@kili>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 8 Mar 2022 12:25:16 -0800
Message-ID: <CAE-0n51by--BL=+12LtVKRY500Y_c4tZHai--bVvMERGNaUg-g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: fix cast in adreno_get_param()
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Quoting Dan Carpenter (2022-03-07 05:31:05)
> These casts need to happen before the shift.  The only time it would
> matter would be if "rev.core" is >= 128.  In that case the sign bit
> would be extended and we do not want that.
>
> Fixes: afab9d91d872 ("drm/msm/adreno: Expose speedbin to userspace")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
