Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B92EB64DC
	for <kernel-janitors@archiver.kernel.org>; Sun,  9 Jul 2023 16:13:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbjGIQNL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 9 Jul 2023 12:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjGIQNK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 9 Jul 2023 12:13:10 -0400
Received: from smtp.smtpout.orange.fr (smtp-21.smtpout.orange.fr [80.12.242.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D0DDFD
        for <kernel-janitors@vger.kernel.org>; Sun,  9 Jul 2023 09:13:03 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id IX1vq6cfwbalEIX1vq7Ijw; Sun, 09 Jul 2023 18:13:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1688919180;
        bh=y5RKgMsLoXKY+PpcxUdYWHasiu7hlqbJ+TzTtF5rZRs=;
        h=From:To:Cc:Subject:Date;
        b=VzfbNDtIbKrHXxPHzeNNL/V2v4EWlxaMQNd4uh47kMpWMegEWUK+Cgt138sn708ic
         6PEeCySdmUNW1HTuwVC/yWKPPb8Vd5dnQOhvhohjPNK2Vd26GvMrVtjOgFpqYkts5K
         Oa0WiIvB8KBBK5rAYxaHqGUqCIVnaQ2E6dUdx9EVbEoBD9utkjTl5A+NQiYxEPqLqy
         t/4URf0KqwxtjgzAbqzbTz8UKZ8q+zq9t7vzsuLGCT7UXkJy8+zekZIKrcET2yGLp3
         NZQ/awKDEmeNyrlZ7BNBxRMTTP0ZUXr1HcCAPU4MMK2BQ53AYTTKO4Mp4VwuB7ILyI
         U7c4b34mxNw+w==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 09 Jul 2023 18:13:00 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     jannh@google.com, akpm@linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] ipc/sem: Use flexible array in 'struct sem_undo'
Date:   Sun,  9 Jul 2023 18:12:55 +0200
Message-Id: <1ba993d443ad7e16ac2b1902adab1f05ebdfa454.1688918791.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Turn 'semadj' in 'struct sem_undo' into a flexible array.

The advantages are:
   - save the size of a pointer when the new undo structure is allocated
   - avoid some always ugly pointer arithmetic to get the address of semadj
   - avoid an indirection when the array is accessed

While at it, use struct_size() to compute the size of the new undo
structure.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure who to put in copy, get_maintainer.pl is of litle help.
---
 ipc/sem.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/ipc/sem.c b/ipc/sem.c
index 00f88aa01ac5..a39cdc7bf88f 100644
--- a/ipc/sem.c
+++ b/ipc/sem.c
@@ -152,7 +152,7 @@ struct sem_undo {
 	struct list_head	list_id;	/* per semaphore array list:
 						 * all undos for one array */
 	int			semid;		/* semaphore set identifier */
-	short			*semadj;	/* array of adjustments */
+	short			semadj[];	/* array of adjustments */
 						/* one per semaphore */
 };
 
@@ -1938,8 +1938,7 @@ static struct sem_undo *find_alloc_undo(struct ipc_namespace *ns, int semid)
 	rcu_read_unlock();
 
 	/* step 2: allocate new undo structure */
-	new = kvzalloc(sizeof(struct sem_undo) + sizeof(short)*nsems,
-		       GFP_KERNEL_ACCOUNT);
+	new = kvzalloc(struct_size(new, semadj, nsems), GFP_KERNEL_ACCOUNT);
 	if (!new) {
 		ipc_rcu_putref(&sma->sem_perm, sem_rcu_free);
 		return ERR_PTR(-ENOMEM);
@@ -1967,7 +1966,6 @@ static struct sem_undo *find_alloc_undo(struct ipc_namespace *ns, int semid)
 		goto success;
 	}
 	/* step 5: initialize & link new undo structure */
-	new->semadj = (short *) &new[1];
 	new->ulp = ulp;
 	new->semid = semid;
 	assert_spin_locked(&ulp->lock);
-- 
2.34.1

