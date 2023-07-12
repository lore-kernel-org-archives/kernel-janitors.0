Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A70EEB64D9
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 Jul 2023 09:05:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232073AbjGLJFn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 12 Jul 2023 05:05:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233125AbjGLJFU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Jul 2023 05:05:20 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B04326BD
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jul 2023 02:03:57 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbf1b82d9cso68933945e9.2
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jul 2023 02:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689152635; x=1691744635;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GupHuaIqXzbPk+pS2yyaKy7yHaFuRf0nsu4uBxchRjs=;
        b=T/hA12xiZrfFKp3JKiCj0EzcXLzJaz2SziWM8IA9uYlH7QUI/nyv5mE9vnwYoO/WOU
         N9INt2gIyOW/jzLV5/cAXXR85K4yBqOOuRAqsWlgC9W/WqKqNedR/2eIcqsh3WFMUQzt
         jexpPFZoPxsqu4UasUpXMoim0zgUjZwZS9k6onTASvvvmsrwvkirgh8wD55gzf0NueV8
         v0Y1yzlWcu+UqQZ97TA1d7TRfIn/7sL+QkQNKjsqXMu+rRWrEnk3bjBty9qlf0VbEWvT
         AzOD79q4WDJPNsi1DFHB//sOu5IbgeKiMNLg/u3YonsUIRAX4oyuuXeEr98BOtNQFNey
         VOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689152635; x=1691744635;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GupHuaIqXzbPk+pS2yyaKy7yHaFuRf0nsu4uBxchRjs=;
        b=K0n/F/MgwhFKgsXiBUxSM8LX/OaIW8EfxG8lJJ9Ja3wtL/I8U+AP81+dm7TlwFtsuW
         JiCdhmfzvipw7Pboy0GUfEjmTL7+mMfSe3vNtBW3Nhs+Lzot77gSDEoiq5V1zu7j4pQr
         DBBrf2o9/jYAvWBRSTZpWxNI0ptDpZ7tPRMUMNfUo2hZ3D0KLf0H8e3ZEFcpEE7MRGtd
         46InYIUAW3nueZvhG5gaO9I7Ebu4vXz2OTiJTePTneBo5Jy55MIwafT3aOYFeeeVKOT0
         ai98fxKyy6xha6chH0l5DmPY1RW+15nrrwC6+IBt/7pHyU7TT8KlqSEL3Q81hzGuwDxV
         yZuA==
X-Gm-Message-State: ABy/qLahplxWriQFqzdiMv3CEFZvN7sUP0AbZSRjwLZqWt3jqoiUe354
        jbojfDAj8ClohGh5RjXKVSyxhQ==
X-Google-Smtp-Source: APBJJlFf58Sbazh4Bq2aZg5cfCVoDyDVW1kusrum3uRNQGXJ9/dkAONt85gMQI28jMfIru+mjGQ9wQ==
X-Received: by 2002:a05:600c:229a:b0:3fb:40ff:1cbd with SMTP id 26-20020a05600c229a00b003fb40ff1cbdmr14987929wmf.10.1689152635607;
        Wed, 12 Jul 2023 02:03:55 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 16-20020a05600c029000b003fc04d13242sm11977328wmk.0.2023.07.12.02.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 02:03:54 -0700 (PDT)
Date:   Wed, 12 Jul 2023 09:36:41 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Su Hui <suhui@nfschina.com>
Cc:     airlied@redhat.com, kraxel@redhat.com, gurchetansingh@chromium.org,
        olvaffe@gmail.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/virtio: remove some redundant code
Message-ID: <b82057bf-3126-4721-87f5-79ca3682cee4@kadam.mountain>
References: <7f67ed65-647a-44d7-a262-d3f1f48d90b9@kadam.mountain>
 <0561b89b-42a8-35bf-feaa-e5feb4ec3cd5@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0561b89b-42a8-35bf-feaa-e5feb4ec3cd5@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Jul 12, 2023 at 09:18:42AM +0800, Su Hui wrote:
> On 2023/7/11 19:13, Dan Carpenter wrote:
> > On Tue, Jul 11, 2023 at 05:00:31PM +0800, Su Hui wrote:
> > > virtio_gpu_get_vbuf always be successful,
> > > so remove the error judgment.
> > > 
> > No, just ignore the static checker false positive in this case.  The
> > intent of the code is clear that if it did have an error it should
> > return an error pointer.
> 
> Hi, Dan,
> 
> Function "virtio_gpu_get_vbuf" call "kmem_cache_zalloc (vgdev->vbufs,
> GFP_KERNEL | __GFP_NOFAIL)" to
> allocate memory. Adding the " __GFP_NOFAIL”flag make sure it won't fail. And
> "virtio_gpu_get_vbuf" never
> return an error code, so I think this is not a false positive.

We all see this and agree.

However the check for if (IS_ERR()) is written deliberately because we
might change the code to return error pointers in the future.  Static
checkers are looking for code that does something unintentional but in
this case the code was written that way deliberately.

regards,
dan carpenter

