Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD462C7EE29
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Jun 2023 06:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235185AbjFMGoN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 13 Jun 2023 02:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237893AbjFMGnt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Jun 2023 02:43:49 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5423FE6B
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 23:43:48 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f60a27c4a2so5878988e87.2
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 23:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686638626; x=1689230626;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WwJ84lVw08wCsE95kQ0UTXAZqJk3Huei6Deabf+TMMI=;
        b=a8WCsz0oVX69Jbpov+VLq0SWUe+h1mt1pwDO9ey85cvKAGtRk/EdWbadNdyUHMjP37
         8roQjrqIOm6+VaSM0cJLF8rgdUFH/Kuk2xKq9noEXAZzETpj1mdARqp/n2JhCrtz6cPg
         ZI9RwF9Fzk/XZ0shuaPvLK7DlCtU/21OQvGG0+iOKAvEx13PmpSV2T5LRrDohBWLtH+w
         u4PkaBL75sDY/AEZnRk2F5P2EYdNCu5Fyb2IJ8CNCGb6kv7taTieMNIllOAtqqAa4AUm
         ZihiA3ojcHPC0oz5zCKqdi2dK8vhA1+O7rjUVUUiMOETGXniNA4f1xiAf8VZsAQL/6qD
         gt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686638626; x=1689230626;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WwJ84lVw08wCsE95kQ0UTXAZqJk3Huei6Deabf+TMMI=;
        b=MzwAf4GTLmgaTdpMqWrgYbUPXmcyBEFNfwg/p1p+VU0wX2OgHEJ562pYVvw05PsD5l
         ef807JyH/McQsfCuuKfGv5Ay8u/2LhB0j51P4UbEdYb1HKUGWMftN7nnwFuJzuAIV3TT
         YpOi3uHa/Dj3DulmjEFk8Sy5oJjFbnUqLzHAkoMoyYc6cemJwKdZBdXHR/++ck4ZDJ/N
         0AsKl5IJI19Zr8zRB7/mOb1uy0rqXFz2nyU9xwFHCYTVYF3B17V7SMCYe5aT+FjkYl2B
         4Wl+SFXJAs8Gm/t8f4yJ6qaH2W9SJkXs4+LiKYkB6U9/vZhoVoGHvrk2vJVm3yLQw/MC
         fQWw==
X-Gm-Message-State: AC+VfDwEEgoxkTpSDm9UF9v9rvW2bOFFTAdrKtafocKiN1MSNz2UbW3M
        f2Q1JqVOzJLkYAEWzYatb4IJlA==
X-Google-Smtp-Source: ACHHUZ49Lblei1XzaLcZJ1ENLHSgfvYbxjwZINob+g4GPuDl/9J8CpY7n6u+x2U4zthUt/Nb0q5T6g==
X-Received: by 2002:ac2:465b:0:b0:4f6:4f9a:706e with SMTP id s27-20020ac2465b000000b004f64f9a706emr5685303lfo.15.1686638626525;
        Mon, 12 Jun 2023 23:43:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t25-20020a1c7719000000b003f7eeec829asm13365954wmi.10.2023.06.12.23.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 23:43:44 -0700 (PDT)
Date:   Tue, 13 Jun 2023 09:43:39 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christoffer Dall <christoffer.dall@arm.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: timers: Fix resource leaks in
 kvm_timer_hyp_init()
Message-ID: <72fffc35-7669-40b1-9d14-113c43269cf3@kili.mountain>
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

There are two resources to be freed the vtimer and ptimer.  The
line that Smatch complains about should free the vtimer first
before returning and then after that cleanup code should free
the ptimer.

I've added a out_free_ptimer_irq to free the ptimer and renamed
the existing label to out_free_vtimer_irq.

Fixes: 9e01dc76be6a ("KVM: arm/arm64: arch_timer: Assign the phys timer on VHE systems")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: renamed the label as Oliver Upton requested.

 arch/arm64/kvm/arch_timer.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 05b022be885b..0696732fa38c 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1406,7 +1406,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
 					    kvm_get_running_vcpus());
 		if (err) {
 			kvm_err("kvm_arch_timer: error setting vcpu affinity\n");
-			goto out_free_irq;
+			goto out_free_vtimer_irq;
 		}
 
 		static_branch_enable(&has_gic_active_state);
@@ -1422,7 +1422,7 @@ int __init kvm_timer_hyp_init(bool has_gic)
 		if (err) {
 			kvm_err("kvm_arch_timer: can't request ptimer interrupt %d (%d)\n",
 				host_ptimer_irq, err);
-			return err;
+			goto out_free_vtimer_irq;
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
 
@@ -1439,11 +1439,15 @@ int __init kvm_timer_hyp_init(bool has_gic)
 		kvm_err("kvm_arch_timer: invalid physical timer IRQ: %d\n",
 			info->physical_irq);
 		err = -ENODEV;
-		goto out_free_irq;
+		goto out_free_vtimer_irq;
 	}
 
 	return 0;
-out_free_irq:
+
+out_free_ptimer_irq:
+	if (info->physical_irq > 0)
+		free_percpu_irq(host_ptimer_irq, kvm_get_running_vcpus());
+out_free_vtimer_irq:
 	free_percpu_irq(host_vtimer_irq, kvm_get_running_vcpus());
 	return err;
 }
-- 
2.39.2

