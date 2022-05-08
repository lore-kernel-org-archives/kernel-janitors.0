Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFB1C433EF
	for <kernel-janitors@archiver.kernel.org>; Sun,  8 May 2022 23:39:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233477AbiEHXnk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 8 May 2022 19:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiEHXnj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 8 May 2022 19:43:39 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D67767D
        for <kernel-janitors@vger.kernel.org>; Sun,  8 May 2022 16:39:43 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id s16so528903pgs.3
        for <kernel-janitors@vger.kernel.org>; Sun, 08 May 2022 16:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0Fk9q2wfMTU5E0RXXO2TYgguLljwQ6xqMwEk6TDsdlU=;
        b=wY3J39TPH39dOxnwLSzrS/92AyWzYfqZpW2VUeWFYChy6h2i1JZT9Imd9TNmAn75cJ
         bwXaMix/3uigiF1YkTMA5Q419t2mS4f/5PsSVD8u3VftrI++rOLNvmIp61sqZnMC5ESX
         KGmYS0T7/Q0q3EeOCSmkBE1cMrPM2hE91glin3Vzo8B5kSIm1PjDGD2WoeoPqwh93E6c
         x4mV8p8e0wIuBavS20Tniv1H7KL1/0os+kBTkq4iWVbZ41QMS2wWBhdh4Dfmp8Avk8zW
         y/Cj74FzBJYZC96wKCJc/wBStmUwcVIy5UBfxRxZIsorwwTvgkwwskrcEmPtN6B/LB+H
         yhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0Fk9q2wfMTU5E0RXXO2TYgguLljwQ6xqMwEk6TDsdlU=;
        b=WlAE+LY7BeaUQUneZJifanmPrk0QHSIGLRpeGSu2oFjdSZAildiA5AJocMmpNgduhf
         s/ZEJIi7NTrN5qniO4BT+lwaBTGp9JqRS8SpyX8Nby0/nQM6cXOCcZWV+odx7hitzG+Y
         EC1mtXINjSRtYha4+3P2iw/mFsxvmbyBUpvlpGVHnkD0ZHvbo5eO7o13ji3HxIzOSNlb
         GarLmrD9heiarEw5+qJl1DNu+EGZ7CQmRrij5FQzJve/HXopq41MUSan9TbnKDU6mjsZ
         tLgtEeXhpXibPGBPXDKb/PGoC/+QVQmhrqmDlnBRKNpczqArg9zyeqygWLp6JBJ4NbIy
         kAYA==
X-Gm-Message-State: AOAM531i4a6bRf4VOapDRtEbklKG7RSqeiiA/OhZRpHGPUMa+ZGv3fcr
        LbbcKD5THPXuD0KsL7xMXLphk1ariLHnsn+L
X-Google-Smtp-Source: ABdhPJyptYpvZmOl7i/ADERhsb3D3uvcKnTFigv/RxTHQ8pSCp7y+lltJmAHuLhY8s0FDPMd2Og6+Q==
X-Received: by 2002:a65:6e0d:0:b0:3c6:12af:15b4 with SMTP id bd13-20020a656e0d000000b003c612af15b4mr11094141pgb.338.1652053183261;
        Sun, 08 May 2022 16:39:43 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id m7-20020a1709026bc700b0015e8d4eb1f0sm5639687plt.58.2022.05.08.16.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 May 2022 16:39:42 -0700 (PDT)
Message-ID: <1e4264e6-55ed-7681-0aff-ce1dd9d6fd9a@kernel.dk>
Date:   Sun, 8 May 2022 17:39:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] relay: remove redundant assignment to pointer buf
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     kernel-janitors@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
        linux-kernel@vger.kernel.org
References: <20220508212152.58753-1-colin.i.king@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20220508212152.58753-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 5/8/22 3:21 PM, Colin Ian King wrote:
> Pointer buf is being assigned a value that is not being read, buf
> is being re-assigned in the next starement. The assignment is
> redundant and can be removed.
> 
> Cleans up clang scan build warning:
> kernel/relay.c:443:8: warning: Although the value stored to 'buf' is
> used in the enclosing expression, the value is never actually read
> from 'buf' [deadcode.DeadStores]

Andrew, I'm assuming you'll pick this up?

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

