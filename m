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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DDAC433DB
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Mar 2021 15:03:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72D0564EC4
	for <kernel-janitors@archiver.kernel.org>; Sun, 14 Mar 2021 15:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232662AbhCNPCx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 14 Mar 2021 11:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhCNPCa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 14 Mar 2021 11:02:30 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FAA0C061574
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Mar 2021 08:02:30 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id k76so2307825vkk.10
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Mar 2021 08:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GIzovc6qLR1R8CvFRYSNyvEE4VKxCyDcqOyG7zNFiK4=;
        b=khd+XpojdSUlCuptsVcBPwgmvX0Ez+Yi4+W1O/u4BI6EvuhkBYzvuly4VqY7FMtpTI
         7GgShPsTzaRVYFqxUqg15HHt5TsY+w63tSCuiJtxMEjlBJBV1rW8rwLgLS6vqeRzo2y6
         ebRtypVYhUxmPUHxV+iZqAjgv70EoX5gIUqc7CuZ9ufheltMFyC1770frFGok2AwUB55
         +Z5mNy+uwe8u0lT4ury+wwgRrThDLUJu5cax5v0GxWCfAqXZKiPwDqwjACuT3tiE6ckB
         WFvzImsU+svhj1NuiqqCQdtRNIa+f3SLptQB2z7L1Ge97zT83+ZvaLK6Q2PVsrAzaRXH
         UUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GIzovc6qLR1R8CvFRYSNyvEE4VKxCyDcqOyG7zNFiK4=;
        b=dIxAR3AlFSp4JtFYpAtGn2ovxujDHmrAJrq9icjoO67weuc479MJEUJhazatfNVDoW
         Iq4gD5krcwAU2V7//zZBB5nPqaiEwnF+PA+6N5fm4lAlWBT3vFStDAJu4+QYo+2/HCmi
         CnnfgThhqBc+LKzyrw2BlZ9GcWyOo5VmzNTLvYGOGClqP5UXjN/SCpfqUeCovUwp83S4
         SblMjYU7ERzrgK0mfGNAaTIXnsHZTk9XBG/slKp2hHXP20oErDHki+T8exUn724ACVax
         LXt+Dw0KyUs4W2n4j22qJ9Xm+JNGYqNcPwtAcrR6ngnSxHoIQr1Vt2xAbbzS1ljUF6FH
         iRUg==
X-Gm-Message-State: AOAM53349JyNTLQD6pqPE6mwKCTNmKXTWTYa+0FjUz+DXh9JhR+L1WQj
        8A56cwuoPo5fKHrG8EWspw39+tCvsms=
X-Google-Smtp-Source: ABdhPJzT058mQWhJILWy6DN6XyMW8VNMUaEMZlwy1DJ8SP9TkIA+59z1rS8P2LRxqb1P59O0rXzuuQ==
X-Received: by 2002:a1f:38c9:: with SMTP id f192mr2799005vka.24.1615734149484;
        Sun, 14 Mar 2021 08:02:29 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id 4sm583451vsl.19.2021.03.14.08.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 08:02:29 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org
Cc:     Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next 2/3] staging: vt6655: correct documentation warnings
Date:   Sun, 14 Mar 2021 08:59:42 -0600
Message-Id: <20210314145943.1933245-2-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210314145943.1933245-1-eantoranz@gmail.com>
References: <20210314145943.1933245-1-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Both arguments to set_channel have changed their names and their
types. Correct the discrepancy in the function documentation to get
rid of four warnings:

drivers/staging/vt6655/channel.c:165: warning: Function parameter or member 'priv' not described in 'set_channel'
drivers/staging/vt6655/channel.c:165: warning: Function parameter or member 'ch' not described in 'set_channel'
drivers/staging/vt6655/channel.c:165: warning: Excess function parameter 'pDeviceHandler' description in 'set_channel'
drivers/staging/vt6655/channel.c:165: warning: Excess function parameter 'uConnectionChannel' description in 'set_channel'

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 drivers/staging/vt6655/channel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index 889fc22f19bd..ba92b7259ec6 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -155,8 +155,8 @@ void vnt_init_bands(struct vnt_private *priv)
 /**
  * set_channel() - Set NIC media channel
  *
- * @pDeviceHandler: The adapter to be set
- * @uConnectionChannel: Channel to be set
+ * @priv: The adapter to be set
+ * @ch: Channel to be set
  *
  * Return Value: true if succeeded; false if failed.
  *
-- 
2.30.1

