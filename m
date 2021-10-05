Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160FCC433F5
	for <kernel-janitors@archiver.kernel.org>; Tue,  5 Oct 2021 20:52:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBA386138F
	for <kernel-janitors@archiver.kernel.org>; Tue,  5 Oct 2021 20:52:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbhJEUyp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 5 Oct 2021 16:54:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59951 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230019AbhJEUyo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 5 Oct 2021 16:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633467173;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZXo9Quk6Y4H0fsDPUHzerD1eOvkjUACN8PkdHlibKSQ=;
        b=W3+4PwNkTwnFPejAjTpTBNXFZ2pSc5bUviKDbacwI5/6heuDRarIazUgHMXap4zJ2SUqXE
        glbgYlSduV+rVlMDHqIKU/K2CiW9+8D48scF1eqr3eJvoxi6vZt1JD0JZUNeHC92rItom2
        zDL9R4YmcX9VPbvb02+6oaT/DFQ2CYc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-rQEX-C9AOqWyaTYNa2Ey8A-1; Tue, 05 Oct 2021 16:52:52 -0400
X-MC-Unique: rQEX-C9AOqWyaTYNa2Ey8A-1
Received: by mail-ed1-f70.google.com with SMTP id u23-20020a50a417000000b003db23c7e5e2so475771edb.8
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Oct 2021 13:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZXo9Quk6Y4H0fsDPUHzerD1eOvkjUACN8PkdHlibKSQ=;
        b=XvfHJ8VOyQXIK5GWf7WvZQMfMyU++/F7m9yoyTqK0w15hM91RoU5byFejdPhFGuEQl
         jfUO8KKo1ZqfAD+Vi6xZKBzZVitbkTNyFrTlooRjOMvs/v7dLRDDmKPpF9RY7Ms72iIa
         BtnEoJrwECLdypqz84skarfdnlTsIOkZ99O4/B3x2yL2DWFt1/2POVp3px8Rmw6PIb8b
         6eiEbp407N9Lnt6GCW/A+Vx3Fm+uPojyxbK7DBCoUdF6LlsaaksUG1O6XkrfhzWqHY1o
         B6PxgC3r3+9wVjS1j5forV7IpyaZ8ZlAFZKHsNFAj5RaZ7ZvCfAtFO/z7RZi+pgOZKff
         H82w==
X-Gm-Message-State: AOAM532TK8tAffAYn7TWc4QU9VKjF6VbrkzSIcWcHCx/Gunw/IpnVVKs
        DLDI5UWl4sF+EbEaUnaxL6Zk4d3xoFm6SfxveL6uEPfLPlipiQVgks1y/gauoNecM9OEOUGTudh
        urFZzLIkuRab7eV+2MaOLXVx+Q/KU
X-Received: by 2002:a17:906:d182:: with SMTP id c2mr27048682ejz.47.1633467170983;
        Tue, 05 Oct 2021 13:52:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzS04pr73Ai2y9+5IP0WTOsQuT9DuyYh0xBiqeTFvHj3RCq/Wp2hs521FyPkADYGpY/sYu0lg==
X-Received: by 2002:a17:906:d182:: with SMTP id c2mr27048663ejz.47.1633467170772;
        Tue, 05 Oct 2021 13:52:50 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.gmail.com with ESMTPSA id n6sm9243298eds.10.2021.10.05.13.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Oct 2021 13:52:50 -0700 (PDT)
Message-ID: <54360564-57e4-60de-60be-13177448ebc5@redhat.com>
Date:   Tue, 5 Oct 2021 22:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH][next] KVM: x86: Fix allocation sizeof argument
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>
Cc:     Colin King <colin.king@canonical.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        David Stevens <stevensd@chromium.org>, kvm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211001110106.15056-1-colin.king@canonical.com>
 <YVxyNgyyxA7EnvJb@google.com>
 <ebd506ba-05cc-99d7-ece5-34bd67fc2430@redhat.com>
 <YVyRnV9cMLzazBx6@google.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YVyRnV9cMLzazBx6@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 05/10/21 19:55, Sean Christopherson wrote:
>   I wasn't suggesting a full revert,
> rather a "drop and pretend it never got applied", with a plan to apply a new
> version instead of fixing up the current code.

Considering that there are issues in the rmaps as well, I'd rather fix 
both the right way.

Paolo

