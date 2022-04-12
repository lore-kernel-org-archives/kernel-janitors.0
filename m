Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BC8C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 12 Apr 2022 17:04:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354031AbiDLRGr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 12 Apr 2022 13:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357953AbiDLRGd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 12 Apr 2022 13:06:33 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4050613E8C
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Apr 2022 10:04:14 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id y6so17351301plg.2
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Apr 2022 10:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=svCJiNYCVSTSADFJuSISCpOI75wKzQz4JEvN3pdJrsM=;
        b=I0pM3O+HVyaN+WR40sxZKPBujfPiS3TYbtroP2cR9D3EyonmrVjWLo+lFmCjjMF/C9
         cKC95ZxJ5Wrj7D8YYDHGFUDvGV5CqSfJIeyJZp4xia9AH0fNss/9hGUjx3Dc5k/kk+NI
         SK55KI1P+NrSthu6nAnBYzB/AAGQORsGEG9JNxBoBlmcVXq8WOOypF/3nfo1RTjKbfAK
         3wkiCRIRYK/PBpuqmNWFGd3fnVzQpOgfZYmS3EiJjdqvm+ZOuX4X+FXha0FXLcH2RAYv
         wEPfq51y/pCgvHdYlIvMzU1RG15mFEFWbDIbpcC1v792nKvKq9up0JlbsebYKLsxNu3N
         N77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=svCJiNYCVSTSADFJuSISCpOI75wKzQz4JEvN3pdJrsM=;
        b=T834f+YI5ZjPQ3Ys1hG41IkR/Z1kDpHbp3BIjzmcsODv5Sn3T41aAO54Bf2BbAerO+
         NZM+wLhxuP0dYQeZfmLAVifqDcGYclH2xuO3dfQ+/v0Ar3IMADqiNTOL36HWvZo0WKae
         gBcHxstGztU8BWhb7S1w51yKCehiM751vkpRtQ66OXDIla8flazpS1eIvszxllLct5ar
         IbmGUWvz7WV5GxailI4zgqZxb8DVHLDrh3tvwqDQD+Sa7J/AIy42tRGKkciHjwSEhvNv
         eO79JsvUNLTWMhraDEiGkPr8NWkMhzkZzcodeWgkiA5DthJnioo0JMuPqnfAPPWPz6Pc
         kpRA==
X-Gm-Message-State: AOAM5307eQ2mui/OaYGKKoh4CqqZJicWRhHP/4CD821dNWJxTBdR85/F
        oJj0usT2sW939ZtTi7XHtwHa6Q==
X-Google-Smtp-Source: ABdhPJxED4y9fHEAFYCWz2UyU0Yj+9pcsOz0knbV4/SXxH9hKezQCW0Zl7/FRRX8+OwqcltokcmuJw==
X-Received: by 2002:a17:90b:19d0:b0:1cb:7ef1:d915 with SMTP id nm16-20020a17090b19d000b001cb7ef1d915mr6130873pjb.16.1649783053717;
        Tue, 12 Apr 2022 10:04:13 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id k92-20020a17090a4ce500b001ca69b5c034sm49060pjh.46.2022.04.12.10.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 10:04:12 -0700 (PDT)
Date:   Tue, 12 Apr 2022 11:04:10 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Fix a potential double free
Message-ID: <20220412170410.GA465495@p14s>
References: <1d15023b4afb94591435c48482fe1276411b9a07.1648981531.git.christophe.jaillet@wanadoo.fr>
 <34c30f7c-70e2-dc95-a664-9379f91f5aed@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34c30f7c-70e2-dc95-a664-9379f91f5aed@collabora.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Apr 11, 2022 at 10:55:52AM +0200, AngeloGioacchino Del Regno wrote:
> Il 09/04/22 08:27, Christophe JAILLET ha scritto:
> > 'scp->rproc' is allocated using devm_rproc_alloc(), so there is no need
> > to free it explicitly in the remove function.
> > 
> > Fixes: c1407ac1099a ("remoteproc: mtk_scp: Use devm variant of rproc_alloc()")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied.

Thanks,
Mathieu

> 
> 
