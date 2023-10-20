Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63CCC001DF
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 13:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377405AbjJTNwy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Oct 2023 09:52:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377304AbjJTNwx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 09:52:53 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160F7A3
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 06:52:51 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4081ccf69dcso11819905e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 06:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697809969; x=1698414769; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=41AXEYL2MTPfgKVH5aNADWWFa3XRT47NKp3h4dL1PFU=;
        b=yJfglORout7j5Pw8SDYTSO2k6er2ERv3Kd1EynNSnHOuSbeB+2U/RdbDEtZnVSJ94r
         WIdrX31xtIsvu2U4YnY2EkvzeqK87HhxCo+BCZH+Wvli83fAgr83W+1bAEVukBBtE1Vy
         hokiyNb+z5nZZcZBqvhoZ7fxwOS7nIFWtNqAWpUcaj2R6+Kh83qdRMSbufdaKApkLYm9
         MW1pPBmg48etLVI2jBndQGQTqKLYnBeE7Vf+r77g4opSUumQbmgMjYxpyLDEDR+jKfSK
         hmpM47q9daASrxjxKiCBEoqgX/+yP3E8C2KWw2aHQXn873U3yPHEs2wCz1Ug7n+tDxZR
         LiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697809969; x=1698414769;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=41AXEYL2MTPfgKVH5aNADWWFa3XRT47NKp3h4dL1PFU=;
        b=e79LAiQtLJdjLAirq3Qh4YGZTCSbjwu2uCl5aWS1dYuEmzHRDWYgOzTHfLyoSEhqSm
         JL0kV5eQQchWqPO5hOIVvFyHiFjR/ReqDdLsB9UNxA2hZOJu9dCVr+NBUnxbLA36jMvq
         r0i9hqP+o+urFM5epoUQFaFukwOVXDa9NKaAiHPa3jiUUlVm6Ep9lmXdtgQRLDi03B2a
         Qfdt6UBUPKmiWRL5q2iy4KPgTu108tpfAzjBUNm8aQ4N89xz4bjNe6VE5NIny4pg4sil
         XptjkZHD1eFCJ5W/RZ57MW/EILPfVW0h55nKk4atKqJ5Igxq2tK1BMwI5wfMh56xrRC0
         rvqA==
X-Gm-Message-State: AOJu0YwQriewvKrw6xvGhDG11GvFpyGm7D3clxSk2jPG5UOnIJtQUTbA
        FBcc3pYV52dRuBbh8WDkgVxWNg==
X-Google-Smtp-Source: AGHT+IEsZZQsbAsyA0Ig8P8MK1b+yiaG8YgbGiIWc7MmG1HASfAtJ/ccHPH8BqbpqkkNYe5SHtyx0w==
X-Received: by 2002:a05:600c:35c3:b0:402:ebe1:7960 with SMTP id r3-20020a05600c35c300b00402ebe17960mr1872710wmq.2.1697809969422;
        Fri, 20 Oct 2023 06:52:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c431500b004076f522058sm6959791wme.0.2023.10.20.06.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 06:52:49 -0700 (PDT)
Date:   Fri, 20 Oct 2023 16:52:45 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        linux-trace-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] tracing: Fix a NULL vs IS_ERR() bug in event_subsystem_dir()
Message-ID: <ff641474-84e2-46a7-9d7a-62b251a1050c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The eventfs_create_dir() function returns error pointers, it never returns
NULL.  Update the check to reflect that.

Fixes: 5790b1fb3d67 ("eventfs: Remove eventfs_file and just use eventfs_inode")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 kernel/trace/trace_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index db46d2116500..f9e3e24d8796 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -2354,7 +2354,7 @@ event_subsystem_dir(struct trace_array *tr, const char *name,
 		nr_entries = ARRAY_SIZE(system_entries);
 
 	ei = eventfs_create_dir(name, parent, system_entries, nr_entries, dir);
-	if (!ei) {
+	if (IS_ERR(ei)) {
 		pr_warn("Failed to create system directory %s\n", name);
 		__put_system(system);
 		goto out_free;
-- 
2.42.0

