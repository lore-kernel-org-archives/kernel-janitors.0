Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A030C433B4
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Apr 2021 15:59:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EE26611C2
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Apr 2021 15:59:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237789AbhDPP72 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 16 Apr 2021 11:59:28 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:38614 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235483AbhDPP72 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Apr 2021 11:59:28 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d18 with ME
        id tTyz2400G21Fzsu03Tyz5Q; Fri, 16 Apr 2021 17:59:00 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 16 Apr 2021 17:59:00 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com,
        lukas.bulwahn@gmail.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] checkpatch: Improve ALLOC_ARRAY_ARGS test
Date:   Fri, 16 Apr 2021 17:58:57 +0200
Message-Id: <a1ac975aaabc9f71397b75254f833920428411e0.1618588673.git.christophe.jaillet@wanadoo.fr>
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
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 44b9dc330ac6..c778edfdbad7 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7006,9 +7006,9 @@ sub process {
 		}
 
 # check for alloc argument mismatch
-		if ($line =~ /\b(kcalloc|kmalloc_array)\s*\(\s*sizeof\b/) {
+		if ($line =~ /\b(devm_|)(kcalloc|kmalloc_array)\s*\(\s*sizeof\b/) {
 			WARN("ALLOC_ARRAY_ARGS",
-			     "$1 uses number as first arg, sizeof is generally wrong\n" . $herecurr);
+			     "$1$2 uses number as first arg, sizeof is generally wrong\n" . $herecurr);
 		}
 
 # check for multiple semicolons
-- 
2.27.0

