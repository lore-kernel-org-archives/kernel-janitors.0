Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73848C433E6
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 20:12:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22C2A64F18
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Mar 2021 20:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233014AbhCRUMT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Mar 2021 16:12:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233069AbhCRUMN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Mar 2021 16:12:13 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799F6C06175F
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Mar 2021 13:12:12 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id n21so3662832ioa.7
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Mar 2021 13:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fE3QA5oVISAeniCnc22I06REx88dvUk/H2NhLG/WPYo=;
        b=wULFbTjKPWg+ouVh7oEGiL4gc4ocuk2ih3Of1Twrp/HfdqdikFV9eMhCQ41D/DIPIN
         UUgWZxBPZl5QZrBKvJCB42RpsfSao/OD5syRUWEvqWOPNxBOW7oEmbdbmENHbPwdH01/
         T/b9pUYv+Kdgz7YbrsnM6fQy9kjOypiw1decRFdA/oFGaA2Y2by5QzhS2HueBguixCWn
         uSI2CiFYE+fsV5WnnN9iKf7V3vo/WdPVQ7rEdhoL0jVUvi7MGcn3D4+WV8x4XE5bfYEI
         VM2ulO8gK2DsZUeTaEGjIXaDiVzlefBAhMgG65/s5yymMBsEdplA7Tbrzg+kmWW8RSeq
         DmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fE3QA5oVISAeniCnc22I06REx88dvUk/H2NhLG/WPYo=;
        b=O2mErCT5kgoLdpw6Cbywi8WcEct6cd4B+/D99KE41wB4P/+2GOUjVdu0Tnq6gnosPI
         hUbH1EMNfa7jqFxxpk0Uc0sm6sxLPkbawv3VwjKJDOgb7IEHzugysDTCTMfw5Up/UGwB
         lMTiCDLlF4ui+34ojJH2ikh89jThbaaRAdE2/l/fEyRJTHl/LrP8utAkDeDXNvyJsVaD
         Cmci/4i7ey+ukPLhhSJhwtY/CLOfz4XSeJQWhwLnlvAM1md4QnJVilt9CDOuphzDReL1
         YYaZWsD1QyZmUlng/NXF6JGwTDi9XbIOyy0hvLFBxb937E768KOfZ284WiCy5ZHAdK0+
         qvjQ==
X-Gm-Message-State: AOAM533dEiPh5hxo/2Kqy/YDNGLmejtADA0fD0f9VDZmdpS2NQTBXjZQ
        sbveOHYRavi4lfc7mlsRfUUBtw==
X-Google-Smtp-Source: ABdhPJyZGUS1QzyLSU5oGUZFvE13ExXRv25cksaZq2RdSXMBwp4hgAYBpiZvjWMNRU0K6YCiiXA1gA==
X-Received: by 2002:a05:6638:3399:: with SMTP id h25mr8490761jav.15.1616098331905;
        Thu, 18 Mar 2021 13:12:11 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id c9sm1580785ili.34.2021.03.18.13.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 13:12:11 -0700 (PDT)
Subject: Re: [PATCH][next] loop: Fix missing max_active argument in
 alloc_workqueue call
To:     Colin King <colin.king@canonical.com>,
        Dan Schatzberg <schatzberg.dan@gmail.com>,
        linux-block@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210318151626.17442-1-colin.king@canonical.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <13a1d187-4d6d-9e06-b94a-553d872de756@kernel.dk>
Date:   Thu, 18 Mar 2021 14:12:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210318151626.17442-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 3/18/21 9:16 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The 3rd argument to alloc_workqueue should be the max_active count,
> however currently it is the lo->lo_number that is intended for the
> loop%d number. Fix this by adding in the missing max_active count.

Dan, please fold this (or something similar) in when you're redoing the
series.

-- 
Jens Axboe

