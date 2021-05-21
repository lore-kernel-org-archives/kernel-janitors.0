Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E899C433B4
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 May 2021 10:33:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A752613BE
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 May 2021 10:33:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhEUKex (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 May 2021 06:34:53 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:40628 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233060AbhEUKdF (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 May 2021 06:33:05 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lk2RO-0000d2-Ou; Fri, 21 May 2021 10:31:38 +0000
From:   Colin King <colin.king@canonical.com>
To:     Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] dm space map disk: remove redundant initialization of variable index
Date:   Fri, 21 May 2021 11:31:38 +0100
Message-Id: <20210521103138.43383-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable index is being initialized with a value that is never read,
it is being updated later on. The assignment is redundant and can be
removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/md/persistent-data/dm-space-map-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/persistent-data/dm-space-map-common.c b/drivers/md/persistent-data/dm-space-map-common.c
index 7e30700c8830..ad7a1b9304c7 100644
--- a/drivers/md/persistent-data/dm-space-map-common.c
+++ b/drivers/md/persistent-data/dm-space-map-common.c
@@ -577,7 +577,7 @@ static int __sm_ll_inc_overflow(struct ll_disk *ll, dm_block_t b, struct inc_con
 
 static int sm_ll_inc_overflow(struct ll_disk *ll, dm_block_t b, struct inc_context *ic)
 {
-	int index = -1;
+	int index;
 	struct btree_node *n;
 	__le32 *v_ptr;
 	uint32_t rc;
-- 
2.31.1

