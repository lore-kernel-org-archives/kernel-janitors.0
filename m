Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8A3EB64DA
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Jul 2023 14:00:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbjGROAQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Jul 2023 10:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbjGROAG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Jul 2023 10:00:06 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A608198A
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 06:59:41 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso5390851f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 18 Jul 2023 06:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689688753; x=1692280753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXleX6XvvB8s2zv+8403BipvUjhdpH3QcnVr9tTY4To=;
        b=VnRGLNeoQQUF47khlmuiG/klpnEz5qvVaWLVP1MJUxcPIay7CLiE9lphF9tt4Dt2e5
         sefNUJ3alEo/N0vcTGK/OfkCmj6PZO2p14iBqEUW4gp9s54Fm4mVk5Iqu+3UqXbrjbZC
         ux0ay/58x0RzyZUZ7bTTlxZRMBlXP29iHGKC0wwq1ZNKQULtImwGe2hU4vG/J23IWbTe
         RRnUUmGztG88H0LtWHQBmlnW3PBV9RtcnFwtITmUg072tN7SSryXyvdCpj7J6Hdsk+Mb
         ie30Xf6Pgz8FW0onDTyh3O8kaRyiq7rOE2+S+AKPIXsmDutCTT4yGU5R9OxRsuvYKB3p
         PwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689688753; x=1692280753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXleX6XvvB8s2zv+8403BipvUjhdpH3QcnVr9tTY4To=;
        b=ccEuyiLkRI1gLykb/v3DwIge/7L24phUO2C9M/xTHPtejgwhQPCtAFETQwOucmXOhB
         8TbIhdM+xpVZcs+/iQ9S3INJUkQHx4Hy7f9JtFL1PL8Zq0YZ0nTMHmZlqwGSEhBt7Qu8
         M3SJqPccRpfzNSadBNDh406aZ3kqhJrmkCXowgR0cKieZ7EgyvnT+dCN9GXayh5OQDdJ
         NKDu8mGsHSXtZHdHMwFCHWoKzOjbg+UWkRe4oZ1IA+Z3irur6o508lCiIxkcQs0Vmz5n
         W+RKBSjcl3O/MgQ5nmSP3kHVetf3OFlHaqwUUhX8u4tn3qjNC6Aom0ohBFAJ7NvVCPdh
         wKjg==
X-Gm-Message-State: ABy/qLbuU1yr9v6FbzGTKEwtq8v/S2DY6kwBJVkV2oSHmOan6fVy+u4s
        dvIs1lazu1F3a8BfUW8syib2lA==
X-Google-Smtp-Source: APBJJlE2aGTv6/ZrrbbuY6xcrXmRin1I65DSj9S6kIoU5CkYvf2LieqWPg0OxxnY6PI2NvcELdgn9g==
X-Received: by 2002:adf:f805:0:b0:313:e920:639b with SMTP id s5-20020adff805000000b00313e920639bmr12048664wrp.28.1689688753536;
        Tue, 18 Jul 2023 06:59:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a5d4fca000000b00314172ba213sm2434596wrw.108.2023.07.18.06.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 06:59:12 -0700 (PDT)
Date:   Tue, 18 Jul 2023 16:59:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     suijingfeng <suijingfeng@loongson.cn>, conduct@kernel.org
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm: loongson: Add a check for lsdc_bo_create() errors
Message-ID: <90d22f14-c912-42f0-bf33-eb4297fe9fa8@kadam.mountain>
References: <0da6859b-40cc-4b3e-b8b6-fed157517083@moroto.mountain>
 <c9ac14ee-7cfc-c10b-4a55-37049bbb4338@loongson.cn>
 <bbaa11a9-9984-40c1-bd63-adc8698d0185@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbaa11a9-9984-40c1-bd63-adc8698d0185@kadam.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

People have suggested that I misread this and that "bare brain" means
through code review instead of testing.  In context that seems to make
sense.

Sorry.

Anyway, the fixes tag is warranted.

> > Even if the fail happened, your patch is not fixing the root problem.

What is the correct fix then?

regards,
dan carpenter

