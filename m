Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F73CC4320A
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Aug 2021 17:43:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43E39610A2
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Aug 2021 17:43:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240502AbhHERoB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Aug 2021 13:44:01 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:59261 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240724AbhHERn4 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Aug 2021 13:43:56 -0400
Received: from localhost.localdomain ([217.128.214.245])
        by mwinf5d63 with ME
        id dtje250085JEng903tjfsu; Thu, 05 Aug 2021 19:43:39 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 05 Aug 2021 19:43:39 +0200
X-ME-IP: 217.128.214.245
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     haris.iqbal@ionos.com, jinpu.wang@ionos.com, dledford@redhat.com,
        jgg@ziepe.ca
Cc:     linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] RDMA/rtrs: Remove a useless kfree
Date:   Thu,  5 Aug 2021 19:43:36 +0200
Message-Id: <9a57c9f837fa2c6f0070578a1bc4840688f62962.1628185335.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'sess->rbufs' is known to be NULL here, so there is no point in kfree'ing
it. It is just a no-op.

Remove the useless kfree.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/infiniband/ulp/rtrs/rtrs-clt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
index ece3205531b8..fc440a08e112 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
@@ -1844,7 +1844,6 @@ static int rtrs_rdma_conn_established(struct rtrs_clt_con *con,
 		}
 
 		if (!sess->rbufs) {
-			kfree(sess->rbufs);
 			sess->rbufs = kcalloc(queue_depth, sizeof(*sess->rbufs),
 					      GFP_KERNEL);
 			if (!sess->rbufs)
-- 
2.30.2

