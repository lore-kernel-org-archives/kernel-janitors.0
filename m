Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0145EC47088
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 14:46:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA0AC61159
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 14:46:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbhEZOsM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 May 2021 10:48:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60464 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234970AbhEZOsK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 May 2021 10:48:10 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1llunN-00018X-LG; Wed, 26 May 2021 14:46:21 +0000
From:   Colin King <colin.king@canonical.com>
To:     Christine Caulfield <ccaulfie@redhat.com>,
        David Teigland <teigland@redhat.com>,
        Alexander Aring <aahringo@redhat.com>, cluster-devel@redhat.com
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH]  fs: dlm: Fix memory leak of object mh
Date:   Wed, 26 May 2021 15:46:05 +0100
Message-Id: <20210526144605.3751174-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an error return path that is not kfree'ing mh after
it has been successfully allocates.  Fix this by moving the
call to create_rcom to after the check on rc_in->rc_id check
to avoid this.

Thanks to Alexander Ahring Oder Aring for suggesting the
correct way to fix this.

Addresses-Coverity: ("Resource leak")
Fixes: a070a91cf140 ("fs: dlm: add more midcomms hooks")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: don't kfree the object, instead move the check to before
    the call to create_rcom
---
 fs/dlm/rcom.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 085f21966c72..a7727b9e5e83 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -385,10 +385,6 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	int error, ret_nodeid, nodeid = rc_in->rc_header.h_nodeid;
 	int len = rc_in->rc_header.h_length - sizeof(struct dlm_rcom);
 
-	error = create_rcom(ls, nodeid, DLM_RCOM_LOOKUP_REPLY, 0, &rc, &mh);
-	if (error)
-		return;
-
 	/* Old code would send this special id to trigger a debug dump. */
 	if (rc_in->rc_id == 0xFFFFFFFF) {
 		log_error(ls, "receive_rcom_lookup dump from %d", nodeid);
@@ -396,6 +392,10 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 		return;
 	}
 
+	error = create_rcom(ls, nodeid, DLM_RCOM_LOOKUP_REPLY, 0, &rc, &mh);
+	if (error)
+		return;
+
 	error = dlm_master_lookup(ls, nodeid, rc_in->rc_buf, len,
 				  DLM_LU_RECOVER_MASTER, &ret_nodeid, NULL);
 	if (error)
-- 
2.31.1

