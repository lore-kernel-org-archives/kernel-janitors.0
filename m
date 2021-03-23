Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E91C433C1
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 Mar 2021 17:16:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1EC8619C1
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 Mar 2021 17:16:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbhCWRPq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 Mar 2021 13:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229868AbhCWRPp (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 Mar 2021 13:15:45 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE43C061574
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Mar 2021 10:15:45 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id c8so8675707wrq.11
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Mar 2021 10:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jkD/89hzNsqmkTz0cgn45+3G97+hdN9w0MYvdcADVJY=;
        b=h8rraCmPEqparAn5HJ+4/mzapBhqLvKpCahb5I3lLD89c+5vSx0qm5c/WvW7Hkg0QW
         vLuQyjlK6th2ka7h1zdWq2tmQMvAueieDzg2NMMFh/wTs+KFqeDjfk8lMmtIsSDInfkj
         hgumkG5eOb9/9AvlNf9fzgg5pyrhWZAfJFjsgYr7T/qefxwDnXtc/szmhIhYx8BvhfHa
         5Ab99TVj4UW5nyy0ZNc0XDiExScRPMt0UBdDfxHlVqOGJRB6auO/+tvXmAP6dPMWr+wN
         J9ybc4PVrTZFO2L6EUnKoiv15Dx12limTVkfQqobEnnMtgbSy9vwB9+4RA9s9Cjouc2r
         +FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jkD/89hzNsqmkTz0cgn45+3G97+hdN9w0MYvdcADVJY=;
        b=jMl7NkPWXKghN7I4Vzj5h66rCpmcyEomFUjxR9N5LBTU+bSbztcuzaDcg6j1DD3nXF
         F4814uJvJXd9wj7PgAkSSylyofx3JXiXBc8rnfrxKMdnz06dOQtU0GDdluTwkoF+tWRF
         iZPh1JcHuHzUQNvMPNp/3Jd2Qzuw2D2+6bTEqm49uBUj1eQoDfy+PUVADEzH5ZZijpWu
         fTwuX6JGhaCRLp8HjmDX0qBHTzhlNayqtCHZnWbtHjtmZ7/uIVnTkG5f7b5ZOhXSd5JP
         M/Zk+rEEjtKn0Jtm9ROBuPwEjF3+FYmlic0mQtXvIfovQN3/YJ/ir4s9vHPAfSPj4HUN
         +fSg==
X-Gm-Message-State: AOAM532eYVzfMwV5w2Z7qdWXpW9/oQdvrleZUPGbXKl8ZXrINmqe35su
        6aigSvfPERqGNACcsq07KZjKbQ==
X-Google-Smtp-Source: ABdhPJzWk/7mbyRrWGJqZM8T40XSMeZ7AZ+LrfMOt0Jd/pLxU2JubXbpvZ4enfFd1MIJMNCEbK4leQ==
X-Received: by 2002:adf:e68e:: with SMTP id r14mr4985288wrm.273.1616519744011;
        Tue, 23 Mar 2021 10:15:44 -0700 (PDT)
Received: from dell ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id g15sm2957207wmq.31.2021.03.23.10.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 10:15:43 -0700 (PDT)
Date:   Tue, 23 Mar 2021 17:15:41 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/amd/display/dc/calcs/dce_calcs: Fix allocation
 size for dceip and vbios
Message-ID: <20210323171541.GX2916463@dell>
References: <20210323141541.348376-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210323141541.348376-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 23 Mar 2021, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the allocations for dceip and vbios are based on the size of
> the pointer rather than the size of the data structures, causing heap
> issues. Fix this by using the correct allocation sizes.
> 
> Addresses-Coverity: ("Wrong size of argument")
> Fixes: a2a855772210 ("drm/amd/display/dc/calcs/dce_calcs: Remove some large variables from the stack")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/display/dc/calcs/dce_calcs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Fixed already mate.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
