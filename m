Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8653CC4332F
	for <kernel-janitors@archiver.kernel.org>; Thu, 14 Apr 2022 15:09:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241516AbiDNPMG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 14 Apr 2022 11:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354781AbiDNOmh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 14 Apr 2022 10:42:37 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080DDDE94
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Apr 2022 07:39:36 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id z6-20020a17090a398600b001cb9fca3210so5872925pjb.1
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Apr 2022 07:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gJ8pcz3Yaw1gKMnr6f7nkiOA+qMs14RS4sjJplU0gjM=;
        b=R4JJPAxBiFl6PYRwZGRkCFzqF4VwdjE3sCH/tcEdYlbUlKE40ftv4JdLWisRcFdYD+
         ZLPXO8yK68lWcdip9fPvd539XPVr0LDMwcHJYld7xq+NTMqK4zO/fBnRDPY4ReezcpiT
         JdwrQMgNMvGbpSuS30JR74qg3aQuKtF2S2RQYN1PhbM0k3BNLsaBiv45OV5UWZagEa4u
         Jr/VESJVUOAcZAQr/ZCswkJRgxe1UdqlQiNNfmilwIZIwDOp5tfmoIHRHxAvjoNxXnN+
         EQ1InC2XexhkzFjVnN9GiHdeciEeyR+KRFdB1lWMlL1esYJgtlNQfvZN9wS2wH7Tk5On
         Io6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gJ8pcz3Yaw1gKMnr6f7nkiOA+qMs14RS4sjJplU0gjM=;
        b=tASigfRS3Za8KsHPqqrkr0qLiazm4G6/buLVIhuhFjAiPv+nxJVMazeQ0E312oJFZZ
         7lDLayqC51duqACreGHJbsqv5iyEzKHdzYl+HctJSLBoWDOr8br24dbXIAMN83eAPQF4
         TT0eaQWsFwiuhE6HatguBxHIcg1qnkmTyVGFf1XJKBbvUP0F6CBiNmwiRD4lIg1auXnq
         WqOD9fH2gGvhFTqXJhj7sHky3okevGE7WlrlIm5f9ZMhFjI6vZHevpKAZN9SJHbROhdy
         PdzY3w178LDHZAFgAq6mQMMnwi+FblxXEFl/riab9bEVoe4BQ8b6ciuV6Sa7p0I1UfrE
         wyMQ==
X-Gm-Message-State: AOAM5306uAgvUNFTDuOiRcJ4ii11z0L04oXEfZ0KQhMc5JUpyr997fDM
        mxTmAYajk8mZX51PJ3qZ0qhEyA==
X-Google-Smtp-Source: ABdhPJyQhgIYo4iouGyYUQ+Q7Nt/zlHN4/wmdz2jjSvmkYXLB9lHmvXGarXlMm7Az348QWDplNeaIw==
X-Received: by 2002:a17:903:110c:b0:14d:8859:5c8 with SMTP id n12-20020a170903110c00b0014d885905c8mr47115691plh.156.1649947176324;
        Thu, 14 Apr 2022 07:39:36 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id p10-20020a056a0026ca00b004fb44e0cb17sm178299pfw.116.2022.04.14.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 07:39:35 -0700 (PDT)
Date:   Thu, 14 Apr 2022 14:39:32 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: VMX: make read-only const array vmx_uret_msrs_list
 static
Message-ID: <YlgyJPRVNCe4w8q3@google.com>
References: <20220414100720.295502-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414100720.295502-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Apr 14, 2022, Colin Ian King wrote:
> Don't populate the read-only array vmx_uret_msrs_list on the stack
> but instead make it static. Also makes the object code a little smaller.

Why not put it on the stack?  It's an __init function, i.e. called once in the
lifetime of kvm-intel.ko, isn't all that big, and is certainly not performance
critical.  And making it static begs the question of whether or not the data gets
thrown away after init, i.e. this might consume _more_ memory once KVM has reached
steady state.

> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index c654c9d76e09..36429e2bb918 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -7871,7 +7871,7 @@ static __init void vmx_setup_user_return_msrs(void)
>  	 * but is never loaded into hardware.  MSR_CSTAR is also never loaded
>  	 * into hardware and is here purely for emulation purposes.
>  	 */
> -	const u32 vmx_uret_msrs_list[] = {
> +	static const u32 vmx_uret_msrs_list[] = {
>  	#ifdef CONFIG_X86_64
>  		MSR_SYSCALL_MASK, MSR_LSTAR, MSR_CSTAR,
>  	#endif
> -- 
> 2.35.1
> 
