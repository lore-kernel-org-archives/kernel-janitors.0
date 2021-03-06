Return-Path: <SRS0=552U=IE=vger.kernel.org=kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87078C433E6
	for <kernel-janitors@archiver.kernel.org>; Sat,  6 Mar 2021 16:14:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D1E665018
	for <kernel-janitors@archiver.kernel.org>; Sat,  6 Mar 2021 16:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbhCFQNp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 6 Mar 2021 11:13:45 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:59163 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbhCFQNl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 6 Mar 2021 11:13:41 -0500
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lIZYi-0004b0-9W
        for kernel-janitors@vger.kernel.org; Sat, 06 Mar 2021 16:13:40 +0000
Received: by mail-ed1-f72.google.com with SMTP id n20so2644347edr.8
        for <kernel-janitors@vger.kernel.org>; Sat, 06 Mar 2021 08:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kSOpPvwteB7OgdggMYlflHqoFNnAak/wbdk3zQ46jYs=;
        b=SouU2SsKog1iK3+KsgXwAoidZyieZ7NGRoNn50Hl6QID3uryOa2CyOY5Ia/6avh9iR
         UN2fLaqDzHeZWozGfmLYtdP9EanAvQFK+32FhSk8iXpWe/UMELAija2ZTf8f5gCVVdmB
         MvLuCWF90tPNyaBt+gONpoA39zY59P2CG3nd/f4xrAnVxKfKjJzaRGLEXQ7dHHIHD6Tc
         xr+e102hiXtSjlPmSOb3QYZy0vUNJoJO0x1Qe5DeML9wuausy4EahZv1zFz+P3sQLJoL
         KPpRRCp7iYq4ibZO5L4M6X571uHFPUzRaD+K6/8wjDUrm4YhDX3t6JPl1P7SsxrMfB/+
         PShQ==
X-Gm-Message-State: AOAM530gSRs5N0vNpJH4bPLOD7e2L8PiuXN3Y69d2ZTl1ipmLsENfjaz
        OQ2g/7mNDd6s7js7e4N7abMIdH0gM66P4JTxJxEJY4a+94rh0Cj9fi7He5D01XfNHRnbQL7qyIK
        NCy1hYM0AXTtFSCk1PgAlTvqVq3VslQI/vRbDsymNUYWNAA==
X-Received: by 2002:a05:6402:704:: with SMTP id w4mr15006218edx.175.1615047219679;
        Sat, 06 Mar 2021 08:13:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdAGCIq65lZYlyAxqCZzWAm3VpQnb3VqeFecUkSHeg10URY0/jp2c3aXPC8lt9nQB63KGrWg==
X-Received: by 2002:a05:6402:704:: with SMTP id w4mr15006200edx.175.1615047219456;
        Sat, 06 Mar 2021 08:13:39 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id k5sm3487412eja.70.2021.03.06.08.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Mar 2021 08:13:39 -0800 (PST)
Subject: Re: [PATCH 1/2 V2] usb: gadget: s3c: Fix incorrect resources
 releasing
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        balbi@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org,
        gustavoars@kernel.org, arnd@arndb.de, ben-linux@fluff.org
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210306142108.3429-1-christophe.jaillet@wanadoo.fr>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4ef30769-91c2-031e-8e19-af25d26c848c@canonical.com>
Date:   Sat, 6 Mar 2021 17:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210306142108.3429-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 06/03/2021 15:21, Christophe JAILLET wrote:
> Since commit 188db4435ac6 ("usb: gadget: s3c: use platform resources"),
> 'request_mem_region()' and 'ioremap()' are no more used, so they don't need
> to be undone in the error handling path of the probe and in the removre

You ignored my comment about typo here and did not add my review tags.
Did my emails missed you? The made to the mailing list...

https://lore.kernel.org/linux-samsung-soc/f63496f6-f894-2a86-0328-0f8dadbd28cc@canonical.com/

Best regards,
Krzysztof
