Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E139BC433E0
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 08:12:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B138464EE9
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Mar 2021 08:12:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbhCLIL5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Mar 2021 03:11:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbhCLILU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Mar 2021 03:11:20 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A31C061761
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Mar 2021 00:11:19 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id k16so1496481ejx.1
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Mar 2021 00:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares-net.20150623.gappssmtp.com; s=20150623;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GSE8y8bIzwkaWbk//Q7yq5aLD9kknS5nbctb3k5BKZQ=;
        b=i4RoYovqjn3gmv9OLHb902+P3Zv95u5vk4yHmh3+kjERn58bqd+uW4hVDRXGSgW4dp
         tfxSBRUiSlkpWWCPYe/nNT6QzPCYedLCv6MXBlEBS31WfrhZsQUkkQ+ADrnbEB98uGFq
         TaGkY6++ptJbn53XYZ8Pgzd2gsQowO+w7H8AjyIZvbEvKu+I0mURf3wSPwXBzVYHwLVS
         O2H6HEoVg7ZI+dPi2rv9fDbH89e97Q2H6RPqMCe4JbjFFMFmMVjwntUY4+NTgABazju9
         3dGMWgZRYmlc9SJIs/ATWjFITP6hit5wgFCrvxhy0tr0f9g8qvQSHvqJsy6xYGUAX31M
         AmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GSE8y8bIzwkaWbk//Q7yq5aLD9kknS5nbctb3k5BKZQ=;
        b=Z8JzdEilIhg38nsP8GV/FDT+FMhQpxMPEVWje2qk9CxKKdmKD47kNkJTmLdug31mP+
         dMlynX7yUeILZcqNhvIXsRAal2iad7N2nBVWGgUNB1WKq4/6GTLeC14zkF7F8vfS4K8k
         cR8aTDGpWeo8EckjESOM1GwFzakKn8sZhWHdQW3XkIOJLCcolAbSwks4HsjaG5MS/eSp
         BylzY6qTH/2fm1J5MywJEOeI1I7pYhnzqid8O4MfQ4BQl6P9vk7W8U5gpK7kr3D+abQd
         xYO00XgwajliVmAY4L/MecYQ7eJPFsYCIKmhnp/cYfz1PH++ejdCtnUgIZjOnE6MH9v6
         kWBQ==
X-Gm-Message-State: AOAM532s4luTFg4YqlY4npHz4MxHscx0f3PPA1wGuuzG1Cxk3VRTEiLb
        Qk5dwuP18cxbaNqx2pnkHw+0OA==
X-Google-Smtp-Source: ABdhPJzd7yIu2Mtt/wSmkKfgikCWLHiR0Orv+ZjRzmKUsayaFRB97LPU3kCBn3bvE/gHnjKGKH+uEA==
X-Received: by 2002:a17:907:37a:: with SMTP id rs26mr7211492ejb.336.1615536678651;
        Fri, 12 Mar 2021 00:11:18 -0800 (PST)
Received: from tsr-lap-08.nix.tessares.net ([2a02:578:85b0:e00:76a2:a975:2529:ae9a])
        by smtp.gmail.com with ESMTPSA id i10sm2407121ejv.106.2021.03.12.00.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 00:11:18 -0800 (PST)
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        mptcp@lists.01.org, kernel-janitors@vger.kernel.org,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        Paolo Abeni <pabeni@redhat.com>
References: <YEsbGCmx4Jh3fApi@mwanda>
From:   Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: Re: [PATCH net] mptcp: fix bit MPTCP_PUSH_PENDING tests
Message-ID: <00ef3b75-bc38-a55d-ddcb-cc100dc20e79@tessares.net>
Date:   Fri, 12 Mar 2021 09:11:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEsbGCmx4Jh3fApi@mwanda>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

On 12/03/2021 08:41, Dan Carpenter wrote:
> The MPTCP_PUSH_PENDING define is 6 and these tests should be testing if
> BIT(6) is set.

Good catch, indeed, BIT() macro is missing!

It was not detected by our tests suite because in -net, that's the only 
flag that is set.

But another patch for net-next is coming and another flag can be set as 
well. What's funny is that this other flag is "9" which works well with 
"6" because their bits are not overlapping :)
Anyway, better with "BIT()" macro!

Reviewed-by: Matthieu Baerts <matthieu.baerts@tessares.net>

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
