Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5082C07E95
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Jul 2021 09:39:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C9C9613E0
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Jul 2021 09:39:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhGDJlh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 4 Jul 2021 05:41:37 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53261 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbhGDJlg (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 4 Jul 2021 05:41:36 -0400
Received: from cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net ([80.193.200.194] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lzyaM-0006j6-AL; Sun, 04 Jul 2021 09:38:46 +0000
From:   Colin King <colin.king@canonical.com>
To:     Geoff Levand <geoff@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: Fix spelling mistake "mesages" -> "messages" in Kconfig
Date:   Sun,  4 Jul 2021 10:38:46 +0100
Message-Id: <20210704093846.36972-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the Kconfig text. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/powerpc/platforms/ps3/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/ps3/Kconfig b/arch/powerpc/platforms/ps3/Kconfig
index a4048b8c8c50..610682caabc4 100644
--- a/arch/powerpc/platforms/ps3/Kconfig
+++ b/arch/powerpc/platforms/ps3/Kconfig
@@ -90,7 +90,7 @@ config PS3_VERBOSE_RESULT
 	bool "PS3 Verbose LV1 hypercall results" if PS3_ADVANCED
 	depends on PPC_PS3
 	help
-	  Enables more verbose log mesages for LV1 hypercall results.
+	  Enables more verbose log messages for LV1 hypercall results.
 
 	  If in doubt, say N here and reduce the size of the kernel by a
 	  small amount.
-- 
2.31.1

