Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60F6EB64DC
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 Jul 2023 17:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbjGQRzQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 Jul 2023 13:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjGQRzP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 Jul 2023 13:55:15 -0400
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 858671B5
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jul 2023 10:55:13 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id LSRBqStkanCoyLSRBquzGy; Mon, 17 Jul 2023 19:55:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1689616511;
        bh=Fpk05MGU6nNGzQRzekEDu8vSE/s3ApjtFu1sQjrmUCg=;
        h=From:To:Cc:Subject:Date;
        b=Hq9VMBESswxqmkPDQDZwqnoyp75phIcB8PgZ5YKAqBrPnSxhj1oMThwXh3liI5+aL
         qaN069ATLkY7lVcTsRNKxp0nkHZXTQ7rRaA+3E7fqHcHjwVZdUzBa62tURVKrhmy/d
         Z6w/NiFpMqC/N9zcwky+sG04NQdboEa12mmPN5PmYSpTyq16xMbalOVU9dEsPGbKku
         XU+bIOYOzgs8ICIMcmMlzgbfC8FXPMUWUNtsOOvhWYo7pvSE63kKCqkn9l7HUaBEMj
         bnfF+yQhvcwDVnFMl6LGK8HRbud6Bj6M98Ulp2kDz/x8NehWq0/9c0Wyo/NAlav1F9
         wx3vHkrLbSGcQ==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 17 Jul 2023 19:55:10 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Oleg Nesterov <oleg@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64/ptrace: Fix an error handling path in sve_set_common()
Date:   Mon, 17 Jul 2023 19:55:05 +0200
Message-Id: <aa61301ed2dfd079b74b37f7fede5f179ac3087a.1689616473.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

All error handling paths go to 'out', except this one. Be consistent and
also branch to 'out' here.

Fixes: e12310a0d30f ("arm64/sme: Implement ptrace support for streaming mode SVE registers")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
/!\ Speculative /!\

   This patch is based on analysis of the surrounding code and should be
   reviewed with care !

   If the patch is wrong, maybe a comment in the code could explain why.

/!\ Speculative /!\
---
 arch/arm64/kernel/ptrace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index d7f4f0d1ae12..9bc23f1b499e 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -884,7 +884,8 @@ static int sve_set_common(struct task_struct *target,
 			break;
 		default:
 			WARN_ON_ONCE(1);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out;
 		}
 
 		/*
-- 
2.34.1

