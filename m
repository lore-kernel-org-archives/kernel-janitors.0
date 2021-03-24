Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6CDC433C1
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Mar 2021 14:36:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C71BF61A1B
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Mar 2021 14:36:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236230AbhCXOfa convert rfc822-to-8bit (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 24 Mar 2021 10:35:30 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14462 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236289AbhCXOfX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Mar 2021 10:35:23 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F59hH0XkmzwQQp;
        Wed, 24 Mar 2021 22:33:19 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Mar 2021 22:35:08 +0800
From:   'Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Thomas Gleixner <tglx@linutronix.de>,
        "Ingo Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        <x86@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Mike Rapoport <rppt@kernel.org>, Jiri Olsa <jolsa@redhat.com>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: [PATCH -next] x86/kprobes: Fix old-style-declaration warning
Date:   Wed, 24 Mar 2021 14:45:02 +0000
Message-ID: <20210324144502.1154883-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

Gcc reports build warning as follows:

arch/x86/kernel/kprobes/core.c:940:1:
 warning: 'inline' is not at beginning of declaration [-Wold-style-declaration]
  940 | static int nokprobe_inline kprobe_is_ss(struct kprobe_ctlblk *kcb)
      | ^~~~~~

This commit fix it by moving nokprobe_inline to the beginning
of declaration.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 arch/x86/kernel/kprobes/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index 89d9f26785c7..5abf251f12ec 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -937,7 +937,7 @@ static int reenter_kprobe(struct kprobe *p, struct pt_regs *regs,
 }
 NOKPROBE_SYMBOL(reenter_kprobe);
 
-static int nokprobe_inline kprobe_is_ss(struct kprobe_ctlblk *kcb)
+static nokprobe_inline int kprobe_is_ss(struct kprobe_ctlblk *kcb)
 {
 	return (kcb->kprobe_status == KPROBE_HIT_SS ||
 		kcb->kprobe_status == KPROBE_REENTER);

