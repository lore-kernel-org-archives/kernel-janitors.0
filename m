Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9795C433E0
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 17:52:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6525861A0D
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 17:52:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhCZRvj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 Mar 2021 13:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbhCZRv0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Mar 2021 13:51:26 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECFE2C0613B1
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 10:51:25 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id d2so5691156ilm.10
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 10:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=euxpSkKZsbBi+wcR3rfJjwiU7iLCyXxn3SXHsO4EML4=;
        b=DSU8OH7FvYaqdnYyVDG0rgompnvNDC46skuht74sguikXGrjPmrNT0eYhffkOTEfs7
         AJ2L27+8Uq1q9pwjhsX9eI866Y7HDEO3phsvuip5p5AizAdnzxnQXlkVm/czMc4eAXx/
         ZZf84l9QpxvVvnZ3/l7mVhWNJJttaTKnpoI60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=euxpSkKZsbBi+wcR3rfJjwiU7iLCyXxn3SXHsO4EML4=;
        b=g5UnZiFInzcCQ3XCG3JHCkl2Z6NsajEu8t4fIy6URXy0r4dwbD9myonJ6fK+PN16qh
         oCgxWj6IIR31T5qvzFMxMK9JzqXA1KojqNSdxRTlRm7SDn6VzrtUhTZLttTKdmEzcyS4
         OXNb30AMBsqp481xrUaTWfh2iCA4bKilzKmL39P1VqQMsQM+3RpinBxCXMPEh4F7GXQS
         IawAuXB09AWIGuNZn9V5HYVghom9omDB7h2a9t12dT3raZFTF/JQ1kIj2bCes/yTzhsJ
         YKp0galt7x4OpU84oT5sE6Va2dcLYH+ZZrdvryEhm/hmJuZ5FNNGfvtOuHy1qqGukHb8
         dAWQ==
X-Gm-Message-State: AOAM531OsKROkUM7a+a+lsyC0EVY0iX1fs9qCGpKsN/ReBqjq+TfdpHD
        +SXCj8HEtMQs2QihoSJIAAfsLQ==
X-Google-Smtp-Source: ABdhPJzOJwAKgsZnIvfpcWuFy6OwqYGvXMYKA4jujrHo34M9jWp49zAnbxULyebzbh45m04J7Y/rvQ==
X-Received: by 2002:a92:2c04:: with SMTP id t4mr11726344ile.99.1616781085287;
        Fri, 26 Mar 2021 10:51:25 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id e195sm4667537iof.51.2021.03.26.10.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 10:51:24 -0700 (PDT)
Subject: Re: [PATCH] selftests/timers: Fix spelling mistake "clocksourc" ->
 "clocksource"
To:     John Stultz <john.stultz@linaro.org>,
        Colin King <colin.king@canonical.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>, Shuah Khan <shuah@kernel.org>,
        linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210315123303.10218-1-colin.king@canonical.com>
 <CALAqxLW1VaMTVx3piKnLcEqWxMcQFG9LujH1ijHP2dbXBQaxqA@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <60bb110d-799c-e4cf-6107-d5dff72187fc@linuxfoundation.org>
Date:   Fri, 26 Mar 2021 11:51:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CALAqxLW1VaMTVx3piKnLcEqWxMcQFG9LujH1ijHP2dbXBQaxqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 3/15/21 12:41 PM, John Stultz wrote:
> On Mon, Mar 15, 2021 at 5:33 AM Colin King <colin.king@canonical.com> wrote:
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> There is a spelling mistake in a comment. Fix it.
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Akcde-yb: John Stultz <john.stultz@linaro.org>
> 
> I kid, I kid!  My apologies and thanks!
> 
> Acked-by: John Stultz <john.stultz@linaro.org>
> 

Thank you both. Applied now for 5.13-rc1

thanks,
-- Shuah
