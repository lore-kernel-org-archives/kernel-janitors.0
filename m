Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ABAC48BDF
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 21:38:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A0F36128B
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 21:38:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbhFOVkJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Jun 2021 17:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhFOVkI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Jun 2021 17:40:08 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404B3C06175F
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jun 2021 14:38:03 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso338033otl.13
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jun 2021 14:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ktvid5LXIM7drztkwdX9ozDIlIDeMyLQZst/rY14IM4=;
        b=zD1aW/O4VDuKIIKdFuwz2Ojl7wf3CLuun/3va6xMimNA6l8jhK6SPx2l8+AWtJNAKp
         BhsSSs78peO1Fd/zmAZIhyfwOYNzotlnR6FYf6A86m2vhSJJDIE/regKtTzQRYtet52U
         TfsTx8jGr/P7ajZMHEoeizhVU9l22/k86jbVbhvZceGzDIc0sTVpiBIldvz/lyBubWlL
         ETdEkf4HL30x3OPOnJxR9xtnsdm7jC/EFJ5BnfUAMYX8j+3A2rK8gHr4M2UxkoO1mIAM
         ZV2+fzIcak2q4i+rNRHLQKcT1WcU+cDjIJUIcX8H1yrOKPFnVdiF/+45TCpzMqEssVpY
         IxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ktvid5LXIM7drztkwdX9ozDIlIDeMyLQZst/rY14IM4=;
        b=JAq596dE1lAxNL8tq7WpL/mddqYV7j+n76j9GOwl/swG7Xna1zcg/rWeC0cIRr7MeZ
         eKphKBq/LugCPOWGfXPibu/Yw3NbsTX+rE2e+eHhZXq5Z1M0CmmFUSvlxk1fKml4Stmn
         dZzei6HFVAEOsbRlV1c9gzDi5qhVl3Blc/DPHyBdgwWUkUz5Mj6K6G+lW7snfY8YDtnr
         iWmEFGG8ewHu+H4j55NXYa3wzeYDbV3tfgJRiXr+l4esOXgCCPSO6qCHymjVmrUNdu1+
         2E5Zogo1i32vWHhSXcfa1Hf+oY1RunEJX9CJ/2VQQ0KFaDAzeFqrmNevTrnEuAq3OIAg
         95Eg==
X-Gm-Message-State: AOAM5327gFpJ8oHicXh6xv9+b0Vu2fWsy6E7ZQOgzNtuewjDBQ/mBqaO
        EnoI3O/dIXKULsAAo7ydjrOIEA==
X-Google-Smtp-Source: ABdhPJytngzhKqyqU5m/g9kKa33OJYlC3KL/VMY2NdSzLTOIkMokegs/VZiBqv1cSCyDJRGsl5rMzg==
X-Received: by 2002:a9d:355:: with SMTP id 79mr1071698otv.101.1623793082643;
        Tue, 15 Jun 2021 14:38:02 -0700 (PDT)
Received: from [192.168.1.134] ([198.8.77.61])
        by smtp.gmail.com with ESMTPSA id d20sm42457otq.62.2021.06.15.14.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 14:38:02 -0700 (PDT)
Subject: Re: [PATCH] io-wq: remove redundant initialization of variable ret
To:     Colin King <colin.king@canonical.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        io-uring@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210615143424.60449-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <532fcdf3-2b7a-a9c6-039a-5dcfb32a61e1@kernel.dk>
Date:   Tue, 15 Jun 2021 15:38:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210615143424.60449-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 6/15/21 8:34 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never read, the
> assignment is redundant and can be removed.

Applied, thanks.

-- 
Jens Axboe

