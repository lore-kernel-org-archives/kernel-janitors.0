Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBB6C4338F
	for <kernel-janitors@archiver.kernel.org>; Mon, 16 Aug 2021 08:14:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A515861AFD
	for <kernel-janitors@archiver.kernel.org>; Mon, 16 Aug 2021 08:14:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234456AbhHPIOf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 16 Aug 2021 04:14:35 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:36362
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234386AbhHPIOe (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 16 Aug 2021 04:14:34 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id B40CB3F07E;
        Mon, 16 Aug 2021 08:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629101641;
        bh=vZ+2K8gvgcJ2tO2ihj+/bmoD+maboGhrWXOpKiEomYg=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=smOIfI+45kUrQ/zJbshKrBwyejdZW10Lpo+CMuBVHnVp62qDlfA++JniCVLlqYYGc
         gi66AezRhcJNdwvumvHIdhD+bTa0unv6Iwd7i+DWpngLIdPIzTAcpS2gfePDcBSmvX
         6OvyZ4r54cvCxPvXDNIxvJVcpj6aA0sm0dEBu4mOEyYDaydgomqgzGBU7vAvo+EVC8
         t60gtc1knNd+G7iMBye4GR4FO6rRXRHKQKWcpssQPtzSrNLrIhlsIGgFomDR48FUZ4
         60FvS8N+8d/4FwApwqLjWUu1YYqLXJNTxAJoq+PtJObTYC08BUMMJPG9VTMcyKxgyz
         xvd42uRVQSKKQ==
From:   Colin King <colin.king@canonical.com>
To:     Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
        ntfs3@lists.linux.dev
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: Fix spelling mistake "whitout" -> "without"
Date:   Mon, 16 Aug 2021 09:14:01 +0100
Message-Id: <20210816081401.5825-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a ntfs_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ntfs3/run.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/run.c b/fs/ntfs3/run.c
index 5cdf6efe67e0..f9c362ac672e 100644
--- a/fs/ntfs3/run.c
+++ b/fs/ntfs3/run.c
@@ -949,7 +949,7 @@ int run_unpack(struct runs_tree *run, struct ntfs_sb_info *sbi, CLST ino,
 		if (next_vcn > 0x100000000ull || (lcn + len) > 0x100000000ull) {
 			ntfs_err(
 				sbi->sb,
-				"This driver is compiled whitout CONFIG_NTFS3_64BIT_CLUSTER (like windows driver).\n"
+				"This driver is compiled without CONFIG_NTFS3_64BIT_CLUSTER (like windows driver).\n"
 				"Volume contains 64 bits run: vcn %llx, lcn %llx, len %llx.\n"
 				"Activate CONFIG_NTFS3_64BIT_CLUSTER to process this case",
 				vcn64, lcn, len);
-- 
2.32.0

