Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5E9C433DB
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 08:01:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAEAE619FF
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 08:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbhC0IAx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 27 Mar 2021 04:00:53 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14163 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbhC0IAM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 27 Mar 2021 04:00:12 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F6rmH3QpqznWQv;
        Sat, 27 Mar 2021 15:57:35 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Sat, 27 Mar 2021
 15:59:59 +0800
From:   Shixin Liu <liushixin2@huawei.com>
To:     Russell King <linux@armlinux.org.uk>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Shixin Liu <liushixin2@huawei.com>
Subject: [PATCH] arm: kprobes: fix an old-style function definition
Date:   Sat, 27 Mar 2021 16:30:20 +0800
Message-ID: <20210327083020.1922590-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

I got a warning when compile kernel:

arch/arm/probes/kprobes/core.c:465:12: warning: old-style function definition [-Wold-style-definition]
  465 | int __init arch_init_kprobes()
      |            ^~~~~~~~~~~~~~~~~

Fix it by add parameter 'void'.

Signed-off-by: Shixin Liu <liushixin2@huawei.com>
---
 arch/arm/probes/kprobes/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/probes/kprobes/core.c b/arch/arm/probes/kprobes/core.c
index a9653117ca0d..e513d8a46776 100644
--- a/arch/arm/probes/kprobes/core.c
+++ b/arch/arm/probes/kprobes/core.c
@@ -462,7 +462,7 @@ static struct undef_hook kprobes_arm_break_hook = {
 
 #endif /* !CONFIG_THUMB2_KERNEL */
 
-int __init arch_init_kprobes()
+int __init arch_init_kprobes(void)
 {
 	arm_probes_decode_init();
 #ifdef CONFIG_THUMB2_KERNEL
-- 
2.25.1

