Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCD8C433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 13:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238211AbiKONZv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:25:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbiKONZs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 08:25:48 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F61215726
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:25:47 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id a14so24261173wru.5
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E+iRnjd8Ltxulzj99Xny17JpkpnjEictvVtr6d7MZnw=;
        b=qasHeuKoeoQ3ZoJDrkmjL6B2ENNRoClJD29z3PBrYV1QN7roVa8tKKKPMzAzuCejHh
         4iTriFwDd8z0SVNU1rWLMRzJEG4Fjy2qUlmOxbiBVOvoMBcd95c2erqVARL9UIOA0+/E
         eXvnXs6bMhFhaV6N1sf27qeTHPeOZyjZYiZYVa7nXqBERbSVwhNOLjVUBoDx8k3YaaJp
         X/ubo3nhjdCByqma+zU15uSYYj2FGbRtQR9rac8Z5b6DzVufwIC4Q5G5qGZNHLl1JBCH
         pK79DO2xnD8lHO99IHjDBNv1utLAfQLOgNtASfgw6sZkGaRHHySr/zhfNiWCym/jflB3
         uMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+iRnjd8Ltxulzj99Xny17JpkpnjEictvVtr6d7MZnw=;
        b=d1qtHtUPTLVXQg+zvMP6lFX5NolTp9C0xw5r53r5QslhhttnZf+3lYltsk66Tj8cH8
         wswGd2bqkANxGYj+z4OoHKm3D91Hl5yGvZrvG1DxFmcs8lQUzoypUiFCfBX/34KnfCzA
         h8HdiZbQuSr9mu9KH48hNL0nfzEFphOHlsEc4A5AsLAmZjFQVbtbg3zLft/raS4HfsOD
         No4wwqZuA70Xk25i4w5A+jl0kuQv6OHp5+kFyjp+Q833pP9p6i6tPxfc3sGBab26nIus
         W/FTW65DuyVVUW/Xcpb7bQ58Ojwrcc7ZVhj+hv2hCirdUZI4RCi28LtfowYz32Ei23/h
         Z0dw==
X-Gm-Message-State: ANoB5pl3yYVBtdV/qEcrIjg2lspdmGkTO+LpONSCD7EzBaW1mBMCmKAF
        jq3ILZb77RK1jgQJSuQeDYo=
X-Google-Smtp-Source: AA0mqf7kDJy8GMpCI7MGWMsLzKOBREzUM3i9Tc+j7B0SudBnMKCcGCtqQcDco9ntAwJysUpmqoeImg==
X-Received: by 2002:a5d:4a81:0:b0:236:96:f2f8 with SMTP id o1-20020a5d4a81000000b002360096f2f8mr11024261wrq.647.1668518746033;
        Tue, 15 Nov 2022 05:25:46 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v11-20020a05600c444b00b003c70191f267sm23016185wmn.39.2022.11.15.05.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:25:45 -0800 (PST)
Date:   Tue, 15 Nov 2022 16:25:42 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Matt Porter <mporter@kernel.crashing.org>,
        Alexandre Bounine <alex.bou9@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] rapidio: add mport char device driver
Message-ID: <Y3OTVmOYeBqmwFtN@kili>
References: <Y3N/EaYqACc7bPCc@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3N/EaYqACc7bPCc@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Similar warnings in:

drivers/rapidio/devices/rio_mport_cdev.c:587 dma_req_free() error: dereferencing freed memory 'req->map'

regards,
dan carpenter


