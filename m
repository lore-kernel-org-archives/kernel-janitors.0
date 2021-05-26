Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C5CC2B9F7
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 08:53:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9099D61408
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 08:53:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233220AbhEZIzM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 May 2021 04:55:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50994 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233037AbhEZIzL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 May 2021 04:55:11 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1llpIJ-0001Yn-JM; Wed, 26 May 2021 08:53:39 +0000
From:   Colin King <colin.king@canonical.com>
To:     Christine Caulfield <ccaulfie@redhat.com>,
        David Teigland <teigland@redhat.com>, cluster-devel@redhat.com
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] fs: dlm: Fix spelling mistake "stucked" -> "stuck"
Date:   Wed, 26 May 2021 09:53:39 +0100
Message-Id: <20210526085339.6604-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistake in log messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/dlm/midcomms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 35664950f6b7..4e36e418b6bf 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -591,7 +591,7 @@ dlm_midcomms_recv_node_lookup(int nodeid, const union dlm_packet *p,
 					 * was failed, we try to reset and
 					 * hope it will go on.
 					 */
-					log_print("reset node %d because shutdown stucked",
+					log_print("reset node %d because shutdown stuck",
 						  node->nodeid);
 
 					midcomms_node_reset(node);
@@ -1159,7 +1159,7 @@ void dlm_midcomms_add_member(int nodeid)
 			 * was failed, we try to reset and
 			 * hope it will go on.
 			 */
-			log_print("reset node %d because shutdown stucked",
+			log_print("reset node %d because shutdown stuck",
 				  node->nodeid);
 
 			midcomms_node_reset(node);
-- 
2.31.1

