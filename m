Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2A9C433C1
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Mar 2021 03:24:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2BBE61A1B
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 Mar 2021 03:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbhCYDYT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 24 Mar 2021 23:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbhCYDYE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Mar 2021 23:24:04 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67201C06174A;
        Wed, 24 Mar 2021 20:24:04 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id t18so457633pjs.3;
        Wed, 24 Mar 2021 20:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YIgrE0A0RxNSz9Zzzla8VTXImGlI1ndymO2n6feJf0U=;
        b=eA6m5uT11Mx5mcgaDCXxnxdolM1WlfEQ6nhx0uqyVOvNxZsrZBiWNanxmAwJ9yrb7h
         2v1R2FG/eeMtfrupEk3DOPzHI34Tski1pkeFoHZbYGuVi4BKt9kuywK+EVzRQWS1JS3s
         70K7WzcIcgwFNsFxZazBeJ7L9BxwvX3jBUIrsTIBYsdZxO4ddhPQJboFith8bbDeNbq8
         W+hQ/kZQELSF1p1imZxkYPX21EUjtqXl2sy5HJ5mj+TFVBxCH4GUWFyJcXXKSlUd/XHV
         /PlfH5BIYw40Qo1L03FZe8O32SiIyo6RgXdSKRe1u+AakrfOhXLtVzihdjhe5l5PXi6A
         26Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YIgrE0A0RxNSz9Zzzla8VTXImGlI1ndymO2n6feJf0U=;
        b=fnHdJH/znJ07VeBNKdouNSp9AYmlEVMXFVEqyncXVkYbYiBE4SPO1hgdwZLWDGEtFh
         Rh1pBs6yDOaCZd+yDdVQ4izB4GzHQHLoS/guGq7vJWUTxfGWkMnFQ+friqmcSiprfzVR
         4aqD0/P4wHsc3gKO4y5UaEtXQ+HhqTLxcs8KNhY7lnsucPZ/DfJYl1NDFPs4nJastiCV
         qwMvfblkgzOdVxb+O0Nbs4jS2hi2bHPgwLskyLK/Rdp+REtBYw5yzZsH4km2g+jJpHOB
         lz2lQY34GUn6s74zZ4BB/KaRq6f2l2j9QH/UOwhQuQ1APSOjl9UjNKGmIAtXkgLknIY/
         x7Jg==
X-Gm-Message-State: AOAM53130Vomco3SqvaKV0DjgOdvGLSyDbZCsjdNbdPSdSRFk2hNoY/C
        i656nvUf31LtCt4/5NH0d8s=
X-Google-Smtp-Source: ABdhPJwdfxoqE1rff9O63T9/81IMPCY5A9Q8xos5J7Jf1LT1wrevJo+sEz6i/URzQ8/XxOXSxyBF+A==
X-Received: by 2002:a17:90a:5587:: with SMTP id c7mr6459673pji.5.1616642643828;
        Wed, 24 Mar 2021 20:24:03 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id k17sm3665711pfa.68.2021.03.24.20.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 20:24:03 -0700 (PDT)
Subject: Re: [PATCH net-next] net: bcmgenet: remove unused including
 <linux/version.h>
To:     'Zheng Yongjun <zhengyongjun3@huawei.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
References: <20210325032932.1550232-1-zhengyongjun3@huawei.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <affdac2f-68a1-e1b5-e6dd-ae5663ffa5c0@gmail.com>
Date:   Wed, 24 Mar 2021 20:24:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325032932.1550232-1-zhengyongjun3@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 3/24/2021 8:29 PM, 'Zheng Yongjun wrote:
> From: Zheng Yongjun <zhengyongjun3@huawei.com>
> 
> Remove including <linux/version.h> that don't need it.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
