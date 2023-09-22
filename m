Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015F0CD4847
	for <kernel-janitors@archiver.kernel.org>; Fri, 22 Sep 2023 17:32:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbjIVRcQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 22 Sep 2023 13:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjIVRcC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 22 Sep 2023 13:32:02 -0400
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B6DCF
        for <kernel-janitors@vger.kernel.org>; Fri, 22 Sep 2023 10:31:21 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id jjzlq1mvsWkeLjjzrquw0f; Fri, 22 Sep 2023 19:31:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1695403880;
        bh=yYjSmcx/VJZzuw1p6UKG5+Hy8jnYhRHiCAv+RVTuQck=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=FlRxA+cj4yYQbUj6Il4dYJ2mbY0GguoV1mtN4/JI7AGuCZGLsyG7qy3Roc5/+MGv/
         3lGZPO7tzfakC/zroQzviKunsqS5oHuKjaMj24vZ3mndkrzLlahLUhO80U5KHTtpIg
         qCmUzt1Qxd8z96R1DeQWzZl44wYgPytHlVkrTNOubzHXWxsnQ9kkeNEhUNuwMIjTXP
         4TS4dHIUiEIymyMOtnKKMJDf0P6MG+6PjfmR5SlkivJR+QWD8Omac/o7m8/Y8s1Nl+
         Ercowm17JP8keVgYPC+aKYAvIYCtaisrsBerhLcv49ZqWe1/iWUOlqxXbdMWNAeb2G
         7wbjRjhOsCOIQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 22 Sep 2023 19:31:20 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Christine Caulfield <ccaulfie@redhat.com>,
        David Teigland <teigland@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        gfs2@lists.linux.dev
Subject: [PATCH 1/3] fs: dlm: Simplify buffer size computation in dlm_create_debug_file()
Date:   Fri, 22 Sep 2023 19:31:08 +0200
Message-Id: <ae6998f61fe07b17390905a35bc4f54ec49191cc.1695403360.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695403360.git.christophe.jaillet@wanadoo.fr>
References: <cover.1695403360.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use sizeof(name) instead of the equivalent, but hard coded,
DLM_LOCKSPACE_LEN + 8.

This is less verbose and more future proof.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/dlm/debug_fs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 5aabcb6f0f15..e9726c6cbdf2 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -986,7 +986,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 2 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_locks", ls->ls_name);
+	snprintf(name, sizeof(name), "%s_locks", ls->ls_name);
 
 	ls->ls_debug_locks_dentry = debugfs_create_file(name,
 							0644,
@@ -997,7 +997,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 3 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_all", ls->ls_name);
+	snprintf(name, sizeof(name), "%s_all", ls->ls_name);
 
 	ls->ls_debug_all_dentry = debugfs_create_file(name,
 						      S_IFREG | S_IRUGO,
@@ -1008,7 +1008,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 4 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_toss", ls->ls_name);
+	snprintf(name, sizeof(name), "%s_toss", ls->ls_name);
 
 	ls->ls_debug_toss_dentry = debugfs_create_file(name,
 						       S_IFREG | S_IRUGO,
@@ -1017,7 +1017,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 						       &format4_fops);
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_waiters", ls->ls_name);
+	snprintf(name, sizeof(name), "%s_waiters", ls->ls_name);
 
 	ls->ls_debug_waiters_dentry = debugfs_create_file(name,
 							  0644,
@@ -1028,7 +1028,7 @@ void dlm_create_debug_file(struct dlm_ls *ls)
 	/* format 5 */
 
 	memset(name, 0, sizeof(name));
-	snprintf(name, DLM_LOCKSPACE_LEN + 8, "%s_queued_asts", ls->ls_name);
+	snprintf(name, sizeof(name), "%s_queued_asts", ls->ls_name);
 
 	ls->ls_debug_queued_asts_dentry = debugfs_create_file(name,
 							      0644,
-- 
2.34.1

