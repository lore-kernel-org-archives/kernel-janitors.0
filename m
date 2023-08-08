Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2BBC41513
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Aug 2023 01:11:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbjHIBL3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Aug 2023 21:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjHIBL2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Aug 2023 21:11:28 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 8BF6D19A8;
        Tue,  8 Aug 2023 18:11:26 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id 4C297608D10AB;
        Tue,  8 Aug 2023 17:19:10 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     jack@suse.cz, amir73il@gmail.com, repnop@google.com
Cc:     linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Su Hui <suhui@nfschina.com>
Subject: [PATCH] fanotify: avoid possible NULL dereference
Date:   Tue,  8 Aug 2023 17:18:50 +0800
Message-Id: <20230808091849.505809-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

smatch error:
fs/notify/fanotify/fanotify_user.c:462 copy_fid_info_to_user():
we previously assumed 'fh' could be null (see line 421)

Fixes: afc894c784c8 ("fanotify: Store fanotify handles differently")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 fs/notify/fanotify/fanotify_user.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanotify_user.c
index f69c451018e3..5a5487ae2460 100644
--- a/fs/notify/fanotify/fanotify_user.c
+++ b/fs/notify/fanotify/fanotify_user.c
@@ -459,12 +459,13 @@ static int copy_fid_info_to_user(__kernel_fsid_t *fsid, struct fanotify_fh *fh,
 	if (WARN_ON_ONCE(len < sizeof(handle)))
 		return -EFAULT;
 
-	handle.handle_type = fh->type;
 	handle.handle_bytes = fh_len;
 
 	/* Mangle handle_type for bad file_handle */
 	if (!fh_len)
 		handle.handle_type = FILEID_INVALID;
+	else
+		handle.handle_type = fh->type;
 
 	if (copy_to_user(buf, &handle, sizeof(handle)))
 		return -EFAULT;
-- 
2.30.2

