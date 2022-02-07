Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DB6C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Feb 2022 16:22:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235985AbiBGQWd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Feb 2022 11:22:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346383AbiBGQVN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Feb 2022 11:21:13 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79BB2C0401D2
        for <kernel-janitors@vger.kernel.org>; Mon,  7 Feb 2022 08:21:11 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id k18so25756485wrg.11
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Feb 2022 08:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Np4LH/PHz6uNkDpTZmQ/zoxgwDp96GbmnvDa2V7nWjk=;
        b=QgufGM+1w3bsYZSJ9xlKRmy3+TsigV3ZsM/lqCkrk+2PFrRq2qAxjaRIcbaZ6XTMpd
         dHN3csVfUdJlhnr4ISuVdfwWYthqcjlVkwEKaIzb9ohnAgPPPEnUh8ZXbwWBB4FE5VTD
         v4qiUp1+V61ZK9GFt06cQBjo9kwCIXouNxnx1dWjOOpSi6rvXPFsU0oBn2JtQQ8qDYSE
         JTzdjg3Q550FQW+DQ/yUhMrzvS9yoNZmt/a2M2/z7siYRPqcfv6jjVIuNkLoSpWuQ8d/
         sOwBN4knqfQHkxWpOzloC+DeoSvsFYb63wY9gAxv2vVkHqYOCumGB9afLCGKIFbX2MJ5
         xl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Np4LH/PHz6uNkDpTZmQ/zoxgwDp96GbmnvDa2V7nWjk=;
        b=XirbSoSznnRk00kYs6gbKmIMeTIW4WSfat6s0BVkY1WV2gm64dTpuqFb996FbABrAv
         SQPk3TPKCwCHAaigXB9vcnN4r8oX0PqeTjVjzHo7Yxp6uzGMqR9o6D2ngpRJiD+ls0nw
         pqjdmKe61jZHPB/CG3WDxeyuQmYDJwbFMniyuNfsdsUB0uV1onYvDlLnkOvcVEaeAvbs
         BZLSAMT2Qx6XwW5pgja2sjfOvTdz5Nzv+5fP1B6cuT95LOY7tp+g9hz5HL8ICuKyRD3a
         J/dtWTiahw/FBQU7NEzVMHxQFFtCIp09CsnZtyeYY0pYWWJqxRhN6TmxPoylFkycfWSr
         NeSQ==
X-Gm-Message-State: AOAM532aaz07m8M9kiXCJhcf+K/IKbJdvRW7GJfuMKHczFCCOKo7LWoo
        xqyksnOJRRG3sx2SiqilbbeoSA==
X-Google-Smtp-Source: ABdhPJx9cikXNjt/6MFPqIqkMx5U5Ng8Uv5wYgVhdvs4xghr+YQWYDB7vr7F/zL+84q9GXPE6QDA6w==
X-Received: by 2002:a5d:50c2:: with SMTP id f2mr173218wrt.694.1644250870003;
        Mon, 07 Feb 2022 08:21:10 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id k9sm9789271wrv.81.2022.02.07.08.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 08:21:09 -0800 (PST)
Date:   Mon, 7 Feb 2022 16:21:07 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-pwm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: Avoid open coded arithmetic in memory
 allocation
Message-ID: <20220207162107.eblu6rxyhkuyyqnf@maple.lan>
References: <bd3d74acfa58d59f6f5f81fc5a9fb409edb8d747.1644046817.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd3d74acfa58d59f6f5f81fc5a9fb409edb8d747.1644046817.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Feb 05, 2022 at 08:40:48AM +0100, Christophe JAILLET wrote:
> kmalloc_array()/kcalloc() should be used to avoid potential overflow when
> a multiplication is needed to compute the size of the requested memory.
> 
> So turn a kzalloc()+explicit size computation into an equivalent kcalloc().
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
