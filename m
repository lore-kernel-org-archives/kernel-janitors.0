Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8E5C433E6
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 11:14:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCEFF64F01
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Mar 2021 11:14:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbhCKLNj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Mar 2021 06:13:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbhCKLNf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Mar 2021 06:13:35 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E63C061760
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 03:13:34 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id g25so1058571wmh.0
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Mar 2021 03:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=onK3msdJv5R6kQra+OvE3/ov8PzIbV+7IMlX9zMKU0o=;
        b=BUcWSGO2iVS3VR+tkLs44lgdMSDPO+iedkmSt0n4V/hPlWf5gucTftw8p3ubk1VPby
         x+ZmdLSfXmilFTsxq9nXq7q1bIEwoI8TqlNsGmNfFCSdMKrDVAdoM851B/RB80Qnx8F5
         7Em++3kjsR/44QW0JQyWqTqNZQD9uSztxbLpriyEfDRWJ3bEad6baTyFQ3LnWK/ns6KY
         RSj3rnz5COmnGC1li7RtRnG34VMWKJz46gj1h2LvUcPHkPGasvoeFSCvpOUoqBC4yC0F
         oSEUpSjAGlmn0f/l7p9CC4K87BZoPB5OpJZ9d4IYM1XiYi0TW/GYIcAdmci8mfXLwqfd
         GbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=onK3msdJv5R6kQra+OvE3/ov8PzIbV+7IMlX9zMKU0o=;
        b=KOwWvNeJ8dLPqkBEhaZ0hwSnHs97gTSffgUTGdUbWS78s0nnQBVB9kc+PPqV9u/JKb
         c1jsa+eTR5QgNyYrNJxLy+pm6KDm2m18A/Eg6UAzu3V4vKrg3/ywM1R44AjOUCnrB9j1
         xnKUkpFb7rllpO+N4dvmf1u24rSr7MQ2ncWOi3/HYD72DxQgk7FFYvrWGZGZQX/PBxfm
         /rdpldaGCRZdWlmD1Jyxoxb+S2jHvVfW+zTh3hG5ixWHPJv3hxxKlQrmwA9uDSzUY11H
         ogWJyccSDbCMEMM2l87bf0B4ijSgqPPN0EReIyQQRZaWiWggM2aVN8rRLehu4D1u8noG
         Cxwg==
X-Gm-Message-State: AOAM533AIYSxrQ0dhSvbXEGEgrQIJ4ccbsIvQUhYmgtL+/F8UBstOs3/
        3pGrGNsSZPCqds/zTz2m7jDL8g==
X-Google-Smtp-Source: ABdhPJzLui+97bNbwf3bHAfKS2yY0rLbo4z3as7RbJM8Hxt6Nd57DRxDNoIOJ3POTPDFFfo/QdlBjw==
X-Received: by 2002:a05:600c:2102:: with SMTP id u2mr7786598wml.22.1615461212745;
        Thu, 11 Mar 2021 03:13:32 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:84cf:7f4d:d470:dfd4? ([2a01:e34:ed2f:f020:84cf:7f4d:d470:dfd4])
        by smtp.googlemail.com with ESMTPSA id z2sm3213264wrv.47.2021.03.11.03.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 03:13:32 -0800 (PST)
Subject: Re: [PATCH] thermal: Fix spelling mistake "disabed" -> "disabled"
To:     Colin King <colin.king@canonical.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210311093054.5338-1-colin.king@canonical.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <86800f7b-76e4-9f65-7c93-095b9d742a80@linaro.org>
Date:   Thu, 11 Mar 2021 12:13:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210311093054.5338-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 11/03/2021 10:30, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a comment, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
