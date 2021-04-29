Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F16C433ED
	for <kernel-janitors@archiver.kernel.org>; Thu, 29 Apr 2021 10:03:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 509B561457
	for <kernel-janitors@archiver.kernel.org>; Thu, 29 Apr 2021 10:03:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238072AbhD2KEn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 29 Apr 2021 06:04:43 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39532 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237512AbhD2KEn (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 29 Apr 2021 06:04:43 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lc3WU-0004lW-RS; Thu, 29 Apr 2021 10:03:54 +0000
From:   Colin King <colin.king@canonical.com>
To:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH] initrd: remove redundant assignment to variable rotate
Date:   Thu, 29 Apr 2021 11:03:54 +0100
Message-Id: <20210429100354.58353-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of 0 to rotate is redundant, the value is never
read so it can be it removed.

Cleans up clang scan-build warning:
init/do_mounts_rd.c:252:4: warning: Value stored to 'rotate' is
never read [deadcode.DeadStores]
                        rotate = 0;
                        ^        ~
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 init/do_mounts_rd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/init/do_mounts_rd.c b/init/do_mounts_rd.c
index ac021ae6e6fa..8003604dbf90 100644
--- a/init/do_mounts_rd.c
+++ b/init/do_mounts_rd.c
@@ -249,7 +249,6 @@ int __init rd_load_image(char *from)
 	for (i = 0; i < nblocks; i++) {
 		if (i && (i % devblocks == 0)) {
 			pr_cont("done disk #1.\n");
-			rotate = 0;
 			fput(in_file);
 			break;
 		}
-- 
2.30.2

