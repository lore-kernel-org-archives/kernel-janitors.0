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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB34BC433E2
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 00:19:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9820661A02
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 Mar 2021 00:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbhC0ASY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 Mar 2021 20:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbhC0ASP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 Mar 2021 20:18:15 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71C9C0613B1
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 17:18:15 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id q9so3838006qvm.6
        for <kernel-janitors@vger.kernel.org>; Fri, 26 Mar 2021 17:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ULl5i6QZDGcY8rf+lBVOmLulCqLPblhBV9u/OHfmxIo=;
        b=SZPVixsRU4T/+wDGHGnnn4dW5c+dn9WsH3fDrURS4ytCYT6h2Wyck4pN+St7zliWA/
         rNtTqAUMfjkXVu1jB/P/KJmYcga39rig0TLg46Ow0x3uJzxcex5JmjartKuXvBQL5FQQ
         uIY/e1MQizrEOkDvm42cQgi6GJBGbTB5dpnJrdL48Z9utlB6ASuHJhq5jRQvkaxn+4A8
         5TdoeBmyjufsq/cXh3EqeYQ/cHD0cz1ILprbQxHrMa1dl8tYqqdsWlEG73iO5WaXN4L1
         NwWg6fUMOhU0/8IyTEdVb1sbxGtJjfO/tFENh40v+Ca/R0uLFLCMzSUOe3Ul5YWASx0P
         NQBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ULl5i6QZDGcY8rf+lBVOmLulCqLPblhBV9u/OHfmxIo=;
        b=XF9BDuyAhtGMFWWCvwpa9l2rfIvaiApFDtGYx7iV5hRtyzJXTf4HCku0shAGbB2Txa
         FB6W91SN6ClfukmWMyYzI2fol6++FHqdK5Zy8KPvugZQkfOyaM4Uz8WoC2dSIgVABEZG
         ynfv/ZNy9BHlKGJfbd0ROg3ce6t83m+TbWMFl/q62SXGYNFZDhQnmbH5C4qEky1w7ypE
         1I5qGoo95zLZItCSLcfHnvVoky+wJHPK0TNLiM+2Kypo5YNjA2XCepE13uo4vh85dpb+
         Tf6v0qOA6DOzAUPcg07DD+DAkDyE1nY/sxJ0oI/807+31JSZFmujcrvtFNB22ZAbOH99
         gYAg==
X-Gm-Message-State: AOAM533gi2aRWe1WoktZcITjIEhbCytrAINAiww/7/uqKhzkjIo38FXW
        rC4vem6M6UM1sXFizHHIDHY=
X-Google-Smtp-Source: ABdhPJy2jhMeUMdNwm9j8YTRpZuoCLE6G2V9G3zpV5UAso2l08IN32RaUh4efigi224YqiI1HsSA6A==
X-Received: by 2002:a05:6214:1424:: with SMTP id o4mr15674997qvx.34.1616804294924;
        Fri, 26 Mar 2021 17:18:14 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id z2sm8213531qkg.22.2021.03.26.17.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 17:18:14 -0700 (PDT)
From:   Edmundo Carmona Antoranz <eantoranz@gmail.com>
To:     gregkh@linuxfoundation.org, marcocesati@gmail.com,
        dan.carpenter@oracle.com, ross.schm.dev@gmail.com,
        fabioaiuto83@gmail.com, linux-staging@lists.linux.dev
Cc:     kernel-janitors@vger.kernel.org,
        Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next 4/6] staging: rtl8723bs: sdio_ops: removing unused variable
Date:   Fri, 26 Mar 2021 18:17:34 -0600
Message-Id: <20210327001736.180881-4-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327001736.180881-1-eantoranz@gmail.com>
References: <20210327001736.180881-1-eantoranz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Inside sd_int_dpc(), variable report is set but it's never read.
Getting rid of it.

Removing this warning:

drivers/staging/rtl8723bs/hal/sdio_ops.c:946:30: warning: variable ‘report’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 170a28f4b191..a24a39e70454 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -943,11 +943,9 @@ void sd_int_dpc(struct adapter *adapter)
 	}
 
 	if (hal->sdio_hisr & SDIO_HISR_CPWM1) {
-		struct reportpwrstate_parm report;
-
 		del_timer_sync(&(pwrctl->pwr_rpwm_timer));
 
-		report.state = SdioLocalCmd52Read1Byte(adapter, SDIO_REG_HCPWM1_8723B);
+		SdioLocalCmd52Read1Byte(adapter, SDIO_REG_HCPWM1_8723B);
 
 		_set_workitem(&(pwrctl->cpwm_event));
 	}
-- 
2.30.2

