Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39E7C433F5
	for <kernel-janitors@archiver.kernel.org>; Sun, 28 Nov 2021 14:00:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357857AbhK1ODy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 28 Nov 2021 09:03:54 -0500
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:50830 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357797AbhK1OBx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 28 Nov 2021 09:01:53 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id rKhQm0tTzTdRTrKhQm5ZGm; Sun, 28 Nov 2021 14:58:37 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 28 Nov 2021 14:58:37 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     dhowells@redhat.com, lukas.bulwahn@gmail.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] watch_queue: Fix a memory leak
Date:   Sun, 28 Nov 2021 14:58:35 +0100
Message-Id: <689128702c77b331db90f5452ee94d6bc0654824.1638107850.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <ce45fdcf1f0fd06e425f700fe53ee38a5a0f66b6.1638107850.git.christophe.jaillet@wanadoo.fr>
References: <ce45fdcf1f0fd06e425f700fe53ee38a5a0f66b6.1638107850.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The 'notes_bitmap' is allocated in 'watch_queue_set_size()' but is never
released.
Free it when 'wqueue' and its other fields are freed.

Fixes: c73be61cede5 ("pipe: Add general notification queue support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
WARNING: This patch is certainly buggy because there is 'rcu'
consideration, but I've nothing better to propose.

It is maybe also completely buggy because freeing reference counted
resources is sometimes puzzling!

So review with care and update as needed (if needed :) )
---
 kernel/watch_queue.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
index 41ea30948c57..36c6822bec86 100644
--- a/kernel/watch_queue.c
+++ b/kernel/watch_queue.c
@@ -372,6 +372,7 @@ static void __put_watch_queue(struct kref *kref)
 	wfilter = rcu_access_pointer(wqueue->filter);
 	if (wfilter)
 		kfree_rcu(wfilter, rcu);
+	bitmap_free(wqueue->notes_bitmap);
 	kfree_rcu(wqueue, rcu);
 }
 
-- 
2.30.2

