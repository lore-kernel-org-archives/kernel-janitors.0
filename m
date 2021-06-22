Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F757C48BE5
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 16:43:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10A2F61351
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 16:43:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhFVQpk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Jun 2021 12:45:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53264 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231176AbhFVQpj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 12:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624380203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vqggAYJUg6fHbEAdVvsWBfgBtGxc+6Jb/H8dZhUKvv8=;
        b=VQGYRX+CiX8fexSR/nwTEgaXLIvY8GL4yjlH8nmpVJ5Yh7QoKtgbhlyuF7TLRKJQupJWBh
        M5us08199+ATSKwYnb3p6W2DpPJeXShzRDdpIhHRbCWash7yGwTG8cDSgafmVEpBM4ywM7
        qMSthlwX5iQLhzKenubT/MMre+Y4WQQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-hSgHZ4SeORmCnY3hANbGIQ-1; Tue, 22 Jun 2021 12:43:21 -0400
X-MC-Unique: hSgHZ4SeORmCnY3hANbGIQ-1
Received: by mail-wr1-f70.google.com with SMTP id l6-20020a0560000226b029011a80413b4fso6658274wrz.23
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Jun 2021 09:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vqggAYJUg6fHbEAdVvsWBfgBtGxc+6Jb/H8dZhUKvv8=;
        b=nMxzfWueVhSbYqfOGsHw7mQT3lLc4PXKTt6UNiixc4SAGo9o5xacnkQdn4Ws0zXrIx
         pFjNIpIz8gyP1Y+2Eh1888oJqw64C7aLkX4w7+WxeeMtVR3FFhNA7JRAlKypQSlLVbNV
         wkE6aopBf5csuGcTmKMuyGCYEbfGSHLTMy8f2rVcFj67kRQz+GmWNGFmUfJK87aoZKcG
         r9siHjaORkZkG0nFrc0o3SqRk3dAmAL8dEt4AkJForTVPqgm99MZ0v8EDTBLt7RwFyQi
         KleWrmydj1qZOKFqzjthloXE+WB13qfomgDEQORQysYcHJJJTLb+Wzu+S0VCzl1JCB0C
         4W3g==
X-Gm-Message-State: AOAM530SGRNN+Tl3nVjJCEvwy69kYlr5PDDwzT6nPBhNnsrNtyERNWfK
        YOOH75xApLTw4GFid8po3kt0UFsFjuJI3BLEnUOB/UJL0vgCCMBiq9pXWDnUgwGtCcyid87R8dl
        /UTKmoJLppHsr9KMfkIxCY+/ZXn+9
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr5846232wrr.188.1624380199400;
        Tue, 22 Jun 2021 09:43:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxnu8M4DnxUd81kSwud6iw4Qb+iSUsFgoPTMed1pHs74o/m6tG3gCAKZjSKtKUt82B1iJw/Q==
X-Received: by 2002:a5d:59ae:: with SMTP id p14mr5846216wrr.188.1624380199230;
        Tue, 22 Jun 2021 09:43:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id 2sm2868252wmk.24.2021.06.22.09.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 09:43:18 -0700 (PDT)
Subject: Re: [PATCH][next] KVM: x86/mmu: Fix uninitialized boolean variable
 flush
To:     Colin King <colin.king@canonical.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Ben Gardon <bgardon@google.com>, kvm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210622150912.23429-1-colin.king@canonical.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <7a8f9ef7-03f7-08e3-61b2-548aa54328e3@redhat.com>
Date:   Tue, 22 Jun 2021 18:43:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210622150912.23429-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 22/06/21 17:09, Colin King wrote:
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
>   arch/x86/kvm/mmu/mmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index ed24e97c1549..b8d20f139729 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -5689,7 +5689,7 @@ void kvm_mmu_zap_collapsible_sptes(struct kvm *kvm,
>   {
>   	/* FIXME: const-ify all uses of struct kvm_memory_slot.  */
>   	struct kvm_memory_slot *slot = (struct kvm_memory_slot *)memslot;
> -	bool flush;
> +	bool flush = false;
>   
>   	if (kvm_memslots_have_rmaps(kvm)) {
>   		write_lock(&kvm->mmu_lock);
> 

Queued, thanks.

Paolo

