Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F98C433DB
	for <kernel-janitors@archiver.kernel.org>; Wed, 31 Mar 2021 07:37:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91169619DE
	for <kernel-janitors@archiver.kernel.org>; Wed, 31 Mar 2021 07:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234111AbhCaHhK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 31 Mar 2021 03:37:10 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15050 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234104AbhCaHgt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 Mar 2021 03:36:49 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F9J3M0D0tzPmjQ;
        Wed, 31 Mar 2021 15:34:07 +0800 (CST)
Received: from mdc.localdomain (10.175.104.57) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 15:36:34 +0800
From:   Xu Jia <xujia39@huawei.com>
To:     <xujia39@huawei.com>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <kvmarm@lists.cs.columbia.edu>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] KVM: arm64: Make symbol '_kvm_host_prot_finalize' static
Date:   Wed, 31 Mar 2021 15:36:19 +0800
Message-ID: <1617176179-31931-1-git-send-email-xujia39@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The sparse tool complains as follows:

arch/arm64/kvm/arm.c:1900:6: warning:
 symbol '_kvm_host_prot_finalize' was not declared. Should it be static?

This symbol is not used outside of arm.c, so this
commit marks it static.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Xu Jia <xujia39@huawei.com>
---
 arch/arm64/kvm/arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 2835400fd298..76a7de16e5a6 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1897,7 +1897,7 @@ static int init_hyp_mode(void)
 	return err;
 }
 
-void _kvm_host_prot_finalize(void *discard)
+static void _kvm_host_prot_finalize(void *discard)
 {
 	WARN_ON(kvm_call_hyp_nvhe(__pkvm_prot_finalize));
 }

