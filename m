Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D18C48BDF
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 14:53:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98B5061351
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 14:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234761AbhFRO4G (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Jun 2021 10:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234730AbhFRO4G (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Jun 2021 10:56:06 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C878FC06175F
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Jun 2021 07:53:56 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id f3-20020a0568301c23b029044ce5da4794so3321064ote.11
        for <kernel-janitors@vger.kernel.org>; Fri, 18 Jun 2021 07:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Psf6QI2SrWo0/tsBczZ1Er0G4CeoGKtrHAM5WMh1C9g=;
        b=PdDdQswDz8LSPnvVV6mFxPm38oZAjMxxl4crkKLZag84b1CK6SsYXlcqM5xrw0wQtU
         AtCpLbvTe+VEWbQYu5ccrwsmrolOx25DZSKJgT9ahjf/rDE6dWu/bgA44XRH3AQjVVjC
         Q+Uq/bsTyAQK1fm/tuhoE27od/thfkWytccSmM6A8mEGvPLDpchsXlKULieXLQP6EUOe
         oWEDC3pd+igoPQoIvBG76ESZOlff7mqkQ8ZNso+jEPfxpnHaYtThjPE6YPTkUZUAjBkY
         kDYk5Gzqzffr9l+4z1CWTA766gK2QS9/6XdGoSIW/nqhjq9W/zayEjzAsL3OV/4i4ja2
         6mlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Psf6QI2SrWo0/tsBczZ1Er0G4CeoGKtrHAM5WMh1C9g=;
        b=ROe0lm8NqUTO0HXUwjaPkWOZXF7uOAA5uixJYr4IV9z1TQhTYRFjBlhxpVjITTdGW/
         CNWYIJyys7DVY8rasXaSJ3wnHLGuqMzeq2VhkLfAiDIDsvmisKLqClxnv5n5fTIdDEai
         CsupZ488AJtgWWd+6wHAbCYkN74brXKNQr2dOy3cGwgmYF3Ghj6wGDznRKturZUIp8D+
         eymO5++gxmUPQbyOKkSmHvHH5K3/+rCyZsP9dB0FQSFy/ISSUoQhLq1hWkxx9kr0YfT9
         7NvEPNIN3rFn+bjUwxyBQnf9jqSwNiBoe0lGdIEUMfrozNCjTCF1lZjRMFDxy8Yr5Z/l
         R+LA==
X-Gm-Message-State: AOAM530TT0y416pUc8yrqnI/FdGlZJCFQmfmj2+HW1YeJi8K8vTGBdYj
        +IP9JxDCYAR1nW9w6KPSQbIlLU4NeSQhLA==
X-Google-Smtp-Source: ABdhPJy4ZGA8bhu1swqfYc1PCcEkWQYemZvYVzJM1HIG2Hu95mLGVpWuH2OrwMRd312dleg+9ZLtkg==
X-Received: by 2002:a05:6830:1598:: with SMTP id i24mr9833953otr.52.1624028036009;
        Fri, 18 Jun 2021 07:53:56 -0700 (PDT)
Received: from [192.168.1.134] ([198.8.77.61])
        by smtp.gmail.com with ESMTPSA id w186sm1823027oib.58.2021.06.18.07.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 07:53:55 -0700 (PDT)
Subject: Re: [PATCH] blk-mq: fix an IS_ERR() vs NULL bug
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Christoph Hellwig <hch@lst.de>
Cc:     Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
        linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <YMyjci35WBqrtqG+@mwanda>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <2ca05d8b-58f3-d195-de5f-d3dd1fb63bcf@kernel.dk>
Date:   Fri, 18 Jun 2021 08:53:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YMyjci35WBqrtqG+@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 6/18/21 7:45 AM, Dan Carpenter wrote:
> The __blk_mq_alloc_disk() function doesn't return NULLs it returns
> error pointers.

Applied, thanks.

-- 
Jens Axboe

