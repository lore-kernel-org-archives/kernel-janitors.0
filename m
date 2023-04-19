Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB6E6C77B73
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Apr 2023 10:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232440AbjDSKRB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Apr 2023 06:17:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbjDSKQ7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 06:16:59 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D37BBBC
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 03:16:57 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f16b99b936so18998075e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 03:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681899416; x=1684491416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ESHw1PflpYRSSh9NYDw/a+dwf1Q1OLvilu6w6E+y9Ic=;
        b=W3nWFgS2iSV1ktJNWMcOFH/wh0CsoUpT01pphkLSS4YCNEiRoumvRMKNU26YS4TcAo
         taOylMGUObbrrLzyJCLiXKPVBTTUYGpjoJW4BzvJwEx/FNdIS6thLjlcsL4Rd6oROY2c
         uX1dE19Z/WxnAhwMFjh4a5pN9rhyKY97ugkAlKKtYchbfu3rX8Fw1YSMM1z29GXv3en6
         yItCb/QKF5OIzfeWKatQcrqlQe2Dt7PAfcNgbvlk7IAQ5IjV5eAQ1AkoaZFvkHrdPkfX
         c0ijsBsqXm5kzN7B7Gf+Z+iVNzexBeMK3jHeliUmivBU5hb5926ptHgFuxKPRvcI9tAs
         uYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681899416; x=1684491416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESHw1PflpYRSSh9NYDw/a+dwf1Q1OLvilu6w6E+y9Ic=;
        b=QSqq8DP62NAAYxT145sFmAfsgaibdlkRNQvWQ/khFZi0BFXLL2ujc61FXMazHMC5J4
         36z6Knzpnt/4MCLJOZCTOs39i5yrewQhoh3ZX6BNDiH3pPNM/QO10ixTrzB2XOFjF6qD
         yt2FMIVFVi9sebE/IXJaDkZgwzrJ4e248gY/Kr8jc+wO08gsOLbooun7crrXQfQGZhAR
         IowNeJI0HIdOvQKSV/I2yuIYe0rk264cY/vpSqyCRgtC4i54q75TNOdCldxCyqWZHxbT
         R/d1SwqAfEqbClpuFKiAM/292FLw/cjVcI4A9INVGadDbXqqZkFXxy/+0Nt/fSvEVlCy
         0HHw==
X-Gm-Message-State: AAQBX9f0pTz/MIgkMNqEOwky2EbxT5ynVVGJ1VMeoCkyHcXdPSvF06cw
        0b6G/gFjqe5PvAshPS1IHaEK2A==
X-Google-Smtp-Source: AKy350Yc07gJgEg9A2F2KeD7euj6sg0lHi0pGxZO2jYss7/ZUqfGgaRNsQYVINzUOQ751drQ++LtVA==
X-Received: by 2002:adf:f291:0:b0:2f7:f803:ebeb with SMTP id k17-20020adff291000000b002f7f803ebebmr3806565wro.52.1681899416058;
        Wed, 19 Apr 2023 03:16:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d15-20020adfef8f000000b002fb9e73d5e5sm5386941wro.60.2023.04.19.03.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 03:16:55 -0700 (PDT)
Date:   Wed, 19 Apr 2023 13:16:42 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Steven Price <steven.price@arm.com>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Eric Auger <eric.auger@redhat.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Fix buffer overflow in kvm_arm_set_fw_reg()
Message-ID: <922461f5-65cf-4ffc-a2e6-5885c1bc8970@kili.mountain>
References: <ab7b9caf-5c90-4616-8517-b38637293639@kili.mountain>
 <d6e45332-0b91-2400-0549-068ea72a4482@arm.com>
 <46ace8c7-c3b1-4e2d-8af0-3f0ab1bd55f5@kili.mountain>
 <e85395c3-e0f8-f1a0-3115-c1f26f4aca99@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e85395c3-e0f8-f1a0-3115-c1f26f4aca99@arm.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 19, 2023 at 11:00:37AM +0100, Steven Price wrote:
> On 19/04/2023 10:48, Dan Carpenter wrote:
> > On Wed, Apr 19, 2023 at 09:48:41AM +0100, Steven Price wrote:
> >> On 19/04/2023 09:06, Dan Carpenter wrote:
> >>> The KVM_REG_SIZE() comes from the ioctl and it can be a power of two
> >>> between 0-32768 but if it is more than sizeof(long) this will corrupt
> >>> memory.
> >>>
> >>> Fixes: 99adb567632b ("KVM: arm/arm64: Add save/restore support for firmware workaround state")
> >>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> >>
> >> Reviewed-by: Steven Price <steven.price@arm.com>
> >>
> >> Although there might be something to be said for rejecting anything
> >> where KVM_REG_SIZE(reg->id) != sizeof(u64), as for smaller sizes the top
> >> bits of val would be undefined which would require the code to mask the
> >> top bits out to be safe. Given that all registers are currently u64 (and
> >> I don't expect that to change), perhaps the below would be clearer?
> >>
> >> 	if (KVM_REG_SIZE(reg->id) != sizeof(val))
> >> 		return -EINVAL;
> >> 	if (copy_from_user(&val, uaddr, sizeof(val)))
> >> 		return -EFAULT;
> > 
> > I was thinking that zero might be a valid size?
> 
> Well any value of reg->id which doesn't match in the switch statement
> will cause a -ENOENT return currently, so a zero size would fail that
> way as it stands. So I don't think any size other than u64 is valid in
> the current code.
> 
> There is obviously a question of return value - perhaps returning
> -ENOENT would be more appropriate if the size doesn't match (as a later
> kernel could decide to implement registers of different sizes)?

Okay.  I've sent a v2.  Probably either -EINVAL or -ENOENT is fine, but
-ENOENT is more helpful so let's return that.

regards,
dan carpenter

