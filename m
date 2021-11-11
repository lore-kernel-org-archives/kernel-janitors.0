Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3FDC433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Nov 2021 07:45:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 58CD161058
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Nov 2021 07:45:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbhKKHsg (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Nov 2021 02:48:36 -0500
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:60480 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhKKHsf (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Nov 2021 02:48:35 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id l4mHmSjb5Bazol4mHmZJcd; Thu, 11 Nov 2021 08:45:46 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 11 Nov 2021 08:45:46 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     almaz.alexandrovich@paragon-software.com
Cc:     ntfs3@lists.linux.dev, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] fs/ntfs3: Fix some memory leaks in an error handling path of 'log_replay()'
Date:   Thu, 11 Nov 2021 08:45:44 +0100
Message-Id: <a2244abd11dc5f5ee8a0dcec97da33b75923facb.1636616693.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

All error handling paths lead to 'out' where many resources are freed.

Do it as well here instead of a direct return, otherwise 'log', 'ra' and
'log->one_page_buf' (at least) will leak.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/ntfs3/fslog.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index 06492f088d60..915f42cf07bc 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -4085,8 +4085,10 @@ int log_replay(struct ntfs_inode *ni, bool *initialized)
 		if (client == LFS_NO_CLIENT_LE) {
 			/* Insert "NTFS" client LogFile. */
 			client = ra->client_idx[0];
-			if (client == LFS_NO_CLIENT_LE)
-				return -EINVAL;
+			if (client == LFS_NO_CLIENT_LE) {
+				err = -EINVAL;
+				goto out;
+			}
 
 			t16 = le16_to_cpu(client);
 			cr = ca + t16;
-- 
2.30.2

