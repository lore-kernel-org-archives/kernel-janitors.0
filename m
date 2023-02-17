Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31B8C636D7
	for <kernel-janitors@archiver.kernel.org>; Fri, 17 Feb 2023 19:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbjBQTd3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 17 Feb 2023 14:33:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbjBQTd1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 Feb 2023 14:33:27 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC98D582B0
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Feb 2023 11:33:07 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 4-20020a05600c22c400b003dc4fd6e61dso1700517wmg.5
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Feb 2023 11:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=grsecurity.net; s=grsec;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7P7MflaWpXYQfD6IKZsdwP5oFsSsaEC7e6p8ArHuhRk=;
        b=MM77SFJNQaAr50RLNAkmsYdV5rbkafzGlHGV2lcEqC0AqS0bXw9RkZ/nCL0fYxO3ey
         9wGLn0WjtY122/lgQWQiwtemieT1gYCb6/Jjt7a9N6uyq/mJql3a3HtRyvXcsLg3eeRE
         ykvzZka1uteNMG6pk4GwFJC+8GAVawxAuz5tDYdKQf5DlOgMhpMRnyHAVcCYYaEF27Oq
         nzXOPnK+DrqUL9nU+MpCC/7O1JafhQnAf1LHbDg5VCh1VFU+gCtnob3nZD4nJQt0DJBI
         isbw2C/c9v6mgLpEwMJltxEw0y7KqhVH0XOlMSYKMAMje7thabQ/NKtPzJ5mIhdD2A+4
         OMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7P7MflaWpXYQfD6IKZsdwP5oFsSsaEC7e6p8ArHuhRk=;
        b=ntAtoZlqUQ/4gqSARb5MpAHD/6QEOu9CUKZRBTLFM/1rupk2hPAjq85OiBftbeh1PF
         Qs6kEbGYd783L4rOwxvBLrcBET6K4M/XTxEzVHcStI+WKNnplwSpm/DxbZB7alRi6cm6
         VB0hB9+2HpdD82OkBUsDAxG9rH99SkATpoQ9m+aTfCwj9uerjyB3LGShC0VRbn5o9ihb
         jOqH2JU3NZdunU0Aop+mxLMhMqvAyIaxJkE7u2+JD+CCLamzrPTVn9/F37o0XAoow61i
         +Fbjnha91kCgu1VSmuQb53Ohq9i31/NEtnpe2YzOJIc1poXjW/7fQib2wsLVsAtgWBEo
         Ij/g==
X-Gm-Message-State: AO0yUKU83D28ulW0wxjsei6fiqE/aExsb/m6drIX8LgmSaUiQizvAx78
        UqEVRezH10IpIomizzCXVXBMaOSNAGZpwRJUgMg=
X-Google-Smtp-Source: AK7set+1BE3TKM3KTrihpM0VlLi49tlM7qrFm/+jUkKOALb8aIBmBnr3dura/EZeRe90kEScbQsqlA==
X-Received: by 2002:a05:600c:601b:b0:3dc:545f:e9ce with SMTP id az27-20020a05600c601b00b003dc545fe9cemr1296991wmb.24.1676662386249;
        Fri, 17 Feb 2023 11:33:06 -0800 (PST)
Received: from ?IPV6:2003:f6:af46:5a00:93e3:335:818b:a454? (p200300f6af465a0093e30335818ba454.dip0.t-ipconnect.de. [2003:f6:af46:5a00:93e3:335:818b:a454])
        by smtp.gmail.com with ESMTPSA id q12-20020a7bce8c000000b003daf672a616sm6015667wmj.22.2023.02.17.11.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Feb 2023 11:33:06 -0800 (PST)
Message-ID: <b80bdc6d-a9f9-249e-77fd-bc5c553126df@grsecurity.net>
Date:   Fri, 17 Feb 2023 20:33:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] KVM: Reorder fields in 'struct kvm_mmu_memory_cache'
Content-Language: en-US, de-DE
To:     Sean Christopherson <seanjc@google.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, kvm@vger.kernel.org
References: <f9423a6ee10d91bd6bad32beefd1b96cad4d28f1.1676620879.git.christophe.jaillet@wanadoo.fr>
 <Y++uHlQz7OEOzojb@google.com>
From:   Mathias Krause <minipli@grsecurity.net>
In-Reply-To: <Y++uHlQz7OEOzojb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 17.02.23 17:41, Sean Christopherson wrote:
> On Fri, Feb 17, 2023, Christophe JAILLET wrote:
>> Group some variables based on their sizes to reduce hole and avoid padding.
>> On x86_64, this shrinks the size from 40 to 32 bytes.
> 
> Heh, a hair too late[*].  Unless I'm mistaken, Mathias will be sending a new
> version in the not-too-distant future.

Jepp, patches should appear here anytime soon:

https://lore.kernel.org/kvm/20230217193336.15278-1-minipli@grsecurity.net

> 
> Thanks!
> 
> [*] https://lore.kernel.org/all/Y+puefrgtqf430fs@google.com
