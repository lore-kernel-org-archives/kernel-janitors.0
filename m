Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7E8C48BDF
	for <kernel-janitors@archiver.kernel.org>; Sun, 13 Jun 2021 13:41:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 473EA61078
	for <kernel-janitors@archiver.kernel.org>; Sun, 13 Jun 2021 13:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhFMNnj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 13 Jun 2021 09:43:39 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53750 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbhFMNnj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 13 Jun 2021 09:43:39 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lsQMr-0003KJ-D7; Sun, 13 Jun 2021 13:41:37 +0000
From:   Colin King <colin.king@canonical.com>
To:     Evgeniy Dushistov <dushistov@mail.ru>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ufs: remove redundant assignment to pointer p
Date:   Sun, 13 Jun 2021 14:41:37 +0100
Message-Id: <20210613134137.74131-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer p is being initialized with a value that is never
read before the function returns. The assignment is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ufs/dir.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ufs/dir.c b/fs/ufs/dir.c
index b721d0bda5e5..23cb6c8787f3 100644
--- a/fs/ufs/dir.c
+++ b/fs/ufs/dir.c
@@ -176,7 +176,6 @@ static bool ufs_check_page(struct page *page)
 		   rec_len, ufs_get_de_namlen(sb, p));
 	goto fail;
 Eend:
-	p = (struct ufs_dir_entry *)(kaddr + offs);
 	ufs_error(sb, __func__,
 		   "entry in directory #%lu spans the page boundary"
 		   "offset=%lu",
-- 
2.31.1

