Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25685C433ED
	for <kernel-janitors@archiver.kernel.org>; Wed, 28 Apr 2021 15:51:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7E88610A2
	for <kernel-janitors@archiver.kernel.org>; Wed, 28 Apr 2021 15:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240991AbhD1Pvq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 28 Apr 2021 11:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240604AbhD1Pvo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 28 Apr 2021 11:51:44 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DFBC061573;
        Wed, 28 Apr 2021 08:50:58 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id s20so17233268plr.13;
        Wed, 28 Apr 2021 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jV3FcrSE1f6xx8dNGDLNYNEG02MsME2EkErrjfaPOaU=;
        b=ESs7eVif0tzZWqH4JvvIESeztG/cdET6QF60/sPVvwOuHcK7Y+aEAo78vxmNOLOL5q
         x8Xh9BG9C6so9zK+E5Ay0DpqkSanD82rxe6HWg1DMpj6Y3HXjZSEOR3GJ30nFfg8bKuv
         lLxd+JV0wrVA3iK/ie6ixUeLfknmgNKl1XWFQsAL0Pg8n59NAverJlgW0FQdQGP1ByIk
         aeg7jIlZcWP7fUcvDJDO5gD1h5RJPU9BFT3r17YhV8m2KasccIk7Eh2ufNCDLd4P6VE+
         sPdS0lqMYeuo8HjzqnzvPsZqQfdn61w/Z7K5Y/rGjIk87WHwBW8rWP6QwTe1Mwm3jwAT
         5X3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jV3FcrSE1f6xx8dNGDLNYNEG02MsME2EkErrjfaPOaU=;
        b=Xm2QAo4j54smf7rrM2s41RIOyl52MRBQsQR34pL2usgsUk+VTmJIXuBa6528pQI/w8
         WVw1GzDXsjdRczvBNLKpXjgTENqI1zx8bcYDmKNRXRVsOGCJSNaN6pWUbxl6k8ivFOa5
         lRhipGaZ1wTM8At4mxtjsOjyjOvMS1eUpYFCZmbJH/2g0j5GjQcR0l6BTaGdSA3Q2+TZ
         mELJZLw82bUFKHMZkDIOVbbEOgras4/qzQ4LcO20CKEFYM8jYZcbc7j9YxPsyCWTeglo
         XFC+ABCnXiK37vWEl+GLiM7+7cvefOLT3kl1P/7OSj0nyOhzNNUqmbrBXaGElnR9sNnB
         yhaQ==
X-Gm-Message-State: AOAM530lWmetjgV7N2H2XLIKnfkteoPXbOzPTQ6ADNOBQUciZ4U3YtvO
        Yc+CviaCc3Ko4tHxqh5SGLDy4BC2K0g=
X-Google-Smtp-Source: ABdhPJw/BJnQ3LSHtRqbRbGkglPH+mhrMGxUhGgWc0ZQQWmAzf8wjCeLB7eUos3lODUsXLmoUvWZWA==
X-Received: by 2002:a17:902:b70f:b029:ed:36ed:299d with SMTP id d15-20020a170902b70fb02900ed36ed299dmr15912959pls.48.1619625057779;
        Wed, 28 Apr 2021 08:50:57 -0700 (PDT)
Received: from [192.168.1.67] (99-44-17-11.lightspeed.irvnca.sbcglobal.net. [99.44.17.11])
        by smtp.gmail.com with ESMTPSA id i9sm6262546pjh.9.2021.04.28.08.50.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 08:50:57 -0700 (PDT)
Subject: Re: [PATCH][next] net: dsa: ksz: Make reg_mib_cnt a u8 as it never
 exceeds 255
To:     Colin King <colin.king@canonical.com>,
        Woojung Huh <woojung.huh@microchip.com>,
        UNGLinuxDriver@microchip.com, Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Marek Vasut <marex@denx.de>,
        Tristram Ha <Tristram.Ha@microchip.com>, netdev@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210428120010.337959-1-colin.king@canonical.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <61ccfbdd-c1d5-a91a-d651-90e6cae1a48e@gmail.com>
Date:   Wed, 28 Apr 2021 08:50:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210428120010.337959-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org



On 4/28/2021 5:00 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the for-loop in ksz8_port_init_cnt is causing a static
> analysis infinite loop warning with the comparison of
> mib->cnt_ptr < dev->reg_mib_cnt. This occurs because mib->cnt_ptr
> is a u8 and dev->reg_mib_cnt is an int and the analyzer determines
> that mib->cnt_ptr potentially can wrap around to zero if the value
> in dev->reg_mib_cnt is > 255. However, this value is never this
> large, it is always less than 256 so make reg_mib_cnt a u8.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
