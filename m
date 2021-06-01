Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EF1C4708F
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 10:37:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D407560FEE
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 10:37:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbhFAKiu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 06:38:50 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40070 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhFAKit (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 06:38:49 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lo1lj-0000wN-Lr; Tue, 01 Jun 2021 10:37:07 +0000
From:   Colin King <colin.king@canonical.com>
To:     Michal Simek <monstr@monstr.eu>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arch: microblaze: Fix spelling mistake "vesion" -> "version"
Date:   Tue,  1 Jun 2021 11:37:07 +0100
Message-Id: <20210601103707.9701-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the comment. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/microblaze/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
index b41f323e1fde..6d4af39e3890 100644
--- a/arch/microblaze/Makefile
+++ b/arch/microblaze/Makefile
@@ -3,7 +3,7 @@ KBUILD_DEFCONFIG := mmu_defconfig
 
 UTS_SYSNAME = -DUTS_SYSNAME=\"Linux\"
 
-# What CPU vesion are we building for, and crack it open
+# What CPU version are we building for, and crack it open
 # as major.minor.rev
 CPU_VER   := $(shell echo $(CONFIG_XILINX_MICROBLAZE0_HW_VER))
 CPU_MAJOR := $(shell echo $(CPU_VER) | cut -d '.' -f 1)
-- 
2.31.1

