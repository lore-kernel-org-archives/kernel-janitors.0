Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51885C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon, 27 Sep 2021 07:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3030660EFF
	for <kernel-janitors@archiver.kernel.org>; Mon, 27 Sep 2021 07:44:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbhI0Hpw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 27 Sep 2021 03:45:52 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56260
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233242AbhI0Hpv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Sep 2021 03:45:51 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 236D740790
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Sep 2021 07:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632728653;
        bh=htaLTDZZkgu7tl4XeHwMK8H3VrFMP4P87AMifpOoa/0=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=BVfvOXBPlyEo4aF8lxxzPi6CbIsEAufzfv5FkG6QzKI0V+EhuHY0XlKUQ+rr9J7V9
         CNqYvMLgSsps9GMh7g8YiZVkU6X2+rSLI7p+pJEmNpOoBwOlDvDEGBRYhxiIeeje0B
         ZcT8FHev2SMbsaqcPvDcvkDTwhZyC9/hVY9NoR2CdgwUCBjQBJCyVqgG1qgK/MuxXr
         w//oVobSe897sj/J9bl4PvwIQWbMoR4mnbnAln8y7iaWsWoHG5pzev6dAabhwF1k7f
         yODAqqy61+gT8T4H1xXdDB7fHHOJUq5u2cTQ3K7J9eUeHnBGim9HVaodbqd1Hkzfhj
         VYsGtq84dLqbA==
Received: by mail-lf1-f70.google.com with SMTP id s8-20020ac25c48000000b003faf62e104eso14970702lfp.22
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Sep 2021 00:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=htaLTDZZkgu7tl4XeHwMK8H3VrFMP4P87AMifpOoa/0=;
        b=uk9fiA+rYDNMPo5WRENpRzeCRBH0eBV2bqLwSyNmE9XCRaKxarROJ69ZhQ/4w7knC0
         OkRTinD+GEdnTwTwovFO3LrM9OXB+AX7RFlol/OPpVcDd2c9JKaYgBHux8tWy5keQWQB
         AdClj2aaMNbgSee4VDA93s5Z70rE1uYQqxfrXfStRa958kzOOmUSFlXd3pzQ5oT0AXKC
         MBdtheNqHyCp+OcYHlMdtH9+B931sNZgZiNgi9vgCBhuWqqQj3lXyzopnJ0jhZ/BeTLN
         v4+ukfemdUri3VXb09kw5M1/M1RPRkyZ5HT7EdYbwhGvYaVPPFPrUukAEEIHKfDIhvuz
         TKeg==
X-Gm-Message-State: AOAM532dqZQ7/JoJXXTRAD5lUQR2mmA0nZ1g5Ngg56u8IuWZ54KrQxd8
        FQgYRjucN29Nj6SxSjOR+LGE4xGfEnXLHUWuXZKH7QbrHZIG8ZTt/F7LRWkN2B9FXBXT5H1yL6h
        xbhtdF4xQ93/y+nIuUpEUDgKcxvvS51+M92CfiD9zdfKQxg==
X-Received: by 2002:a2e:3518:: with SMTP id z24mr27233372ljz.312.1632728649764;
        Mon, 27 Sep 2021 00:44:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsBPqk+42GRnHj24mRBSkSUyLsAH+OiaLvc6OiaoVfffDGAynSIIA12TyR3dhF6Ye2kYvS7g==
X-Received: by 2002:a2e:3518:: with SMTP id z24mr27233357ljz.312.1632728649608;
        Mon, 27 Sep 2021 00:44:09 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e5sm1907825ljj.129.2021.09.27.00.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 00:44:09 -0700 (PDT)
Subject: Re: [PATCH net] nfc: avoid potential race condition
To:     Jakub Kicinski <kuba@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Samuel Ortiz <sameo@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        "John W. Linville" <linville@tuxdriver.com>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210923065051.GA25122@kili>
 <3760c70c-299c-89bf-5a4a-22e8d564ef92@canonical.com>
 <20210923122220.GB2083@kadam>
 <47358bea-e761-b823-dfbd-cd8e0a2a69a6@canonical.com>
 <20210924131441.6598ba3a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <81b648d2-0e20-e5ac-e2ff-a1b8b8ea83a8@canonical.com>
Date:   Mon, 27 Sep 2021 09:44:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210924131441.6598ba3a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 24/09/2021 22:14, Jakub Kicinski wrote:
> On Fri, 24 Sep 2021 10:21:33 +0200 Krzysztof Kozlowski wrote:
>> On 23/09/2021 14:22, Dan Carpenter wrote:
>>> On Thu, Sep 23, 2021 at 09:26:51AM +0200, Krzysztof Kozlowski wrote:  
>>>> On 23/09/2021 08:50, Dan Carpenter wrote:  
>>  [...]  
>>>>
>>>> I think the difference between this llcp_sock code and above transport,
>>>> is lack of writer to llcp_sock->local with whom you could race.
>>>>
>>>> Commits c0cfa2d8a788fcf4 and 6a2c0962105ae8ce causing the
>>>> multi-transport race show nicely assigns to vsk->transport when module
>>>> is unloaded.
>>>>
>>>> Here however there is no writer to llcp_sock->local, except bind and
>>>> connect and their error paths. The readers which you modify here, have
>>>> to happen after bind/connect. You cannot have getsockopt() or release()
>>>> before bind/connect, can you? Unless you mean here the bind error path,
>>>> where someone calls getsockopt() in the middle of bind()? Is it even
>>>> possible?
>>>>  
>>>
>>> I don't know if this is a real issue either.
>>>
>>> Racing with bind would be harmless.  The local pointer would be NULL and
>>> it would return harmlessly.  You would have to race with release and
>>> have a third trying to release local devices.  (Again that might be
>>> wild imagination.  It may not be possible).  
>>
>> Indeed. The code looks reasonable, though, so even if race is not really
>> reproducible:
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> Would you mind making a call if this is net (which will mean stable) or
> net-next material (without the Fixes tags) and reposting? Thanks! :)

Hi Jakub,

Material is net-next. However I don't understand why it should be
without "Fixes" in such case?

The material going to current release (RC, so I understood: net), should
fix only issues introduced in current merge window. Linus made it clear
several times.

The issue here was introduced long time ago, not in current merge
window, however it is still an issue to fix. It's still a bug which
should have a commit with "Fixes" for all the stable tress and
downstream distros relying on stable kernels. Also for some statistics
on LWN.


Best regards,
Krzysztof
