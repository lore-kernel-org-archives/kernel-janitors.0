Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3741CC48BD1
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 14:54:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25FD2613BD
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 14:54:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238404AbhFIO4I (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 10:56:08 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:5313 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238390AbhFIO4I (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 10:56:08 -0400
Received: from dggeml759-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4G0VP72pnRz1BKR2;
        Wed,  9 Jun 2021 22:49:15 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 9 Jun 2021 22:54:06 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Suren Baghdasaryan <surenb@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] psi: Make symbol 'psi_cgroups_enabled' static
Date:   Wed, 9 Jun 2021 15:04:37 +0000
Message-ID: <20210609150437.3473855-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeml759-chm.china.huawei.com (10.1.199.138)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The sparse tool complains as follows:

kernel/sched/psi.c:151:1: warning:
 symbol 'psi_cgroups_enabled' was not declared. Should it be static?

This symbol is not used outside of psi.c, so marks it static.

Fixes: 3958e2d0c34e ("cgroup: make per-cgroup pressure stall tracking configurable")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 kernel/sched/psi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index b773cae4c24b..d6e32de2f6af 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -148,7 +148,7 @@
 static int psi_bug __read_mostly;
 
 DEFINE_STATIC_KEY_FALSE(psi_disabled);
-DEFINE_STATIC_KEY_TRUE(psi_cgroups_enabled);
+static DEFINE_STATIC_KEY_TRUE(psi_cgroups_enabled);
 
 #ifdef CONFIG_PSI_DEFAULT_DISABLED
 static bool psi_enable;

