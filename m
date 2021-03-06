Return-Path: <SRS0=552U=IE=vger.kernel.org=kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20671C433E0
	for <kernel-janitors@archiver.kernel.org>; Sat,  6 Mar 2021 21:08:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E47B6650AE
	for <kernel-janitors@archiver.kernel.org>; Sat,  6 Mar 2021 21:08:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbhCFVIS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 6 Mar 2021 16:08:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbhCFVIM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 6 Mar 2021 16:08:12 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5469C06174A
        for <kernel-janitors@vger.kernel.org>; Sat,  6 Mar 2021 13:08:11 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id d20so5714004qkc.2
        for <kernel-janitors@vger.kernel.org>; Sat, 06 Mar 2021 13:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v/hARNVlmfJhCF/CpQp7yIp70lHE9ddmP/7JAAB146A=;
        b=ELkRiHbxzBxuhsTW5Ufqkjz4z39BVziFjAXZdaPlLU9R0Na2ThZvYD7eCkumhzjzbe
         fjNFVsbPgwZUuW+SJ9nclxbrZzH3CcTRl/5YixnWRWqT+/LsyZ94wAnWoDHeteDrCMnz
         Nl7o09a4NkFrH6ILJ+5VfW6ErBNDgmqnxoXtiSf8RzydqvyzRU5pqzomjskt7KtlZUKO
         4zOokqtMlQWORRVW/sXhQj7b5muERb2PuepsNhzDomQd9qlPqePmE46ufe8BY9JfETWE
         D1IyJc5Wm/FohcoMfujUb1b4R68H4d3pkcV8Ydx3VF7v04jWqM3xA0O0lwOqkawFsW7r
         nZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v/hARNVlmfJhCF/CpQp7yIp70lHE9ddmP/7JAAB146A=;
        b=ZkyHK3bTBbKBDhP1Ej8oxg8qOpCinyCi5e6WjF/8z4wIeiYsJ2QE+VXBCcsxZ3scHy
         3QjkLHSJ1jMVCEU6AY0Dm8x5M1twUMvaCjPXVT136YLNDKrEqiXOJ5NAeQTA+/q+4CQq
         x04dpoRtM+yFGEimo7oLC8KPB0Z7HaFbMziqiEShRF8ragiYo4vLcN8mYhOfaWkVuRQu
         L0KnRZjSZVWTy0EfK7a+gqGeDSN6xxPkNdhESb8yIxgLwLtkrxFxx1fpPRgtNykbQIlG
         YtJQbf9CInaw2+bH3kq6DN2y2I6mHfE/WaZ00qEpruIKQlpq5TZBgwYjHGN+BZf+lo6h
         vfwA==
X-Gm-Message-State: AOAM5333IpFQhHHKNPx/++aWkp8cGPoBpYFKi/2/wPtGc/sDULOW7o21
        iIgvbq7CgnT/tBxz1beF6KF9Ld3GxoOgkw==
X-Google-Smtp-Source: ABdhPJyYq13e2taCeR545Wgs0Zj6jZph8d5K66Jv3g/hh3o++JLnen+eaXEPf1SNk95DXtBtkBAapA==
X-Received: by 2002:a37:688f:: with SMTP id d137mr14926843qkc.246.1615064889768;
        Sat, 06 Mar 2021 13:08:09 -0800 (PST)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id r3sm4637393qkm.129.2021.03.06.13.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 13:08:09 -0800 (PST)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     kernel-janitors@vger.kernel.org
Cc:     peterz@infradead.org,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH] kernel: sched: remove unnecessary variable from schedule_tail()
Date:   Sat,  6 Mar 2021 15:07:39 -0600
Message-Id: <20210306210739.1370486-1-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Since 565790d28b1 (sched: Fix balance_callback(), 2020-05-11), there
is no longer a need to reuse the result value of the call to finish_task_switch()
inside schedule_tail(), therefore the variable used to hold that value
(rq) is no longer needed.

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 kernel/sched/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index ca2bb629595f..8d89d106b724 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4246,8 +4246,6 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 asmlinkage __visible void schedule_tail(struct task_struct *prev)
 	__releases(rq->lock)
 {
-	struct rq *rq;
-
 	/*
 	 * New tasks start with FORK_PREEMPT_COUNT, see there and
 	 * finish_task_switch() for details.
@@ -4257,7 +4255,7 @@ asmlinkage __visible void schedule_tail(struct task_struct *prev)
 	 * PREEMPT_COUNT kernels).
 	 */
 
-	rq = finish_task_switch(prev);
+	finish_task_switch(prev);
 	preempt_enable();
 
 	if (current->set_child_tid)
-- 
2.30.1

