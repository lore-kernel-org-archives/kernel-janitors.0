Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DE6C433EF
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Nov 2021 16:16:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FB6D60FD7
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Nov 2021 16:16:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236073AbhKNQTJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 14 Nov 2021 11:19:09 -0500
Received: from smtp10.smtpout.orange.fr ([80.12.242.132]:65457 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235630AbhKNQTG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 14 Nov 2021 11:19:06 -0500
Received: from pop-os.home ([86.243.171.122])
        by smtp.orange.fr with ESMTPA
        id mIAomJU7s3ptZmIApmabW3; Sun, 14 Nov 2021 17:16:09 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 14 Nov 2021 17:16:09 +0100
X-ME-IP: 86.243.171.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] sched/rt: Slightly optimize 'init_rt_rq()'
Date:   Sun, 14 Nov 2021 17:16:05 +0100
Message-Id: <c9b56712763de62c90b71907323a6b0e5b61b249.1636906450.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

'MAX_RT_PRIO' is 100. Instead of clearing bits in 'array->bitmap' one at a
time, use 'bitmap_clear()' which will do the same but much faster

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure that this patch is really of any use, but it is the occasion for
me to spot that there seems to be an off by one in the rt scheduler.

'array->bitmap' is MAX_RT_PRIO+1 long. (see [1])
The last bit seems to be reserved as a sentinel.

Shouldn't this sentinel, in the code above, be set as:
  __set_bit(MAX_RT_PRIO + 1, array->bitmap);
?

I don't know if it is an issue or not, but it looks odd to me.

[1]: https://elixir.bootlin.com/linux/latest/source/kernel/sched/sched.h#L254
---
 kernel/sched/rt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index bb945f8faeca..fc2e9c5e874a 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -81,10 +81,9 @@ void init_rt_rq(struct rt_rq *rt_rq)
 	int i;
 
 	array = &rt_rq->active;
-	for (i = 0; i < MAX_RT_PRIO; i++) {
+	for (i = 0; i < MAX_RT_PRIO; i++)
 		INIT_LIST_HEAD(array->queue + i);
-		__clear_bit(i, array->bitmap);
-	}
+	bitmap_clear(array->bitmap, 0, MAX_RT_PRIO);
 	/* delimiter for bitsearch: */
 	__set_bit(MAX_RT_PRIO, array->bitmap);
 
-- 
2.30.2

