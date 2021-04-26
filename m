Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D88C433B4
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Apr 2021 12:51:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D69D06101C
	for <kernel-janitors@archiver.kernel.org>; Mon, 26 Apr 2021 12:51:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbhDZMw2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 26 Apr 2021 08:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbhDZMw2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 26 Apr 2021 08:52:28 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 725B9C061756
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Apr 2021 05:51:45 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id g1-20020a17090adac1b0290150d07f9402so5119736pjx.5
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Apr 2021 05:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ie15wHFE76bzG+Wxt/79MF6wdJrWeejBS8p/vm45PF4=;
        b=gPNn9QbO/x2+6+ep8RdXTKii7vY3o891ydwruA9Mm6Egq1iofqvwrGDQGksONOmTYT
         5v3k+HL9xqzifguqnNkHS+barYyarLAA2VzXbA6EYbXg/XnjeofqJNlUbOcVtBNwjq4l
         jJYYs/3rMbFtfzs3GB9HDme0TmX2IeJUY3c9IKhj9dQ1CUAXkpNdMhA0UAkMwl/KBXoY
         xVL21lI7A5dx9B1U3AxhZ0qz9BVbrpqtaY0ZxiKLEdalJwvl+L9ZtgkksI35u5WdnPhf
         B2Z6122xu3wCBnD22Gi6hr+l6+O0E6RYapnEAcLO/HaoapheFN9dVpvhYsnK7jMx628t
         AoOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ie15wHFE76bzG+Wxt/79MF6wdJrWeejBS8p/vm45PF4=;
        b=SbcMMiO5LL0tmGrDEXhxCbzEoIKZbzosKTVZQM/Av7nX/aU32VH/5chhwrdB0+quOe
         0QhQ2hVtQ68dh4c7d6tX1xTobSz4t5ydFi3ejpgM8x+tIkAgExDZDc4S5g5mvm9tY+/n
         Bc4mVadnkhek4pdsKFAUzcJ0J5yVySLufjqN0mBL7mBeyCywWttDyQ4Xmx96xZmLSStG
         XevZ/moyB6w4p6+CeniepjNQNR/epVosxIAn0pWXONZc3M2a0vK2iQbuKqD3lW4FNStz
         Ml/lecxk9ZA5DsqF6DWg8Nlt8+JIaNDqMmcpmWVpda/1Ud1ds5h/D3vw1rXt99MmeLFA
         jPaw==
X-Gm-Message-State: AOAM5333cnZuEwu5+12NR2TzUIm+hFMu/l7mIC2TELgJGqvztNBAx8tI
        eHTCPgQIW5Yyh42V6fTsAn+wSQ==
X-Google-Smtp-Source: ABdhPJycZeWxEAEMvutxAr4Nn+NLUpl9AyywYZpRHWrQ7XW+sELMqfLQLPVrKb5fPV4AKGvJR4VwCQ==
X-Received: by 2002:a17:90a:9409:: with SMTP id r9mr21154964pjo.157.1619441504978;
        Mon, 26 Apr 2021 05:51:44 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id u17sm11156058pfm.113.2021.04.26.05.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 05:51:44 -0700 (PDT)
Subject: Re: [PATCH][next] io_uring: Fix uninitialized variable up.resv
To:     Colin King <colin.king@canonical.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        io-uring@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210426094735.8320-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <d65b1763-ac78-acd6-3b92-e28bd4402a75@kernel.dk>
Date:   Mon, 26 Apr 2021 06:51:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210426094735.8320-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 4/26/21 3:47 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable up.resv is not initialized and is being checking for a
> non-zero value in the call to _io_register_rsrc_update. Fix this by
> explicitly setting the pointer to 0.

Thanks Colin, applied. I changed the pointer to variable while doing
so.

-- 
Jens Axboe

