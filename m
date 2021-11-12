Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4380C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Nov 2021 16:54:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B795F61076
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Nov 2021 16:54:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235311AbhKLQ44 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Nov 2021 11:56:56 -0500
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:49586 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235390AbhKLQ4z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Nov 2021 11:56:55 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id lZoNmTr5w1UGBlZoNmGJxP; Fri, 12 Nov 2021 17:54:04 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 12 Nov 2021 17:54:04 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     bp@alien8.de, mchehab@kernel.org, tony.luck@intel.com,
        james.morse@arm.com, rric@kernel.org
Cc:     linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] EDAC, wq: Remove redundant 'flush_workqueue()' calls
Date:   Fri, 12 Nov 2021 17:53:58 +0100
Message-Id: <0b69bf50e40fb2d6868cb7f873a5ae600c66a48e.1636735970.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'destroy_workqueue()' already drains the queue before destroying it, so
there is no need to flush it explicitly.

Remove the redundant 'flush_workqueue()' calls.

This was generated with coccinelle:

@@
expression E;
@@
- 	flush_workqueue(E);
	destroy_workqueue(E);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/edac/wq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/edac/wq.c b/drivers/edac/wq.c
index d021d287eaec..ad3f516627c5 100644
--- a/drivers/edac/wq.c
+++ b/drivers/edac/wq.c
@@ -37,7 +37,6 @@ int edac_workqueue_setup(void)
 
 void edac_workqueue_teardown(void)
 {
-	flush_workqueue(wq);
 	destroy_workqueue(wq);
 	wq = NULL;
 }
-- 
2.30.2

