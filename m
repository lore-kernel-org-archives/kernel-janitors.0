Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8727EC433E0
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B90C6146D
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:21:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347964AbhCDAVH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:21:07 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:13113 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbhCCGc2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Mar 2021 01:32:28 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dr3yC2JQGz16FLY;
        Wed,  3 Mar 2021 14:29:55 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Mar 2021 14:31:28 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Hulk Robot <hulkci@huawei.com>, David Howells <dhowells@redhat.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-afs@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] afs: Remove unused variable in afs_req_issue_op()
Date:   Wed, 3 Mar 2021 06:40:28 +0000
Message-ID: <20210303064028.895953-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

GCC reports the following warning with W=1:

fs/afs/file.c:291:6: warning:
 unused variable 'ret' [-Wunused-variable]
  291 |  int ret;
      |      ^~~

After commit 799fbdf96cd51, this variable is not used in function
afs_req_issue_op(), so this commit remove it to fix the warning.

Fixes: 799fbdf96cd51 ("afs: Use new fscache read helper API")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 fs/afs/file.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index af162d7dab5b..cf2b664a68a5 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -288,7 +288,6 @@ static void afs_req_issue_op(struct netfs_read_subrequest *subreq)
 {
 	struct afs_vnode *vnode = AFS_FS_I(subreq->rreq->inode);
 	struct afs_read *fsreq;
-	int ret;
 
 	fsreq = afs_alloc_read(GFP_NOFS);
 	if (!fsreq)

