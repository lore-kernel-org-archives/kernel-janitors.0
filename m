Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFCBC4332F
	for <kernel-janitors@archiver.kernel.org>; Mon,  5 Dec 2022 08:53:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbiLEIxC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 5 Dec 2022 03:53:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232297AbiLEIsh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 5 Dec 2022 03:48:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592886394
        for <kernel-janitors@vger.kernel.org>; Mon,  5 Dec 2022 00:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670230048;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rfvEnKIf4mHuvu3yIVqxv1Te1T4eVbeJMHjj7Ep8ikc=;
        b=GlGOVnuhDe1FXGBrQdHHHUJMafMneVn02+QyMP/2k3SkQmoTiuGkG6OtJXK3neRgHepJUe
        h1YJW3usYZUId9uzrM4kjXHMAi5A2At1CfATTe123kkDRvhxVADTvE+NLwnkfa3urLJYJl
        n59Pb7nUh/UhKlrPKKNRbVHepBU+WcU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-cQQzNqe9M32Lctdjj044Rg-1; Mon, 05 Dec 2022 03:47:26 -0500
X-MC-Unique: cQQzNqe9M32Lctdjj044Rg-1
Received: by mail-ed1-f72.google.com with SMTP id q13-20020a056402518d00b00462b0599644so5502674edd.20
        for <kernel-janitors@vger.kernel.org>; Mon, 05 Dec 2022 00:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rfvEnKIf4mHuvu3yIVqxv1Te1T4eVbeJMHjj7Ep8ikc=;
        b=pGwbhbmK2Zp3aL8Ehr2fQfJC28rI5s7JBsbNPTjFHz4qN5P4BNYzj8OyK3oam6tPCv
         0APFw+5Tt5AZWE8h5aXvACjXjmWau09seoBbhdwQigEZnw1YztzH8w5thcMa7lhEMQxe
         C78g2EJt79e2EkNKYvjrT+rJ0knFGWVW/6LFFOolIR6fsJ2ZI4l7R4rpEtS2Qlu5nvEz
         FW+W2JsS2OGY+9kBc4WyOPkQJ0DzI+xePBsRtIYPNhdnY6Go9AUhpp0sl8ngLcnDofYh
         rWHWtPyIiLOWEo8QqDcaVy5nMlrXIIaVk5I1min0eUrhqQrFH+XgJreYhmerJ3kZy0fg
         hwFw==
X-Gm-Message-State: ANoB5pnkIj0L6C3yXYrjky+0mcqZgaipG8Eu6lw/k0b17QyUicSj0apd
        giQa7n/KQCG+5+WvTSDEvId6RBicJ/3NIj2wKH/tHZF1ztsiQcnR/4M5xOOlFW2Wp59QQaYVqEo
        OtkmuIlW8DxoAH4f6rIkMQt8qbfKr
X-Received: by 2002:a17:907:986c:b0:7a0:b505:e8f9 with SMTP id ko12-20020a170907986c00b007a0b505e8f9mr57399300ejc.216.1670230045719;
        Mon, 05 Dec 2022 00:47:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4akIQi8ZxTBNZtjIUUOko4vMClvta2bAqlLxc8Vd0sNOyBb3DMgM9yf+Lei9GFyOV6jqe66g==
X-Received: by 2002:a17:907:986c:b0:7a0:b505:e8f9 with SMTP id ko12-20020a170907986c00b007a0b505e8f9mr57399290ejc.216.1670230045506;
        Mon, 05 Dec 2022 00:47:25 -0800 (PST)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
        by smtp.gmail.com with ESMTPSA id r9-20020a1709061ba900b007aec1b39478sm5997193ejg.188.2022.12.05.00.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 00:47:24 -0800 (PST)
From:   Vitaly Kuznetsov <vkuznets@redhat.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: adjust entry after renaming the vmx hyperv
 files
In-Reply-To: <20221205082044.10141-1-lukas.bulwahn@gmail.com>
References: <20221205082044.10141-1-lukas.bulwahn@gmail.com>
Date:   Mon, 05 Dec 2022 09:47:23 +0100
Message-ID: <87pmcydyp0.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

> Commit a789aeba4196 ("KVM: VMX: Rename "vmx/evmcs.{ch}" to
> "vmx/hyperv.{ch}"") renames the VMX specific Hyper-V files, but does not
> adjust the entry in MAINTAINERS.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
>
> Repair this file reference in KVM X86 HYPER-V (KVM/hyper-v).
>

Fixes: a789aeba4196 ("KVM: VMX: Rename "vmx/evmcs.{ch}" to "vmx/hyperv.{ch}"")

maybe?

> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ceda8a0abffa..8fda3844b55b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11457,7 +11457,7 @@ F:	arch/x86/kvm/hyperv.*
>  F:	arch/x86/kvm/kvm_onhyperv.*
>  F:	arch/x86/kvm/svm/hyperv.*
>  F:	arch/x86/kvm/svm/svm_onhyperv.*
> -F:	arch/x86/kvm/vmx/evmcs.*
> +F:	arch/x86/kvm/vmx/hyperv.*
>  
>  KVM X86 Xen (KVM/Xen)
>  M:	David Woodhouse <dwmw2@infradead.org>

Reviewed-by: 

-- 
Vitaly

