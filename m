Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6CEC38142
	for <kernel-janitors@archiver.kernel.org>; Sat, 28 Jan 2023 15:43:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233380AbjA1PnQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 28 Jan 2023 10:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbjA1PnK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 28 Jan 2023 10:43:10 -0500
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A8E13DFF
        for <kernel-janitors@vger.kernel.org>; Sat, 28 Jan 2023 07:43:08 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id LnM9phWDqeUnHLnM9p9nzv; Sat, 28 Jan 2023 16:43:06 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 28 Jan 2023 16:43:06 +0100
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@kernel.org>, dm-devel@redhat.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] dm-crypt: Slightly simplify crypt_set_keyring_key()
Date:   Sat, 28 Jan 2023 16:43:00 +0100
Message-Id: <c3d25e24503d9e625cf46e9fb4ee55f10bfdd398.1674920529.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Use strchr() instead of strpbrk() when there is only 1 element in the set
of characters to look for.
This potentially saves a few cycles.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
On my machine, the diff of the .s file shows that the generated code is
the same:

-- drivers/md/dm-crypt.old.s	2023-01-28 16:28:08.968026902 +0100
++ drivers/md/dm-crypt.s	2023-01-28 16:28:32.056027335 +0100
@@ -17950,7 +17950,7 @@
 	call	__sanitizer_cov_trace_const_cmp1	#
 	testb	%bl, %bl	# _56
 	jne	.L928	#,
-# drivers/md/dm-crypt.c:2490: 	key_desc = strpbrk(key_string, ":");
+# drivers/md/dm-crypt.c:2490: 	key_desc = strchr(key_string, ':');
 	call	__sanitizer_cov_trace_pc	#
 	movl	$58, %esi	#,
 	movq	%r12, %rdi	# key_string,

This is done thanks to fold_builtin_strpbrk() in gcc which already
transforms such patterns.
(https://github.com/gcc-mirror/gcc/blob/master/gcc/builtins.cc#L10238)
---
 drivers/md/dm-crypt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 2653516bcdef..b9c41fd42e8a 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2487,7 +2487,7 @@ static int crypt_set_keyring_key(struct crypt_config *cc, const char *key_string
 	}
 
 	/* look for next ':' separating key_type from key_description */
-	key_desc = strpbrk(key_string, ":");
+	key_desc = strchr(key_string, ':');
 	if (!key_desc || key_desc == key_string || !strlen(key_desc + 1))
 		return -EINVAL;
 
-- 
2.34.1

