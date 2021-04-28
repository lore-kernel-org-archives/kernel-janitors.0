Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA5CCC433ED
	for <kernel-janitors@archiver.kernel.org>; Wed, 28 Apr 2021 08:44:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8377561420
	for <kernel-janitors@archiver.kernel.org>; Wed, 28 Apr 2021 08:44:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237919AbhD1IpI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 28 Apr 2021 04:45:08 -0400
Received: from smtp12.smtpout.orange.fr ([80.12.242.134]:23372 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237410AbhD1IpG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 28 Apr 2021 04:45:06 -0400
Received: from localhost.localdomain ([86.243.172.93])
        by mwinf5d23 with ME
        id y8kL2400621Fzsu038kLjb; Wed, 28 Apr 2021 10:44:20 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 28 Apr 2021 10:44:20 +0200
X-ME-IP: 86.243.172.93
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jack@suse.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] quota: Use 'hlist_for_each_entry' to simplify code
Date:   Wed, 28 Apr 2021 10:44:19 +0200
Message-Id: <f82d3e33964dcbd2aac19866735e0a8381c8a735.1619599407.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use 'hlist_for_each_entry' instead of hand writing it.
This saves a few lines of code.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 fs/quota/dquot.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
index 4f1373463766..22d904bde6ab 100644
--- a/fs/quota/dquot.c
+++ b/fs/quota/dquot.c
@@ -288,14 +288,12 @@ static inline void remove_dquot_hash(struct dquot *dquot)
 static struct dquot *find_dquot(unsigned int hashent, struct super_block *sb,
 				struct kqid qid)
 {
-	struct hlist_node *node;
 	struct dquot *dquot;
 
-	hlist_for_each (node, dquot_hash+hashent) {
-		dquot = hlist_entry(node, struct dquot, dq_hash);
+	hlist_for_each_entry(dquot, dquot_hash+hashent, dq_hash)
 		if (dquot->dq_sb == sb && qid_eq(dquot->dq_id, qid))
 			return dquot;
-	}
+
 	return NULL;
 }
 
-- 
2.30.2

