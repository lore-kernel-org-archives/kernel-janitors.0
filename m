Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDDFC2B9F4
	for <kernel-janitors@archiver.kernel.org>; Thu, 17 Jun 2021 12:08:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA133610EA
	for <kernel-janitors@archiver.kernel.org>; Thu, 17 Jun 2021 12:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232717AbhFQMKv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 17 Jun 2021 08:10:51 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44765 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232705AbhFQMKv (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Jun 2021 08:10:51 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1ltqp3-0005BX-Nj; Thu, 17 Jun 2021 12:08:37 +0000
From:   Colin King <colin.king@canonical.com>
To:     Pan Bian <bianpan2016@163.com>, Jan Kara <jack@suse.cz>,
        linux-kernel@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [PATCH] isofs: remove redundant continue statement
Date:   Thu, 17 Jun 2021 13:08:37 +0100
Message-Id: <20210617120837.11994-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The continue statement in the while-loop has no effect,
remove it.

Addresses-Coverity: ("Continue has no effect")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/isofs/dir.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/isofs/dir.c b/fs/isofs/dir.c
index b9e6a7ec78be..eb2f8273e6f1 100644
--- a/fs/isofs/dir.c
+++ b/fs/isofs/dir.c
@@ -235,8 +235,6 @@ static int do_isofs_readdir(struct inode *inode, struct file *file,
 				break;
 		}
 		ctx->pos += de_len;
-
-		continue;
 	}
 	if (bh)
 		brelse(bh);
-- 
2.31.1

