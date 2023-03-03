Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205CEC678D4
	for <kernel-janitors@archiver.kernel.org>; Fri,  3 Mar 2023 02:58:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjCCC6I (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 2 Mar 2023 21:58:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjCCC6H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 2 Mar 2023 21:58:07 -0500
Received: from mail.nfschina.com (unknown [42.101.60.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B11501117A;
        Thu,  2 Mar 2023 18:58:05 -0800 (PST)
Received: from localhost (unknown [127.0.0.1])
        by mail.nfschina.com (Postfix) with ESMTP id DDDBF1A009FD;
        Fri,  3 Mar 2023 10:58:49 +0800 (CST)
X-Virus-Scanned: amavisd-new at nfschina.com
Received: from mail.nfschina.com ([127.0.0.1])
        by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zGQy1BLQ1ndF; Fri,  3 Mar 2023 10:58:49 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
        (Authenticated sender: yuzhe@nfschina.com)
        by mail.nfschina.com (Postfix) with ESMTPA id 7F17B1A00994;
        Fri,  3 Mar 2023 10:58:48 +0800 (CST)
From:   Yu Zhe <yuzhe@nfschina.com>
To:     catalin.marinas@arm.com, will@kernel.org, keescook@chromium.org,
        samitolvanen@google.com, chenzhou10@huawei.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, liqiong@nfschina.com,
        Yu Zhe <yuzhe@nfschina.com>
Subject: [PATCH] arm64: kexec: remove unnecessary (void*) conversions
Date:   Fri,  3 Mar 2023 10:57:15 +0800
Message-Id: <20230303025715.32570-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Pointer variables of void * type do not require type cast.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 arch/arm64/kernel/machine_kexec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index ce3d40120f72..d35cb0568f84 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -102,7 +102,7 @@ static void kexec_segment_flush(const struct kimage *kimage)
 /* Allocates pages for kexec page table */
 static void *kexec_page_alloc(void *arg)
 {
-	struct kimage *kimage = (struct kimage *)arg;
+	struct kimage *kimage = arg;
 	struct page *page = kimage_alloc_control_pages(kimage, 0);
 	void *vaddr = NULL;
 
-- 
2.11.0

