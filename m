Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3C5C433ED
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Apr 2021 17:57:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3AAE610CD
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Apr 2021 17:57:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244038AbhDPR6F (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 16 Apr 2021 13:58:05 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:34454 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244005AbhDPR6C (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Apr 2021 13:58:02 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d61 with ME
        id tVxa2400P21Fzsu03VxbWS; Fri, 16 Apr 2021 19:57:36 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 16 Apr 2021 19:57:36 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
        lukas.bulwahn@gmail.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2] checkpatch: Improve ALLOC_ARRAY_ARGS test
Date:   Fri, 16 Apr 2021 19:57:33 +0200
Message-Id: <205fc4847972fb6779abcc8818f39c14d1b45af1.1618595794.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The devm_ variant of 'kcalloc()' and 'kmalloc_array()' are not tested
Add the corresponding check.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: use a cleaner regex as proposed by Joe Perches
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 44b9dc330ac6..23697a6b1eaa 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7006,7 +7006,7 @@ sub process {
 		}
 
 # check for alloc argument mismatch
-		if ($line =~ /\b(kcalloc|kmalloc_array)\s*\(\s*sizeof\b/) {
+		if ($line =~ /\b((?:devm_)?(?:kcalloc|kmalloc_array))\s*\(\s*sizeof\b/) {
 			WARN("ALLOC_ARRAY_ARGS",
 			     "$1 uses number as first arg, sizeof is generally wrong\n" . $herecurr);
 		}
-- 
2.27.0

