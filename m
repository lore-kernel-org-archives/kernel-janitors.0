Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEF3C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri, 11 Feb 2022 22:09:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353945AbiBKWJp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 11 Feb 2022 17:09:45 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234541AbiBKWJo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Feb 2022 17:09:44 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A560D0
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Feb 2022 14:09:43 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id v13-20020a17090ac90d00b001b87bc106bdso13145478pjt.4
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Feb 2022 14:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:in-reply-to:references:subject:message-id:date
         :mime-version:content-transfer-encoding;
        bh=rOmo06AVJ29zMWc+Gwf+ZazCMWJDEtmsXwyKly/OrdA=;
        b=JmqEjOGEN1SqtrKA8Jc0qNhzDy3uTABeBGcmVF1QGaUKAH68SlNnarE4tegrxA43aF
         CeX7RZawOYwtCirX70zUunZQ/rDJmx5pR+zYIQBmvXILllDIYaLlsCon3OVj7VOOVw/n
         j5g5d90+7bFYvTKsmsuLRu9ldP6jpiy0CL2ZqV0zhHaFG7KrG+RBri014wkWgjxSnaFb
         qtdtNdzJLnkCXjfCO2nNpiptQWwoylCDdswvfIwScJr8kTu7B0xqUwD40J572oZa3Gyz
         o8FbNTUzX5Nh2EU/l6lNCnrWNhGHLjm0QMho99C92xU50WqyP5MLTHEowyKL9aiVSCMN
         xU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
         :message-id:date:mime-version:content-transfer-encoding;
        bh=rOmo06AVJ29zMWc+Gwf+ZazCMWJDEtmsXwyKly/OrdA=;
        b=kWeazZzCN/gTqlM7XIQMCjbvXAjxDZRaA9tnkQqEtwHhZ0eck5x9Ki2YrJyqVgMnXb
         y3SX1NgUCyjicwqF2ubL0CsS32caG8/esB+AcynholvtDtBkxlLMT0iTvgQ9ZEsM0Wfx
         YKKkEDn5J/AOPu2kgIddf/+0Lttgg4crFEkTW26kfSVpGPasf7YdNYHnXaVbHr4bf5f+
         195+91kkQiaGjimFTUry9YJQvuHK/ZhhuhDo89tvJPz13gyiKUCY6yci9wWHk5ihrvFn
         SBRqugryytTn1kKMn8O5yAB848b4q+xqwn2KWMCrTv+tjujpp9Ua2k3jDwYXeRNuzPiW
         zCeQ==
X-Gm-Message-State: AOAM533dyEDw80t92Z9/1yylzbN9e3E+27Kyt0QwHxDgflK4LshBJRHl
        +2C+a9n2Wl+ii+f01vgijPCODw==
X-Google-Smtp-Source: ABdhPJweMnFI9BAH2E1NSs7Lmkb5xcjFIsZNlFquAk+cEZZD7QosUbyPqOKjsAAjA3oEKj8Ftu1eNg==
X-Received: by 2002:a17:902:b414:: with SMTP id x20mr3618304plr.76.1644617382660;
        Fri, 11 Feb 2022 14:09:42 -0800 (PST)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id t1sm28889025pfj.115.2022.02.11.14.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 14:09:42 -0800 (PST)
From:   Jens Axboe <axboe@kernel.dk>
To:     Colin Ian King <colin.i.king@gmail.com>,
        linux-block@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220208114656.61629-1-colin.i.king@gmail.com>
References: <20220208114656.61629-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] loop: clean up grammar in warning message
Message-Id: <164461738194.23200.14652374197414032855.b4-ty@kernel.dk>
Date:   Fri, 11 Feb 2022 15:09:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 8 Feb 2022 11:46:56 +0000, Colin Ian King wrote:
> The phrase "has still" should be "still has" to clean up the grammar.
> 
> 

Applied, thanks!

[1/1] loop: clean up grammar in warning message
      commit: 65f43c6791944393139078ac853423ed98cca3ad

Best regards,
-- 
Jens Axboe


