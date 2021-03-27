Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6FEC433DB
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 08:00:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EBF2619F3
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 08:00:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhC0IAM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 27 Mar 2021 04:00:12 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:15349 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbhC0IAL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 27 Mar 2021 04:00:11 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F6rmt1fK3z93yw;
        Sat, 27 Mar 2021 15:58:06 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Sat, 27 Mar 2021
 16:00:01 +0800
From:   Shixin Liu <liushixin2@huawei.com>
To:     Russell King <linux@armlinux.org.uk>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Shixin Liu <liushixin2@huawei.com>
Subject: [PATCH] arm: kprobes: Make some symbols static
Date:   Sat, 27 Mar 2021 16:30:21 +0800
Message-ID: <20210327083021.1922640-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These two symbols are not used outside of test-core.c,
so we can marks them static.

Signed-off-by: Shixin Liu <liushixin2@huawei.com>
---
 arch/arm/probes/kprobes/test-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/probes/kprobes/test-core.c b/arch/arm/probes/kprobes/test-core.c
index c562832b8627..171c7076b89f 100644
--- a/arch/arm/probes/kprobes/test-core.c
+++ b/arch/arm/probes/kprobes/test-core.c
@@ -720,7 +720,7 @@ static const char coverage_register_lookup[16] = {
 	[REG_TYPE_NOSPPCX]	= COVERAGE_ANY_REG | COVERAGE_SP,
 };
 
-unsigned coverage_start_registers(const struct decode_header *h)
+static unsigned coverage_start_registers(const struct decode_header *h)
 {
 	unsigned regs = 0;
 	int i;
-- 
2.25.1

