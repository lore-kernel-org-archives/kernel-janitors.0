Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F51C07E9A
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Jul 2021 09:25:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D2C1613E0
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Jul 2021 09:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbhGDJ17 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 4 Jul 2021 05:27:59 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53117 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhGDJ16 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 4 Jul 2021 05:27:58 -0400
Received: from cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net ([80.193.200.194] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lzyNO-0005y5-4F; Sun, 04 Jul 2021 09:25:22 +0000
From:   Colin King <colin.king@canonical.com>
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] cramfs: Fix spelling mistake "adressed" -> "addressed"
Date:   Sun,  4 Jul 2021 10:25:21 +0100
Message-Id: <20210704092521.34660-1-colin.king@canonical.com>
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
 fs/cramfs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cramfs/Kconfig b/fs/cramfs/Kconfig
index d98cef0dbb6b..a8af8c6ac15d 100644
--- a/fs/cramfs/Kconfig
+++ b/fs/cramfs/Kconfig
@@ -38,7 +38,7 @@ config CRAMFS_MTD
 	default y if !CRAMFS_BLOCKDEV
 	help
 	  This option allows the CramFs driver to load data directly from
-	  a linear adressed memory range (usually non volatile memory
+	  a linear addressed memory range (usually non volatile memory
 	  like flash) instead of going through the block device layer.
 	  This saves some memory since no intermediate buffering is
 	  necessary.
-- 
2.31.1

