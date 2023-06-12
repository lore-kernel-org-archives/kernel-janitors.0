Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FC4C7EE23
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jun 2023 07:15:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232490AbjFLHPK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Jun 2023 03:15:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231462AbjFLHPH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jun 2023 03:15:07 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F9A1700
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 00:10:06 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f6e1393f13so28669125e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 00:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686553672; x=1689145672;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tnCxW0itTMo6yA3XNQbbmF8xoq0kbOuc9xf7ZwUXCgc=;
        b=AjUEzLuwBYYyf1jbHOpvc6+JllXdUSMtkFr7TKGPKZqLBlwOnHdzRr9qoaUibyzByR
         a991lbdsojsORGHg6in+lAYfB9j+dMIoJtcLQ9eJGWGuLXQLvXtkrWseNO/H6dQ4KDeE
         A2pqJXmxFq6OE9g9/+3ni3XOKzCPNffoizAvUD77PzhVLQ3jimoQ3GNHe7uWHDXrSLQI
         ReMP8kHpIBPYOJNCgdjgMzQrF2ZRXkzTkic7vvCw5qqOyE4nNRTHQBX3jO2z4Dq89mR1
         I76wcyDZnfDpKiBnuwHfsClrmYl+MxdYAktvhxyErCq6i5orQU4fD/9PNuehG7Jpcf7S
         cWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686553672; x=1689145672;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tnCxW0itTMo6yA3XNQbbmF8xoq0kbOuc9xf7ZwUXCgc=;
        b=hVLXYlT4YkgxhuRTRHRWpH/8IhjTuqXw5xldR0lATtLMdw4yVv8uZGxfOQEa30tNam
         dwEm8wszwwOH2utw4DLhlDSsBGoLSVPm1FLMqwrjKiUH0jSeIz5jWSfUiGAoDnXl5EoV
         CgQj784hnlsnj4gAZWqPfT/fj8iokNvKgpY5Iu3i3qq3mt3/foNqlDT3/S0mavTltHQq
         oICXWYGOkRB4ASj9BTB6u1Vd5Ce2yFim9ATaor4e7QWt7Z+GTPM2rK1StER3EtSy/1Rs
         ZGlz/KFjHE4zS7XeZKd3uyRTtjiivcIfT65DAdCL5Q2ZUEkj0+MWckLdD6ECIbxAILqb
         3F+A==
X-Gm-Message-State: AC+VfDzFsszoRfltuSN1HEkooZwF3clBQiuPlKHp3+r9Nc+SeAzU9iPk
        8yOMo7JVf5nevO3NkHlJZJ4TWT0BBUfXou0+Zs8=
X-Google-Smtp-Source: ACHHUZ4pmw8BWg0wWjjye8G9cWexophtsTqyab55gNCps5/WPk8Yrdx2UsNUrSaI5OFSkNxilzQIDQ==
X-Received: by 2002:a7b:c8da:0:b0:3f7:e8fc:678d with SMTP id f26-20020a7bc8da000000b003f7e8fc678dmr5977585wml.13.1686553672137;
        Mon, 12 Jun 2023 00:07:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e13-20020a05600c218d00b003f709a7e46bsm10317708wme.46.2023.06.12.00.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 00:07:50 -0700 (PDT)
Date:   Mon, 12 Jun 2023 10:07:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Marc Zyngier <maz@kernel.org>,
        Christoffer Dall <christoffer.dall@arm.com>
Cc:     Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] KVM: arm64: timers: Fix resource leaks in
 kvm_timer_hyp_init()
Message-ID: <e0dd820f-52d2-4c54-97f3-5aa02e0bd6e0@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch detected this bug:
    arch/arm64/kvm/arch_timer.c:1425 kvm_timer_hyp_init()
    warn: missing unwind goto?

There are a couple error paths which do not release their resources
correctly.  Fix them.

Fixes: 9e01dc76be6a ("KVM: arm/arm64: arch_timer: Assign the phys timer on VHE systems")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/arm64/kvm/arch_timer.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 05b022be885b..c2df8332d2bd 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1422,7 +1422,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
 		if (err) {
 			kvm_err("kvm_arch_timer: can't request ptimer interrupt %d (%d)\n",
 				host_ptimer_irq, err);
-			return err;
+			goto out_free_irq;
 		}
 
 		if (has_gic) {
@@ -1430,7 +1430,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
 						    kvm_get_running_vcpus());
 			if (err) {
 				kvm_err("kvm_arch_timer: error setting vcpu affinity\n");
-				goto out_free_irq;
+				goto out_free_ptimer_irq;
 			}
 		}
 
@@ -1443,6 +1443,10 @@ int __init kvm_timer_hyp_init(bool has_gic)
 	}
 
 	return 0;
+
+out_free_ptimer_irq:
+	if (info->physical_irq > 0)
+		free_percpu_irq(host_ptimer_irq, kvm_get_running_vcpus());
 out_free_irq:
 	free_percpu_irq(host_vtimer_irq, kvm_get_running_vcpus());
 	return err;
-- 
2.39.2

