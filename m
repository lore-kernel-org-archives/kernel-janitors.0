Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5CAC433F5
	for <kernel-janitors@archiver.kernel.org>; Sat, 18 Sep 2021 19:56:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0415A61051
	for <kernel-janitors@archiver.kernel.org>; Sat, 18 Sep 2021 19:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238828AbhIRT5r (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 18 Sep 2021 15:57:47 -0400
Received: from smtp13.smtpout.orange.fr ([80.12.242.135]:52032 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S234876AbhIRT5q (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 18 Sep 2021 15:57:46 -0400
Received: from pop-os.home ([90.126.248.220])
        by mwinf5d62 with ME
        id vXwL2500A4m3Hzu03XwMSp; Sat, 18 Sep 2021 21:56:21 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 18 Sep 2021 21:56:21 +0200
X-ME-IP: 90.126.248.220
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     almaz.alexandrovich@paragon-software.com
Cc:     ntfs3@lists.linux.dev, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 1/2] fs/ntfs3: Remove a useless test in 'indx_find()'
Date:   Sat, 18 Sep 2021 21:56:19 +0200
Message-Id: <704648698ab3a8e2de118c1bfcb7cec9d84738d4.1631994909.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'fnd' has been dereferenced several time before, so testing it here is
pointless.
Moreover, all callers of 'indx_find()' already have some error handling
code that makes sure that no NULL 'fnd' is passed.

So, remove the useless test.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/ntfs3/index.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index 4f71a91f07d9..6f81e3a49abf 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -1072,9 +1072,7 @@ int indx_find(struct ntfs_index *indx, struct ntfs_inode *ni,
 	if (!e)
 		return -EINVAL;
 
-	if (fnd)
-		fnd->root_de = e;
-
+	fnd->root_de = e;
 	err = 0;
 
 	for (;;) {
-- 
2.30.2

