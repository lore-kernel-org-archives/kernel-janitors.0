Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56488C7EE23
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 May 2023 09:47:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236373AbjEWJrp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 23 May 2023 05:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236166AbjEWJrk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 23 May 2023 05:47:40 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61720130
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 02:47:35 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f606912ebaso18159845e9.3
        for <kernel-janitors@vger.kernel.org>; Tue, 23 May 2023 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684835254; x=1687427254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6UUzrqfAn41OiLpwzHZwDoyliBOjoCFp0nDGKcNdfLk=;
        b=Ggfqdim8OknxGiaS8cpoROMYx1uKDod+xlzodv2Uyyj8LUUUFj1XKQepmWq3ya0r89
         SCo7bMYKY0PRlAmehGpJz7LjH5ttyqoJEdhcsJc1W81WHcvXM1ppc/C+Vz9s0D0uETpf
         tUlpmH49ONsebsCFlBouNpSw1l4gfbPeH2iSIUtM7nULniCQcUDmXbIZS4d3F16b3r14
         aGPiY+yrY6TF/IKobuxEHNvhP2wQHt3Kf4efeI2u/sd9wUInf800wRP6/feF5vOsbzNJ
         xdyvz48MK8UPYprsmPy4AJH0t50FZIpUPvK8CEL9ZSrLAGGVOaSNUZcXciDL/JlqViJR
         tzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684835254; x=1687427254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UUzrqfAn41OiLpwzHZwDoyliBOjoCFp0nDGKcNdfLk=;
        b=PMJdmhgKjGZpV5Zet3Wqm3nDlED/GO2UcVaYjwL3LbEhy0hibhSvGrg+qjutBNBQ6k
         EiVqkpx3t0mOIrdR7gMEnAUn6uXZQg8UafjXsrXBJ6W3lEbVXZpLofp6yqa//HIznqEd
         +nA9Tes25R0gUbhAgTBQqmGlxXZIOQhjLAFqDysNpOTyZ+JVgt0yqbVGH6O/OetQ6aLv
         YXuvHh/1JjsAjdGeerww6pRo/p/VN6ds0gzLX38yWcZnOZb/5mvljTaim/LB50bHDbHQ
         KeOVihb2AxLWNX5OP/b9YoOHHtVqB1YXqDtyOCC+CYk4HGHtkmw0Xtx2E/vpLEW+2Ycj
         +++g==
X-Gm-Message-State: AC+VfDwq+XrMjMd73Dzm14m7u0FrpDzw0MoGCQjXoVJ2B1bDfCfoFHNK
        i75daoE0Rncc/3/6HS6oMSUsOA==
X-Google-Smtp-Source: ACHHUZ6bd1TERP2fQjRKpOW5RESnGSzbaSxaNEv0OuJwROCIKwwJpiJ/Jd574GsAVtOJTW6dZhgJMQ==
X-Received: by 2002:adf:f542:0:b0:309:4368:a8a0 with SMTP id j2-20020adff542000000b003094368a8a0mr8733321wrp.68.1684835253786;
        Tue, 23 May 2023 02:47:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b10-20020adfde0a000000b003021288a56dsm10627696wrm.115.2023.05.23.02.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 02:47:30 -0700 (PDT)
Date:   Tue, 23 May 2023 12:47:27 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] interconnect: qcom: rpm: allocate enough data in probe()
Message-ID: <d5c41227-21d8-4f64-9433-a774ecfa5685@kili.mountain>
References: <a0f6184c-c2b5-4e8d-9b8a-867ae83f3094@kili.mountain>
 <2f03fa9a-1b4b-d208-f399-a31ab8c5b4cc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f03fa9a-1b4b-d208-f399-a31ab8c5b4cc@linaro.org>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 23, 2023 at 10:31:27AM +0200, Konrad Dybcio wrote:
> 
> 
> On 23.05.2023 10:11, Dan Carpenter wrote:
> > This was allocating "sizeof(qp->intf_clks)" which is the size of a
> > pointer instead of "sizeof(*qp->intf_clks)" which is the size of the
> > struct (8 bytes vs 16 bytes on a 64bit system).
> > 
> > Fixes: 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface clocks")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Whoops. Guess I was just really really lucky that nothing blew up for me.
> 
> Thanks.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Hold up.  Wait...  Let's not apply this.  The bug is more severe than I
saw initially.  It should be:

	qp->intf_clks = devm_kcalloc(dev, cd_num, sizeof(*qp->intf_clks),
				     GFP_KERNEL);

Did we only test with cd_num set to zero?

regards,
dan carpenter


