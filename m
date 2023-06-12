Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D97C7EE23
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jun 2023 08:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbjFLICI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Jun 2023 04:02:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbjFLIBH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jun 2023 04:01:07 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A15DBB
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 01:00:28 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f654d713c0so4171984e87.3
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 01:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686556826; x=1689148826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGUo8CidzKShEwwLxMshJNSwmdJdN3ZKB2owylq8ZRY=;
        b=xdwSRwd3c+q7z9JkIPqsgakw1M9auxxeXdDFANYT01fpWsSdgrNatEjzXSXYE1aDdQ
         Qx4G6CqwrLKGrfS+ghCOQJG8jrhtSUO5jbMB4fbdXU2U+yGsEaG+jdEHY4IMLHMhzpjB
         U+3JZySg3/geNmN4/J5yUWk8EVegRDh9iypkDWIWkYEoTZq0W9sZQp15GOX/6Jay/kMW
         +CZXObJDPD25napl4XCoJFhu3H3CQR8FjSXQmDQp4Z3mmZ/l88bWoGSacNXHbDzYgzH3
         MekNuP6jImR4spG1eIyP6iw+3EtJ4spg8JqSUtj6hJbL+4xbQLZPdGgUGbYajsA3b+Bl
         sn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686556826; x=1689148826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGUo8CidzKShEwwLxMshJNSwmdJdN3ZKB2owylq8ZRY=;
        b=EU2Z6BuWFvpIA8tpZeU2W12X3F2pxiLVpquVZVoBS15uPh0WD5VsZ0BMSK4sHOyddq
         k9lvAOht5q/kCl+zjFBZydJtjMmzJQDuSH0/2RcaBL7ZqHB1RnyRTq3SXeHIn20uq8ph
         EQgZFLcpXwd/ryPiT1OnELjZcT0QDeu5C8zhDiHDpVBJZvgDju52Sl7G+aQK9zh4OGbf
         2voW3D8zsZFTIoXjNum2yCe1WMbz+tYwd9xu8jEUO8V6EERpdgL/OrJ3q5vfpmdjR/2N
         errxTR9DlAxmK8PiivWheRgZlEQm2zKQDX6UxO7+juvJo5kIxz+vpM7hrXyGfKoEn+Lo
         9LlQ==
X-Gm-Message-State: AC+VfDyBtpkG/wFEepp8LsizE197yVHEfBHp8Tm4nI9HJZVeaaM3ZvtH
        PGtZI5IRkASJn7lxvTO/c4nDYoE+uaSLGTjG6dA=
X-Google-Smtp-Source: ACHHUZ5U71WRUWIHRFAJPjBYI+gctx+elsQ0MmtN/Cos7GcvGSuxI/6wc06P++7laQdrTNvlWHusJg==
X-Received: by 2002:a19:ca59:0:b0:4f2:5c4b:e69b with SMTP id h25-20020a19ca59000000b004f25c4be69bmr3269070lfj.67.1686556825817;
        Mon, 12 Jun 2023 01:00:25 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z6-20020a5d4d06000000b0030fb98484f6sm4686810wrt.114.2023.06.12.01.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 01:00:24 -0700 (PDT)
Date:   Mon, 12 Jun 2023 11:00:20 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Oliver Upton <oliver.upton@linux.dev>
Cc:     Marc Zyngier <maz@kernel.org>,
        Christoffer Dall <christoffer.dall@arm.com>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: timers: Fix resource leaks in
 kvm_timer_hyp_init()
Message-ID: <0fc3126f-efb2-4d8c-9896-2c1b281919df@kadam.mountain>
References: <e0dd820f-52d2-4c54-97f3-5aa02e0bd6e0@kili.mountain>
 <ZIbKJPx2RR0Le7Zl@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIbKJPx2RR0Le7Zl@linux.dev>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 12, 2023 at 07:32:52AM +0000, Oliver Upton wrote:
> Hi Dan,
> 
> Thanks for fixing this. Couple of small comments:
> 
> On Mon, Jun 12, 2023 at 10:07:46AM +0300, Dan Carpenter wrote:
> > Smatch detected this bug:
> >     arch/arm64/kvm/arch_timer.c:1425 kvm_timer_hyp_init()
> >     warn: missing unwind goto?
> > 
> > There are a couple error paths which do not release their resources
> > correctly.  Fix them.
> > 
> > Fixes: 9e01dc76be6a ("KVM: arm/arm64: arch_timer: Assign the phys timer on VHE systems")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  arch/arm64/kvm/arch_timer.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> > index 05b022be885b..c2df8332d2bd 100644
> > --- a/arch/arm64/kvm/arch_timer.c
> > +++ b/arch/arm64/kvm/arch_timer.c
> > @@ -1422,7 +1422,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
> >  		if (err) {
> >  			kvm_err("kvm_arch_timer: can't request ptimer interrupt %d (%d)\n",
> >  				host_ptimer_irq, err);
> > -			return err;
> > +			goto out_free_irq;
> >  		}
> >  
> >  		if (has_gic) {
> > @@ -1430,7 +1430,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
> >  						    kvm_get_running_vcpus());
> >  			if (err) {
> >  				kvm_err("kvm_arch_timer: error setting vcpu affinity\n");
> > -				goto out_free_irq;
> > +				goto out_free_ptimer_irq;
> >  			}
> >  		}
> >  
> > @@ -1443,6 +1443,10 @@ int __init kvm_timer_hyp_init(bool has_gic)
> >  	}
> >  
> >  	return 0;
> > +
> > +out_free_ptimer_irq:
> > +	if (info->physical_irq > 0)
> > +		free_percpu_irq(host_ptimer_irq, kvm_get_running_vcpus());
> 
> nit: we shouldn't even jump to this label in the first place if
> there was no ptimer irq to set up... Maybe just drop the condition?
> 

The condition is not necessary but I added it deliberately for
readability and in case we ever add more allocations to this function.
I want to keep it.

> >  out_free_irq:
> 
> I'd prefer this label be renamed 'out_free_vtimer_irq' to make it
> unambiguous.

I would prefer this too, but I left it out because I don't like to
rename things unnecessarily.  However, since we both prefer this, then
I will rename it.

regards,
dan carpenter

