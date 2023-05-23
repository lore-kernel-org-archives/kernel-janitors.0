Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F08C7EE2A
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 May 2023 10:54:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236048AbjEWKyy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 May 2023 06:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbjEWKyw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 May 2023 06:54:52 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D8B5FD
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 03:54:51 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f60804faf4so11342765e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 03:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684839289; x=1687431289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/3WjXgsNuqa7/WDZdFims98+tDEhGOYyjkquS66fJPs=;
        b=GRPH6+30lAf//AJM9pWiPwjzF5resuZuGFlvxrJZigGSKauVKhCG67QuBSxJIpJm9U
         UqO8OPb6Abqjc4UsG8oYtlAIVKSqo2vxyuSfQyWCumvIMPaR4MwQJ7Z0Ju+VoZTxeBkO
         EVsOiQ08u3o1NpB8UMrRYa9vZDkXWkoowif5QStMG5MDDhTyatuwZIjDeaUeaXd+LFPl
         WGsxrky31gmDvppGRukw6KgXVPFf1ZjQBRuky5u4p7SmyiU17zYITeNa/9JloaRpIv9d
         v5SgyDMHDqwKmIQG8gD3aogHnsCvpF1NiJ+OODHOl7+VXJvQ8iCL3fFJ+AZeaMK0d+1H
         UrbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684839289; x=1687431289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3WjXgsNuqa7/WDZdFims98+tDEhGOYyjkquS66fJPs=;
        b=eEj6OG5uZsCKvb6jkwoxGSuPjz5HotAX/iOqfquIyk3PdniSFwQaVchXwmO16q56NB
         rVylD5gxQ7FxyK/7UBNs0pyfwFjtjMKyS8gtmSEweNFkqIWARcyO33w7psWwMfPiMe0d
         UhuNkeLBl2Mep92i8RdteE071//jyL2tzywqhK12v6XTKqtuXKicXM3XoANZmcDwyT7z
         BTGNcsEPgiAYuLd4clhWCzgaLuWShDkptAUg7eN48dKVfKs5/OfGF5HTMCkFEARnqw6s
         XgPSwgjbsxRWlkIkxW4mhNTD461waDlxZ0feC059Ri3e9tbNTnQc4tbJtO2qozlfmhQv
         0k1g==
X-Gm-Message-State: AC+VfDwpViL+6BzvKHOTiCM6J1mAvhGSmE/XQzVd76+K9o+GBnIW6Av/
        QM7SPWmoPn4bKJnq5EgXDrF7Ag==
X-Google-Smtp-Source: ACHHUZ6b5/OXboW+vGmX4shXePUEyDe7NDvlwNpoxezhMOSU58x9BGVbiVKV8bYmalzS4dohoNrkqQ==
X-Received: by 2002:a05:600c:2152:b0:3f6:938:1001 with SMTP id v18-20020a05600c215200b003f609381001mr2059704wml.8.1684839289624;
        Tue, 23 May 2023 03:54:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n22-20020a1c7216000000b003f60482024fsm6072367wmc.30.2023.05.23.03.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 03:54:48 -0700 (PDT)
Date:   Tue, 23 May 2023 13:54:23 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Archit Taneja <architt@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: signedness bug in
 dpu_encoder_phys_cmd_tearcheck_config()
Message-ID: <4abf38cc-20ab-4606-bc39-85255b8bdee8@kili.mountain>
References: <897779a0-1a1f-4193-9dd3-bc4f87e73e3c@kili.mountain>
 <wxfpgm77uxae5mhpht35m4kgrcx2givdp2duncxduz7hrlcofz@sp5wxfqx63fg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wxfpgm77uxae5mhpht35m4kgrcx2givdp2duncxduz7hrlcofz@sp5wxfqx63fg>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 22, 2023 at 10:47:50AM +0200, Marijn Suijten wrote:
> On 2023-05-22 10:48:01, Dan Carpenter wrote:
> > The "vsync_hz" variable is used to store negative error codes so it
> > needs to be signed for the error checking to work correctly.
> 
> Nicely spotted, but it it looks like we have more to fix then.  The type
> returned by dpu_kms_get_clk_rate() is u64:
> 

That's a good point.  Although the type of clk_get_rate() is unsigned
long so probably unsigned long is enough.

> - Perhaps the int used in this patch is too small (though 19.2MHz vsync
>   clock ought to fit);
> - That function should also return a signed number as part of this
>   contract.

What about if we just return 0 instead of -EINVAL?  That would match
what clk_get_rate() does.  Also let me change the type to unsigned long.

regards,
dan carpenter
