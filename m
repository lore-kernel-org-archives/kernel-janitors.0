Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77ED8C433ED
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 May 2021 14:05:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30EF8610E9
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 May 2021 14:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233884AbhECOGZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 May 2021 10:06:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36834 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233400AbhECOGT (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 May 2021 10:06:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620050725;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GNPR9aetB5O6vbBVkjBt4WTSfiMRhHXQRTN0FbjXPg4=;
        b=ct8CTkXH5sOc+v4F6HRc/aCHILwepnt63b1TxarNB2e6CPifd82Zlpuhj+CQRlD0IXMBFp
        XZVhC7wdPOthFJnySnb9Mn95eUU5FH/NbXLvhCA/I6jATUhp2wvNlBsSEh/3hS6a3+uH7p
        yIoO5bQ9xtC73/8VSI9+QcehOk1wVas=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-JAOO8d9hNaSCMPaZTUGbRQ-1; Mon, 03 May 2021 10:05:24 -0400
X-MC-Unique: JAOO8d9hNaSCMPaZTUGbRQ-1
Received: by mail-ej1-f70.google.com with SMTP id k9-20020a17090646c9b029039d323bd239so2062520ejs.16
        for <kernel-janitors@vger.kernel.org>; Mon, 03 May 2021 07:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GNPR9aetB5O6vbBVkjBt4WTSfiMRhHXQRTN0FbjXPg4=;
        b=KwlPnzVUVfWA8VdExLnl8WgaeEFzZxJSuyqv0yRbwk7Y6ubN/0Ex5bZyGwVb98/3hS
         4ln+I0tTFxmhK2U+8eFyXRcJW9Rq23Wshq4VfjXKC8cxuDrhEU0h6updI+s6LJ6x6UaD
         WpmZd2VyqdCVYzQsdI4GEowS7z6FwaTlBGNzS86C7OnXDSRJVKNfl8WxLJqKbihDb17K
         gmTxW/fQ7QxAqZRd57KnK1f0IA23bFPFKSS1gNGyzqORowO+bDDkvB1o8eGswoP9rA4T
         EYYxzkz6DLgc4i1prfetCeDu6T1/dyq0VPMik/a1lBmGRx+CfNcptcha3n/zTtbs4aDa
         dyDQ==
X-Gm-Message-State: AOAM53214E1oOTVHWglhec+0k5Wmjyw1xRf5I0x7roHgYD0ihgNL4ZTt
        r8YUGEOZ1EaIRO0EArpBjCmpWkA1KDrNY7EaucAEtMVyt35AuDqgEmKrcI99t8pxqEP+9l/pQUW
        VvPQpprySyABHUI3Nx9niNlPMC+R5
X-Received: by 2002:a17:906:4d8d:: with SMTP id s13mr16729100eju.37.1620050722848;
        Mon, 03 May 2021 07:05:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4au918keNwU9ajYzFOowIyCo1Jppz2HVvxcn98scQ414jHG95DpQAGuWs5CJ8pUcPcdDWZw==
X-Received: by 2002:a17:906:4d8d:: with SMTP id s13mr16729075eju.37.1620050722699;
        Mon, 03 May 2021 07:05:22 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id t14sm10993993ejc.121.2021.05.03.07.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 May 2021 07:05:22 -0700 (PDT)
Subject: Re: [PATCH][next] KVM: x86: Fix potential fput on a null
 source_kvm_file
To:     Colin King <colin.king@canonical.com>,
        Sean Christopherson <seanjc@google.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Nathan Tempelman <natet@google.com>, kvm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210430170303.131924-1-colin.king@canonical.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9d28cde2-7aff-64bb-26f4-9909344676e5@redhat.com>
Date:   Mon, 3 May 2021 16:05:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210430170303.131924-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 30/04/21 19:03, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The fget can potentially return null, so the fput on the error return
> path can cause a null pointer dereference. Fix this by checking for
> a null source_kvm_file before doing a fput.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: 54526d1fd593 ("KVM: x86: Support KVM VMs sharing SEV context")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   arch/x86/kvm/svm/sev.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> index 1356ee095cd5..8b11c711a0e4 100644
> --- a/arch/x86/kvm/svm/sev.c
> +++ b/arch/x86/kvm/svm/sev.c
> @@ -1764,7 +1764,8 @@ int svm_vm_copy_asid_from(struct kvm *kvm, unsigned int source_fd)
>   e_source_unlock:
>   	mutex_unlock(&source_kvm->lock);
>   e_source_put:
> -	fput(source_kvm_file);
> +	if (source_kvm_file)
> +		fput(source_kvm_file);
>   	return ret;
>   }
>   
> 

Queued, thanks.

Paolo

