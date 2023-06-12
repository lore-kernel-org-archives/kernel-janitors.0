Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634EEC7EE2E
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jun 2023 19:23:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235664AbjFLTX1 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Jun 2023 15:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233283AbjFLTX0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jun 2023 15:23:26 -0400
X-Greylist: delayed 41461 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 12 Jun 2023 12:23:25 PDT
Received: from out-49.mta1.migadu.com (out-49.mta1.migadu.com [IPv6:2001:41d0:203:375::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FC8E67
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 12:23:24 -0700 (PDT)
Date:   Mon, 12 Jun 2023 21:23:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1686597803;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4VoFEAuVwOY3XqcTpIIfzF8I2Id06bx2MaKaLwxXY24=;
        b=s7hNrebUk4IUMZ42L93mLuIvclILWgQUOmZt9Um7p44y3XOk+GR0wewDdrEotdQXB+Qmn5
        Izt1tMfGFrsV0rJNPPN4WLGTv2IJQEqFRSz9v6QVCHbrYcostEQaog8Jm091h9K9AnIpaM
        VOHDNEk+Brt/3aHqa7P5j2WgQTXR5D8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Oliver Upton <oliver.upton@linux.dev>
To:     Dan Carpenter <dan.carpenter@linaro.org>
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
Message-ID: <ZIdwqWKxgntYthoB@linux.dev>
References: <e0dd820f-52d2-4c54-97f3-5aa02e0bd6e0@kili.mountain>
 <ZIbKJPx2RR0Le7Zl@linux.dev>
 <0fc3126f-efb2-4d8c-9896-2c1b281919df@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fc3126f-efb2-4d8c-9896-2c1b281919df@kadam.mountain>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jun 12, 2023 at 11:00:20AM +0300, Dan Carpenter wrote:
> On Mon, Jun 12, 2023 at 07:32:52AM +0000, Oliver Upton wrote:
> > > +
> > > +out_free_ptimer_irq:
> > > +	if (info->physical_irq > 0)
> > > +		free_percpu_irq(host_ptimer_irq, kvm_get_running_vcpus());
> > 
> > nit: we shouldn't even jump to this label in the first place if
> > there was no ptimer irq to set up... Maybe just drop the condition?
> > 
> 
> The condition is not necessary but I added it deliberately for
> readability and in case we ever add more allocations to this function.
> I want to keep it.

Fair enough. And if your fix is any indicator, we're liable to screw up
error handling again in the future :)

> > >  out_free_irq:
> > 
> > I'd prefer this label be renamed 'out_free_vtimer_irq' to make it
> > unambiguous.
> 
> I would prefer this too, but I left it out because I don't like to
> rename things unnecessarily.  However, since we both prefer this, then
> I will rename it.

Thanks! Please do send out a v2 when you have a moment, as I'd like to
pick this up for 6.5.

--
Thanks,
Oliver
