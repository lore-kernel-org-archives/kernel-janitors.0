Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715D7C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 24 Sep 2021 08:21:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52496610CF
	for <kernel-janitors@archiver.kernel.org>; Fri, 24 Sep 2021 08:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244657AbhIXIXL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 24 Sep 2021 04:23:11 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47380
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244645AbhIXIXJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 24 Sep 2021 04:23:09 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DF08C40291
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Sep 2021 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632471695;
        bh=JWgjuZfGDaWPsjxjtj1IRAaOEbXBqacMg+TIH6edpzE=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=hyAkTak5UHsEP9cmrIz68TktB82uNvwLRFBxQGXCZXgChdXDHmGZwRMYjy/iU69zN
         qpIYraT14F/4zn5siJK1/4oa7ao5EDLX0dTvO/lXEVfh/pyyiu8kpBRK2OJBPyZppk
         C6LF46Vm8FYKZQ+WAKxVjSFcmFmmZn4qp4U3WOnxK06ffdJmTAlLoO2R+rf3LvVTeY
         VuR5qiwDhSjl6SAkfWBtPIq2leP03A+lCfG4NPqvJ8fVYOIK5y36Dk9UYxkGHFVALX
         r5ZmNeolvqDlSd4hqV0m/uil2u1ThMjNJ6+Ao8tN+jnL5OvStOotZfFWwhrt3sswWG
         CASWCb1xgNkHg==
Received: by mail-wr1-f70.google.com with SMTP id f7-20020a5d50c7000000b0015e288741a4so7404248wrt.9
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Sep 2021 01:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JWgjuZfGDaWPsjxjtj1IRAaOEbXBqacMg+TIH6edpzE=;
        b=URXtGNuA/4Fvyl07Ex/LxHx1x9BszmcZ7n1jTvlwk6Gtt2woymWEMbWVfnjGV4TCWR
         SgEzTdcHGAYD3YOlOMcFQP0hO6Eg0TPXWHEUCwNYRzdHNOZ3ZKpo4vqKP7ItKMxblIKA
         PTGka7Di+mLjL6CKoOQMrW5e/rSIlqYxMwkBLpWZXZaESG47kVvMdPvjfgS811kyg0HK
         jP3i6C8PtLr8zCJp2YhASKs14BLZNCHsmCKq5DyX3o+cUNo9+yLroK18GQXau8SHMCxk
         HxaDaKnTF+VZnia/5Wp2dkMcVLGs+dYS8vg8A6Znrl8Vb/d7mUYmABRbxl+jBxU4zaNp
         ACTg==
X-Gm-Message-State: AOAM531DNpv+m84PwACP4mbGNNKc5tkemsLd2v3UuahNZbqrMWgYrKST
        spHVfNSB3DZmgeU99y/uHsAQ4QbTb4HjyMCjD0rincuK0d+hLRsxW9S+z0kT8BEYAT5Nn468M0s
        L7j14f/vMTvfDKLayoL+4RBlESCZrwLWdLRyeV56e4nYbnA==
X-Received: by 2002:a05:6000:18a4:: with SMTP id b4mr10027150wri.288.1632471694744;
        Fri, 24 Sep 2021 01:21:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdrzw0Jz4NtTwhrP+xRL1oW5GyOxY0dFEjjzkD3TJJJHosDjKQ0GZ/gx4xSgDXjtotA3E2Fw==
X-Received: by 2002:a05:6000:18a4:: with SMTP id b4mr10027137wri.288.1632471694616;
        Fri, 24 Sep 2021 01:21:34 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id r5sm7319637wrm.79.2021.09.24.01.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Sep 2021 01:21:34 -0700 (PDT)
Subject: Re: [PATCH net] nfc: avoid potential race condition
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Samuel Ortiz <sameo@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        "John W. Linville" <linville@tuxdriver.com>,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20210923065051.GA25122@kili>
 <3760c70c-299c-89bf-5a4a-22e8d564ef92@canonical.com>
 <20210923122220.GB2083@kadam>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <47358bea-e761-b823-dfbd-cd8e0a2a69a6@canonical.com>
Date:   Fri, 24 Sep 2021 10:21:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923122220.GB2083@kadam>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 23/09/2021 14:22, Dan Carpenter wrote:
> On Thu, Sep 23, 2021 at 09:26:51AM +0200, Krzysztof Kozlowski wrote:
>> On 23/09/2021 08:50, Dan Carpenter wrote:
>>> This from static analysis inspired by CVE-2021-26708 where there was a
>>> race condition because it didn't lock_sock(sk) before saving
>>> "vsk->transport".  Here it is saving "llcp_sock->local" but the concept
>>> is the same that it needs to take the lock first.
>>
>> I think the difference between this llcp_sock code and above transport,
>> is lack of writer to llcp_sock->local with whom you could race.
>>
>> Commits c0cfa2d8a788fcf4 and 6a2c0962105ae8ce causing the
>> multi-transport race show nicely assigns to vsk->transport when module
>> is unloaded.
>>
>> Here however there is no writer to llcp_sock->local, except bind and
>> connect and their error paths. The readers which you modify here, have
>> to happen after bind/connect. You cannot have getsockopt() or release()
>> before bind/connect, can you? Unless you mean here the bind error path,
>> where someone calls getsockopt() in the middle of bind()? Is it even
>> possible?
>>
> 
> I don't know if this is a real issue either.
> 
> Racing with bind would be harmless.  The local pointer would be NULL and
> it would return harmlessly.  You would have to race with release and
> have a third trying to release local devices.  (Again that might be
> wild imagination.  It may not be possible).

Indeed. The code looks reasonable, though, so even if race is not really
reproducible:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
