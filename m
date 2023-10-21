Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165DBC004C0
	for <kernel-janitors@archiver.kernel.org>; Sat, 21 Oct 2023 14:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbjJUOmu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 21 Oct 2023 10:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbjJUOmt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 21 Oct 2023 10:42:49 -0400
Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1592FD5B
        for <kernel-janitors@vger.kernel.org>; Sat, 21 Oct 2023 07:42:46 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id uDBbqgbfUVj79uDBbqzxvu; Sat, 21 Oct 2023 16:42:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1697899364;
        bh=3H3iB1o0U56oUpj2NNlHh/Qb8eqSMHeR5kXDOCLd6wk=;
        h=From:To:Cc:Subject:Date;
        b=TSxMsNg7DMA+AP8vkTnZTGrRP4BHceZpcG3u/RSZgmZEFDfU957Vbw5xZpAOfj8VT
         zI4ns9LJxrWO0UvRes9B2Z+KuA0uuKicVJvqMJxJxFWaLYfeC60d4kq8t2otC3yxM9
         Nmz9ohk18Nf+Ikrv8QXZ9hVBkrOgEA72h4U9uMyV8YVj/LPP4AVqz3NwuzSWUqQap/
         MMJ+Q1OOhVFMk9XmfwCsir9tindADxYRFflTmt//s4AuMR78MB5+J698bCY+zBBvz5
         wtHnTJohx93zkdH9q/N9Nzbfgru9AOGjD55vepHuSgFBhROWUHNBn/YLaVYEPRYZJh
         ea3uoSSPQjhzw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 21 Oct 2023 16:42:44 +0200
X-ME-IP: 86.243.2.178
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-trace-kernel@vger.kernel.org
Subject: [PATCH] tracing/histograms: Simplify last_cmd_set()
Date:   Sat, 21 Oct 2023 16:42:41 +0200
Message-Id: <30b6fb04dadc10a03cc1ad08f5d8a93ef623a167.1697899346.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Turn a kzalloc()+strcpy()+strncat() into an equivalent and less verbose
kasprintf().

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 kernel/trace/trace_events_hist.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index d06938ae0717..1abc07fba1b9 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -774,23 +774,16 @@ static void last_cmd_set(struct trace_event_file *file, char *str)
 {
 	const char *system = NULL, *name = NULL;
 	struct trace_event_call *call;
-	int len;
 
 	if (!str)
 		return;
 
-	/* sizeof() contains the nul byte */
-	len = sizeof(HIST_PREFIX) + strlen(str);
 	kfree(last_cmd);
-	last_cmd = kzalloc(len, GFP_KERNEL);
+
+	last_cmd = kasprintf(GFP_KERNEL, HIST_PREFIX "%s", str);
 	if (!last_cmd)
 		return;
 
-	strcpy(last_cmd, HIST_PREFIX);
-	/* Again, sizeof() contains the nul byte */
-	len -= sizeof(HIST_PREFIX);
-	strncat(last_cmd, str, len);
-
 	if (file) {
 		call = file->event_call;
 		system = call->class->system;
-- 
2.34.1

