Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF02CC433E6
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Mar 2021 15:03:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC82464EEC
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Mar 2021 15:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhCNPCx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhCNPC3 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 14 Mar 2021 11:02:29 -0400
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com [IPv6:2607:f8b0:4864:20::92b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86BC9C061574
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Mar 2021 08:02:29 -0700 (PDT)
Received: by mail-ua1-x92b.google.com with SMTP id j4so3403071uan.1
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Mar 2021 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jZoF5w0xSMFMwfsBfAPJxb2gcM2CGk2gEsSPKVbYTMw=;
        b=Au6BIn3h2lKmyDxMg/YGx4dqdn2JFrw1PYfPDLKwa8PyBFlUFeRx9irxX7SQaeVXSC
         GsplBd3okY/Hoj9hHJ4S48iuUJtftEOi8Jf44qCy+qVRRYF2sP8rIKzC74wCSQD1I0mO
         uXdFNlClM0pWVafVBKDjyUHC7JoJS3Y6cuCfEr5Ka2mlzXZi0v6MQzu1pDBRCBO6Zwv6
         +oWZBfZ8NViYMEhX48ypA3eIEWgui1HJRoDDA2Zc5VAg2US0jgNtO2unrFzy5W+2RWGn
         cjiIZZo42y4vIDHty8E602Xs2cITpjCYERGeiYMEP+XRLJzx9FeAApYfBTDj/cgdWq9W
         lKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jZoF5w0xSMFMwfsBfAPJxb2gcM2CGk2gEsSPKVbYTMw=;
        b=c5nFaCVAdQcZieue3ceSy8Mgq4Pf85WtSTNseeYAOws9EEP8QBIJm1/j0mrZ7H7aNo
         fnQtmFqhfEqsiYNhkseY2mD/AbX+i+U6ebFoQ8PCLXnIdCT5nYZ2ge5kNa4Nqfotda/T
         NeKZBbPPRaY3UT6EwMDL0Gaad5WWiom5+h144qGD7gxvCnVyixyj4gmD2ApNmL20zG+q
         73gn8GVnEOJcyUH1RCBs8U0BZsom6RgdjEBq2te7IFCEf1N78qu+uNJ0wguG0HTA4zq3
         mqthaPBFTpohCOtIDkdkC0kfMUyAy1vqcdWOmzAzJ7KdXbG3FTVfPvnW9BjY+DufhIu6
         4urQ==
X-Gm-Message-State: AOAM531yyOzKpQf079bUnswKebZTnATGmaoJ4zfgz7OJ2kPhSE7q05KB
        Xz54p9VCZJ6rfRuFmBkXgdw=
X-Google-Smtp-Source: ABdhPJze352Eg1BRNMHucAT82tOqwH94y/jsTL9P8ddNQNol5FHFh33cxyFg22RdLl3JqUqqy/MZ7w==
X-Received: by 2002:a9f:3230:: with SMTP id x45mr3214004uad.23.1615734148558;
        Sun, 14 Mar 2021 08:02:28 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id 4sm583451vsl.19.2021.03.14.08.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 08:02:28 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org
Cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next 1/3] staging: vt6655: remove unused variable
Date:   Sun, 14 Mar 2021 08:59:41 -0600
Message-Id: <20210314145943.1933245-1-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Since its introduction in 5449c685a4b3 (Staging: Add pristine
upstream vt6655 driver sources, 2009-04-25), the values
stored in variable byData have never been read in the macro
PCAvDelayByIO. By removing it, we are getting rid of a warning:

drivers/staging/vt6655/upc.h:45:16: warning: variable ‘byData’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 drivers/staging/vt6655/upc.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/upc.h b/drivers/staging/vt6655/upc.h
index e086ec6e77f7..f00d0fd90003 100644
--- a/drivers/staging/vt6655/upc.h
+++ b/drivers/staging/vt6655/upc.h
@@ -42,14 +42,13 @@
 
 #define PCAvDelayByIO(uDelayUnit)				\
 do {								\
-	unsigned char byData;					\
 	unsigned long ii;					\
 								\
 	if (uDelayUnit <= 50) {					\
 		udelay(uDelayUnit);				\
 	} else {						\
 		for (ii = 0; ii < (uDelayUnit); ii++)		\
-			byData = inb(0x61);			\
+			inb(0x61);				\
 	}							\
 } while (0)
 
-- 
2.30.1

