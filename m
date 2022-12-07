Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16426C63705
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Dec 2022 21:25:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbiLGVZn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Dec 2022 16:25:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbiLGVZm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Dec 2022 16:25:42 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B587B55A
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Dec 2022 13:25:41 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id y17so18270367plp.3
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Dec 2022 13:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n7Wqad3a8IV5+ECQhv7lWrLN4DRro+qo2JkXKZnEYlk=;
        b=aA9X9Fd7k9K0PV7K3Z3gnZwSu8VOuiCOXNS6E8bHwHi6cg1VJ+PCAG375nLpa9ng78
         W2ZwL2eG/vrKXXQRZFJMZHpnSMUkBFF3L27LwIHGNS90X14+Ef0jl6h9smk/ows9PeZ/
         KpLm6WfIMp4xVPMerzBCsNnDWznbZp9wwf1VAn6CKSjWpeHnk+i/XyMgNtQI1+JK5cFz
         fSIHo0SHR1CB+sDox/cABXVK2iDaTIxBCKvgDiIQ7PeMh6YK+IVOTsJhDwTqvcYJ1v/9
         znol9s8Hikopre/rr1erAQdY0rA+DJc/9zNLS4Chk3hF3sOFNwaCTgSN47yLRAmjHd+H
         0VPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7Wqad3a8IV5+ECQhv7lWrLN4DRro+qo2JkXKZnEYlk=;
        b=fvkY9fJLIKsFaymVEVPh7YRQEkm8fN1L0LGeaTgNcqN1QLKqlyo3vH4HyrO2clrsMs
         JRvVLD/MkfQ7Qzy/R4Eu5OGhnZzZsINoPTbS0tfnAWM38koRIleYfYNL3t4xANsSosb9
         mqV4IAANHPSfsKxLxPMdSsPwevcTpGDAyCyqj44ke0FPufuSXhLA6u8HgCfI2EyN4NmV
         5ElZnIerTv8MmmZBAUb7dNQlIGBGIbWPXkGD7sjOrPOyp/ti2V3R6S2Hs78f5dln/SPA
         0FZJRdeNjSqGkus2Zo5DOgXtGWm1CO6DNXcSknXvStWpLbamRu8+vBZRO1SjzyDYTCB8
         6vdA==
X-Gm-Message-State: ANoB5pm+iv3AoJgQmJGhPvr7a54qL581gm7dA4BhTduhOdu2lB0TR2v9
        kVk8vhY/JKtyAogsNBalsxoVFA==
X-Google-Smtp-Source: AA0mqf41RecvyUijjUGjKliHLNPG9FPRbNNOgwX4eGv1lZljQ1dLvQnmSxhSfIejb2l/XPFBc1KQwg==
X-Received: by 2002:a17:90a:5641:b0:219:c2f2:f83c with SMTP id d1-20020a17090a564100b00219c2f2f83cmr725499pji.2.1670448341034;
        Wed, 07 Dec 2022 13:25:41 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id c9-20020a63ef49000000b0046feca0883fsm11675494pgk.64.2022.12.07.13.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 13:25:40 -0800 (PST)
Date:   Wed, 7 Dec 2022 21:25:36 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Vitaly Kuznetsov <vkuznets@redhat.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: adjust entry after renaming the vmx hyperv
 files
Message-ID: <Y5EE0MOaLGZUqa38@google.com>
References: <20221205082044.10141-1-lukas.bulwahn@gmail.com>
 <87pmcydyp0.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmcydyp0.fsf@redhat.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Dec 05, 2022, Vitaly Kuznetsov wrote:
> Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
> 
> > Commit a789aeba4196 ("KVM: VMX: Rename "vmx/evmcs.{ch}" to
> > "vmx/hyperv.{ch}"") renames the VMX specific Hyper-V files, but does not
> > adjust the entry in MAINTAINERS.
> >
> > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> > broken reference.
> >
> > Repair this file reference in KVM X86 HYPER-V (KVM/hyper-v).
> >
> 
> Fixes: a789aeba4196 ("KVM: VMX: Rename "vmx/evmcs.{ch}" to "vmx/hyperv.{ch}"")
> 
> maybe?

Ya.

> 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ceda8a0abffa..8fda3844b55b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11457,7 +11457,7 @@ F:	arch/x86/kvm/hyperv.*
> >  F:	arch/x86/kvm/kvm_onhyperv.*
> >  F:	arch/x86/kvm/svm/hyperv.*
> >  F:	arch/x86/kvm/svm/svm_onhyperv.*
> > -F:	arch/x86/kvm/vmx/evmcs.*
> > +F:	arch/x86/kvm/vmx/hyperv.*
> >  
> >  KVM X86 Xen (KVM/Xen)
> >  M:	David Woodhouse <dwmw2@infradead.org>
> 
> Reviewed-by: 

Since Vitaly left you hanging :-)

Reviewed-by: Sean Christopherson <seanjc@google.com>
