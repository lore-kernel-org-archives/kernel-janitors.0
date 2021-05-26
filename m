Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8315AC47082
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 13:40:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58C22613B6
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 13:40:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232488AbhEZNmP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 May 2021 09:42:15 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:58368 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231319AbhEZNmO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 May 2021 09:42:14 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lltm3-0004tv-N3; Wed, 26 May 2021 13:40:39 +0000
From:   Colin King <colin.king@canonical.com>
To:     Christine Caulfield <ccaulfie@redhat.com>,
        David Teigland <teigland@redhat.com>,
        Alexander Aring <aahringo@redhat.com>, cluster-devel@redhat.com
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] fs: dlm: Fix memory leak of object mh
Date:   Wed, 26 May 2021 14:40:39 +0100
Message-Id: <20210526134039.3448305-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an error return path that is not kfree'ing mh after
it has been successfully allocates.  Fix this by free'ing it.

Addresses-Coverity: ("Resource leak")
Fixes: a070a91cf140 ("fs: dlm: add more midcomms hooks")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/dlm/rcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 085f21966c72..19298edc1573 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -393,6 +393,7 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	if (rc_in->rc_id == 0xFFFFFFFF) {
 		log_error(ls, "receive_rcom_lookup dump from %d", nodeid);
 		dlm_dump_rsb_name(ls, rc_in->rc_buf, len);
+		kfree(mh);
 		return;
 	}
 
-- 
2.31.1

