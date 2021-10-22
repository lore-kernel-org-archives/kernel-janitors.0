Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1E2C433F5
	for <kernel-janitors@archiver.kernel.org>; Fri, 22 Oct 2021 09:53:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53D3F610A4
	for <kernel-janitors@archiver.kernel.org>; Fri, 22 Oct 2021 09:53:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232560AbhJVJ4P (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 22 Oct 2021 05:56:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37067 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231992AbhJVJ4O (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Oct 2021 05:56:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634896437;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Svcww2HXJ5Z90IHHct3Hd2SAA6KMakvPsfgwCnVHrjU=;
        b=Oi13YJL0HIwPyilDLVzD63GXmdW6dljhHUlP11GALVtIASUGZfTI3LhvDq9dbpJFVWqp5e
        IqHYezBHESMhPs3lpeeTPg07BaEkNVOhKVctWuf4rEIceS7iB2Xyas2yOEYBJpjiPp1Mmz
        a3ckYyWOa74UufFXXcqSOp8BTwHjtLA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-wtHsRjwdPliogzCoXIDSCA-1; Fri, 22 Oct 2021 05:53:56 -0400
X-MC-Unique: wtHsRjwdPliogzCoXIDSCA-1
Received: by mail-ed1-f72.google.com with SMTP id u23-20020a50a417000000b003db23c7e5e2so3179141edb.8
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Oct 2021 02:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Svcww2HXJ5Z90IHHct3Hd2SAA6KMakvPsfgwCnVHrjU=;
        b=E9ouLYuTE81f+XCigwCIdetdmCNpPwuzOYoDJw7TZkSrVPaOhB92GijQLb88Dews9A
         bq8z9sAgkBBX9FRX100vxJ6rEyugHsoRTj3gbDA8yau8VkVBFOGZ4nEoPKDBMoD4HtV7
         gq9LPYVh6R42FNxEgDG2Z/4CsQXWicUIKLgSDkTjGNMN3wsWQrO/BZHdVthhWJyFU1iJ
         XFbPkH8EDSzI7pQzmgiUiv+fd6gN8yCc436kMzVFXqVAyhtY5tzewVKJd84S2jxIdLnG
         mnO+mPbdvD1NUglP5Yb2dQLr9k9yjJ53loVr79ep6LePOv5unIiAIVSQGeMlODt0wHxA
         MoWA==
X-Gm-Message-State: AOAM531FkwmD1PuHI1RnH4zkiAQfpN/CUz7kqE04uwxAwNJsnZvSj1Yv
        cf5xPPs7mqCLlP3qgP4VjXrdZq9DnX1j1F94k2MAQ8yNfNAr9Tflee8bLVpLEP1LOdBr0PSYJMe
        SR1Pxk48uDVfU+dho8zbpbUr2EVgc
X-Received: by 2002:a17:906:a986:: with SMTP id jr6mr13981274ejb.520.1634896434928;
        Fri, 22 Oct 2021 02:53:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWgET1HDP+lFcbcexfVgy0T8C2XgMQaHEGdNmRe5CZHTYPQrrA5lyEdy0UpR2CcqHWmfbDAg==
X-Received: by 2002:a17:906:a986:: with SMTP id jr6mr13981259ejb.520.1634896434764;
        Fri, 22 Oct 2021 02:53:54 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id x3sm2155892edd.67.2021.10.22.02.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 02:53:54 -0700 (PDT)
Message-ID: <5c27a2ff-b7a2-99d8-bdc4-7f2b20092500@redhat.com>
Date:   Fri, 22 Oct 2021 11:53:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] riscv: do not select non-existing config ANON_INODES
Content-Language: en-US
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211022061514.25946-1-lukas.bulwahn@gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211022061514.25946-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 22/10/21 08:15, Lukas Bulwahn wrote:
> Commit 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support") selects
> the config ANON_INODES in config KVM, but the config ANON_INODES is removed
> since commit 5dd50aaeb185 ("Make anon_inodes unconditional") in 2018.
> 
> Hence, ./scripts/checkkconfigsymbols.py warns on non-existing symbols:
> 
>    ANON_INODES
>    Referencing files: arch/riscv/kvm/Kconfig
> 
> Remove selecting the non-existing config ANON_INODES.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>   arch/riscv/kvm/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index a712bb910cda..f5a342fa1b1d 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -22,7 +22,6 @@ config KVM
>   	depends on RISCV_SBI && MMU
>   	select MMU_NOTIFIER
>   	select PREEMPT_NOTIFIERS
> -	select ANON_INODES
>   	select KVM_MMIO
>   	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
>   	select HAVE_KVM_VCPU_ASYNC_IOCTL
> 

Queued, thanks.

Paolo

