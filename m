Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C926FC48BDF
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 16:38:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF69C6134F
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 16:38:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbhFVQk7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Jun 2021 12:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbhFVQkx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 12:40:53 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D07C061756
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Jun 2021 09:38:30 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id bb20so8237751pjb.3
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Jun 2021 09:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3STMsch4X3DHLr8z4bBHjozjW70mR8Uwk306HzfJxdE=;
        b=ikxL95WseTOiuX3iub6AAiU7LJIWsjvNoJS0/F1fh762+zi5idvDJQtwZYHJ9byHSm
         xAD+/LN2Ii5x3v1I+lLaL11iymQjc3gHF5VGP/M671+7NlB+pALQdK/7U9AxM7+thYUg
         KLFDLVj1OUHClfDicKHPIA7lTaHWC+lIUsyefMN5/tVAI7FuMyPRKgo0uYFU3Sa6aCSL
         J6kmCV/H4ru0McPjc/TmZ2ijtTxBLMjSQyM5mBUQnqpCi5LxxmM1c43ACvmhJ0LhHHHY
         o8xMutgDa1qGr28d2De1NcfaWYgFBfnGo2sPQCCNRnpaKFrlf9iuNKY3pgoV9oZqt2Qd
         VJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3STMsch4X3DHLr8z4bBHjozjW70mR8Uwk306HzfJxdE=;
        b=Tz4qD+dikGCoye34wZvogrZdnf9/T9jcE/la0R6cPpH7G3TrserdNpkZkiJ4K0Q5cG
         GKWapPqt5LSecBJCFU0YlJZiI+R0me0jI87l0vTY/+D7rfr1X4JOz6wKevPF6fuvnyNi
         TugiMLo/surOFdcmrMd46zNj7CN5Zna6EWtgTbpQpOFqbCx0MKZJp7lQNTIa6bkL1tXC
         JAed1ClW0IYHD19EzblFLJlNbHyTgV3My34/Tgbh99+96xND7h6gTTtb/+PZN7t23G5S
         U++ZRtetAvvTh2FFnmVlgW8eXI9SAIN8T/aDxRy6n5Fn7E/TxVsN/dUeLgKmvOn538I9
         vJlQ==
X-Gm-Message-State: AOAM533IlMYbhnxtfxtY5FCKEBkyoPmDaElHKnkqgHo/tz97lw+6wWwv
        EPr0x/XzdXsjk9PUmCaYqghkrg==
X-Google-Smtp-Source: ABdhPJwlMUw/8cV9tZjTDpOthfL+7WdZDlGmmpNtw1OUgeadX54a6ryH0XB3nok/CW6wdYLS3pFBwQ==
X-Received: by 2002:a17:902:b288:b029:f8:fb4f:f8d3 with SMTP id u8-20020a170902b288b02900f8fb4ff8d3mr23313243plr.25.1624379909756;
        Tue, 22 Jun 2021 09:38:29 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id h8sm19052242pfn.0.2021.06.22.09.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 09:38:29 -0700 (PDT)
Date:   Tue, 22 Jun 2021 16:38:25 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Ben Gardon <bgardon@google.com>, kvm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] KVM: x86/mmu: Fix uninitialized boolean variable
 flush
Message-ID: <YNISAXXPWnhJlurO@google.com>
References: <20210622150912.23429-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622150912.23429-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 22, 2021, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where kvm_memslots_have_rmaps(kvm) is false the boolean
> variable flush is not set and is uninitialized.  If is_tdp_mmu_enabled(kvm)
> is true then the call to kvm_tdp_mmu_zap_collapsible_sptes passes the
> uninitialized value of flush into the call. Fix this by initializing
> flush to false.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: e2209710ccc5 ("KVM: x86/mmu: Skip rmap operations if rmaps not allocated")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Reviewed-by: Sean Christopherson <seanjc@google.com>
