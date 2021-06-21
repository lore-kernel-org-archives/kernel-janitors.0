Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9A9C4743C
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Jun 2021 10:05:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9918660FDA
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Jun 2021 10:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhFUKHf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 21 Jun 2021 06:07:35 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41833 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhFUKHf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Jun 2021 06:07:35 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lvGnw-0003r9-6e; Mon, 21 Jun 2021 10:05:20 +0000
From:   Colin King <colin.king@canonical.com>
To:     Ryusuke Konishi <konishi.ryusuke@gmail.com>,
        linux-nilfs@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] nilfs2: remove redundant continue statement in a while-loop
Date:   Mon, 21 Jun 2021 11:05:19 +0100
Message-Id: <20210621100519.10257-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The continue statement at the end of the while-loop is redundant,
remove it.

Addresses-Coverity: ("Continue has no effect")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/nilfs2/btree.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/nilfs2/btree.c b/fs/nilfs2/btree.c
index f42ab57201e7..ab9ec073330f 100644
--- a/fs/nilfs2/btree.c
+++ b/fs/nilfs2/btree.c
@@ -738,7 +738,6 @@ static int nilfs_btree_lookup_contig(const struct nilfs_bmap *btree,
 			if (ptr2 != ptr + cnt || ++cnt == maxblocks)
 				goto end;
 			index++;
-			continue;
 		}
 		if (level == maxlevel)
 			break;
-- 
2.31.1

