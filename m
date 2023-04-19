Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580EFC6FD18
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Apr 2023 08:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbjDSIHC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Apr 2023 04:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbjDSIHB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 04:07:01 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86071AD02
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 01:06:49 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id o9-20020a05600c510900b003f17012276fso978695wms.4
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 01:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681891608; x=1684483608;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OSy/8KzIeE0uT9f/JXeORSJpU/CYejtTTaWQ7l0cpk=;
        b=I8aI/cLLjYoF3kyrKmp9YJiuCEi4+DaA0/Tf1Wlln3rCKFpfdw2256mLJX0HaWUoNK
         xW4PWvfMz83BrqmG3fo+l9pem/lnSXQ+cD99N/RIzI7LH+1jumcHIKAxgUx6t6gsKcu2
         eOGQO7G1/crQL3gXYxjOAuGMtnLaD3Gj/GFKOgfF+KY2l9rF38QZnfx3p6U/yHiZOlku
         B2/Dbw+4Z4ajzhpGGRJQQth5rzjUJHOldvXVSBAO3N6/44yd830J6oSARQlZwJonMg1j
         G/PrUVBpAUBdcxU07zzD/uu/yNhwmRxzRy6mtZKGZNpONul/NLciyp8+mNV5BD2v/Wio
         H4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681891608; x=1684483608;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5OSy/8KzIeE0uT9f/JXeORSJpU/CYejtTTaWQ7l0cpk=;
        b=TOu8zSpu5AU7K12H8G/Zm1OEZwQDkatkrs0jDkdyt3y8H1342Z5wOerWB9qKOylUmr
         KwMj77KLmXnGfHbzATY45VrhTst1aQtGEtxXDDjtPx4/+H2dkTO5QgzvwiJEWPmI0+ov
         +ippy6ZtsPn4eXkevh/sxgLSotS9VxAqeKLLVXe+OSNCV5gqsSCNsyIEZQW8HR4CUyrr
         0Bucoits8KB7dnzcBLB0hmJyy+tJ2SEZRb54XNhJ/AhezmCA9r9N6wp8yJhr9x/AhfYs
         nrSM9R6BhXADhxOnWuZ3lq8/ue1Ke8F1sv2JQmnIQ1zv3wlhIMa0TukIviN+D+qOytCr
         lv2w==
X-Gm-Message-State: AAQBX9cqsed/CSezvbIaXYo8H1D+lrID0EsZy016qHhb/2S+Fg3aK0d9
        oykPOSaMgZ+kC2H+4bAJUxm0pdGkg/hHYAsSw0cvzd1O
X-Google-Smtp-Source: AKy350bsXyYLNtU1VpGGhfXi3kZDPExX20afgftMWFgCyE1KG7y4AfQzl/Q5ztY1W9WRfVoR4ylEnw==
X-Received: by 2002:a7b:c404:0:b0:3f0:a785:f0e0 with SMTP id k4-20020a7bc404000000b003f0a785f0e0mr14741958wmi.40.1681891608041;
        Wed, 19 Apr 2023 01:06:48 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q18-20020a7bce92000000b003f09d7b6e20sm1386729wmj.2.2023.04.19.01.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 01:06:47 -0700 (PDT)
Date:   Wed, 19 Apr 2023 11:06:44 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Eric Auger <eric.auger@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] KVM: arm64: Fix buffer overflow in kvm_arm_set_fw_reg()
Message-ID: <ab7b9caf-5c90-4616-8517-b38637293639@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The KVM_REG_SIZE() comes from the ioctl and it can be a power of two
between 0-32768 but if it is more than sizeof(long) this will corrupt
memory.

Fixes: 99adb567632b ("KVM: arm/arm64: Add save/restore support for firmware workaround state")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/arm64/kvm/hypercalls.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index 2e16fc7b31bf..4f5767fcaca5 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -544,6 +544,8 @@ int kvm_arm_set_fw_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	u64 val;
 	int wa_level;
 
+	if (KVM_REG_SIZE(reg->id) > sizeof(val))
+		return -EINVAL;
 	if (copy_from_user(&val, uaddr, KVM_REG_SIZE(reg->id)))
 		return -EFAULT;
 
-- 
2.39.2

